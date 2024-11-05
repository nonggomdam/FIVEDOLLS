package com.spring_boot_dolls_ticket.project.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_boot_dolls_ticket.project.common.TransOrderNumGen;
import com.spring_boot_dolls_ticket.project.model.AssignmentNoticeBoardVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentOrderDetailVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentOrderVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicket2VO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicketVO;
import com.spring_boot_dolls_ticket.project.model.Transfer2VO;
import com.spring_boot_dolls_ticket.project.model.TransferEmailMessageVO;
import com.spring_boot_dolls_ticket.project.model.TransferVO;
import com.spring_boot_dolls_ticket.project.service.TransferEmailService;
import com.spring_boot_dolls_ticket.project.service.TransferService;

import jakarta.servlet.http.HttpSession;

@Controller
public class TransferController {

	@Autowired
	TransferService tservice;
	
	@Autowired
	TransferEmailService mailservice;
	
	@RequestMapping("/transfer/login")
	public String login(HttpSession session ) {
		session.setAttribute("sid", "kingsMan");
		return "redirect:/transfer/list";
	}
	
	@RequestMapping("/transfer/login2")
	public String login2(HttpSession session) {
		session.setAttribute("sid", "kingsGirl");
		
		return "redirect:/transfer/list";
	}
	
	@RequestMapping("/transfer/login3")
	public String login3(HttpSession session) {
		session.setAttribute("sid", null);
		
		return "redirect:/transfer/list";
	}
	
	@RequestMapping("/transfer/success/{redirect}")
	public String redirect(@PathVariable("redirect") String redirect, Model model ) {
		model.getAttribute("msg");
		return "transfer/" + redirect;
	}
	
	@RequestMapping("/transfer/regForm")
	public String registerTransfer(HttpSession session, Model model) {
		
		String custId=(String)session.getAttribute("sid");
		
		if(custId == null) {
			model.addAttribute("msg", "로그인이 필요합니다."); 
			return "transfer/ticketHubAskLogin";
		}
		
		ArrayList<TransferVO>  regist = tservice.showTransInfo(custId);
		
		
		model.addAttribute("showInfo", regist);
		
		
		if(regist.size()==0) {
			model.addAttribute("msg", "예매한 티켓이 존재하지 않습니다");
			model.addAttribute("msg2", "나의 예매내역을 확인해주세요");
			return "transfer/ticketHubError";	
		}
		
		return "transfer/ticketHubFillOut";
	}
	
	
	@RequestMapping("/transfer/list")
	public String transferList(Model model) {
		
		ArrayList<AssignmentNoticeBoardVO> list = tservice.selectAssignmentNotice();
		
		model.addAttribute("list", list);
		
		return "transfer/ticketHubList";
	}
	
	@RequestMapping("/transfer/regist")
	public String transferRegist(@RequestParam("noticeTitle") String noticeTitle,
								 @RequestParam("reservationId") String[] reservationId,
								 Model model, HttpSession session) {
		
		String custId=(String)session.getAttribute("sid");
	
		AssignmentNoticeBoardVO vo = new AssignmentNoticeBoardVO();
		vo.setNoticeTitle(noticeTitle);
		vo.setCustId(custId);
		vo.setAssignmentStatus("A");
		vo.setReservationId(reservationId);
		
		
		tservice.insertAssignmentNotice(vo);
		
		return "redirect:/transfer/list";
	}
	
	@RequestMapping("/transfer/inquire/{noticeId}")
	public String transferInquire(@PathVariable("noticeId") String noticeId, Model model) {

		
		int hit=tservice.updateHit(noticeId);

		HashMap<String, Object> map=tservice.selectAssignmentNotice(noticeId);
		
		
		model.addAttribute("nb", map.get("nb"));
		model.addAttribute("list", map.get("list"));
		
		
		
		return "transfer/ticketHubInquire";
	}
	
	@RequestMapping("/transfer/pay")
	@Transactional
	public String pay(HttpSession session, 
			@RequestParam("noticeId") String noticeId,
			@RequestParam("assignmentSqno") String[] values, Model model) {
		
		AssignmentTicket2VO assignmentTicket2VO = new AssignmentTicket2VO();
		assignmentTicket2VO.setNoticeId(noticeId);
		assignmentTicket2VO.setAssignmentSqnos( Arrays.asList(values) );
		
		List<Transfer2VO> list =tservice.showInfoInEmail(assignmentTicket2VO);
		
		int sum = 0;
		int etcCnt=0;
		StringBuffer sb = new StringBuffer();
		for (Transfer2VO transfer2vo : list) {
			sum = sum + transfer2vo.getPrice();
			
			if(etcCnt==0) {
				sb.append( transfer2vo.getPerformanceName() );
			}
			
			etcCnt++;				
			 
		}
//		 외 2건
		etcCnt--;
		if(etcCnt > 0) {
			sb.append(" 외 ").append(etcCnt).append("건");
		}
		
		
		//주문 내역 생성
		 
		AssignmentOrderVO order = new AssignmentOrderVO();
		order.setOrderNo(TransOrderNumGen.generateOrderNumber(14));
		order.setItemContent(sb.toString());
		order.setAmount(sum);
		order.setReceiveCustId((String)session.getAttribute("sid"));
		order.setStatusCd("P");
		
		tservice.insertAssignmentOrder(order);
		
		AssignmentOrderDetailVO orderDetail = new AssignmentOrderDetailVO();
		orderDetail.setOrderNo(order.getOrderNo());
		orderDetail.setNoticeId(noticeId);
		
		for (Transfer2VO transfer2vo : list) {
			
			orderDetail.setAssignmentSqno(transfer2vo.getAssignmentSqno());
			orderDetail.setPrice(transfer2vo.getPrice());
			tservice.insertAssignmentOrderDetail(orderDetail);
			
		}
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("totalPrice", sum);
		model.addAttribute("itemName", sb.toString());
		
		//바로 양수하기를 보여주기위해 넣은 값 
		model.addAttribute("orderNo", order.getOrderNo());
		
		return "transfer/pay";
	}
	
	@RequestMapping("/receive/complete")
	@Transactional
	public String registrationForm(HttpSession session, 
									@RequestParam("noticeId") String noticeId,
									@RequestParam("assignmentSqno") String[] values) {
		
		String receiveId=(String)session.getAttribute("sid");
		
		AssignmentTicketVO ticketvo = new AssignmentTicketVO();
		ticketvo.setNoticeId(noticeId); 
		ticketvo.setReceiveCustId(receiveId);
		

		for(String value:values) {
 
	      System.out.println(" AssignmentSqno " +value);
		  
 
	      ticketvo.setAssignmentSqno(value);
	      
		  int ticketUpdate=tservice.updateAssignmentTicket(ticketvo);
		  
		  System.out.println(ticketUpdate);
		}
		
		//결제모듈
		//결제완료
		//파일 읽는 모듈 호출했다고 하면
		
		String htmlContent ="";
		try {
			Path path = Paths.get(new ClassPathResource("templates/transferEmailTemplate.html").getURI());
			
			htmlContent =  new String (  Files.readAllBytes(path) , "UTF-8" ) ;
			
			System.out.println("htmlContent 내용");
			System.out.println( htmlContent );
			
			AssignmentTicket2VO assignmentTicket2VO = new AssignmentTicket2VO();
			assignmentTicket2VO.setNoticeId(noticeId);
			assignmentTicket2VO.setAssignmentSqnos( Arrays.asList(values) );
			
			List<Transfer2VO> rslt =tservice.showInfoInEmail(assignmentTicket2VO);
			System.out.println(rslt);
			
			StringBuilder sb = new StringBuilder();
			for(int i=0; i < rslt.size();i++) {
				
				String content =  String.format("<tr><td style='border:1px solid #eeeeee;padding:5px;'><div style='widh:250px;'><span style='display: inline-block;width:70px;text-align:right;'>예매번호</span> %s</div><div style='width:250px;'><span style='display: inline-block;width:70px;text-align:right;'>공연명</span> %s</div><div style='width:250px;'><span style='display: inline-block;width:70px;text-align:right;'>공연날짜</span> %s</div><div style='width:250px;'><span style='display: inline-block;width:70px;text-align:right;'>좌석</span> %s</div><div style='width:250px;'><span style='display: inline-block;width:70px;text-align:right;'>가격</span> %,d원</div></td></tr>", 
				    rslt.get(i).getReservationId(), 
				    rslt.get(i).getPerformanceName(), 
				    rslt.get(i).getPerformanceDate(), 
				    rslt.get(i).getReservationSeatInformation(), 
				    rslt.get(i).getPrice());
				
				sb.append(content);
		
			}
			
			htmlContent = htmlContent.replace("${receiveCustId}", receiveId);
			htmlContent = htmlContent.replace("${content}", sb);
			
		} catch (IOException e) {
			System.out.println("이메일 템플릿 오류");
			e.printStackTrace();
		}
		
		
		//메일 보내기
		TransferEmailMessageVO transmail= new TransferEmailMessageVO();
		transmail.setSubject("FiveDolls에서 구매하신 티켓 내역입니다.");
		transmail.setMessage(htmlContent);
		transmail.setTo(tservice.selectEmail(receiveId));
		mailservice.send(transmail);
		//mailservice.scheduleEmailAsync(transmail);
		
		return "transfer/ticketHubReceiveComplete";
	}
	
	@RequestMapping("/success2")
	public String success(@RequestParam("orderId") String orderId,
			@RequestParam("amount") String amount,
			@RequestParam("paymentKey") String paymentKey,
			Model model
						) throws Exception {
		
		return "transfer/orderSuccess";
	}
	
	@RequestMapping("/success")
	public String orderSuccess(@RequestParam("orderId") String orderId,
			@RequestParam("amount") String amount,
			@RequestParam("paymentKey") String paymentKey,
			RedirectAttributes redirectAttributes,
			Model model
						) throws Exception {
		
		System.out.println("@@@@@@@@@@@@  confirm start");
		System.out.println("orderId : "  + orderId);
		
		AssignmentOrderVO order = new AssignmentOrderVO();
		order.setOrderNo(orderId);
		order.setStatusCd("P");
		int amt = tservice.orderVerification(order);
		
		int settleAmt = Integer.valueOf(amount);
		
		if(amt != settleAmt) {
			
			order.setPaymentKey(paymentKey);
			tservice.updateFail(order);
			
			redirectAttributes.addFlashAttribute("msg", "잘못된 접근 방식입니다. 결제진행이 중단되었습니다");
			return "redirect:/transfer/success/ticketHubError";
		}
		
		
		JSONParser parser = new JSONParser();
		
	    JSONObject obj = new JSONObject();
	    obj.put("orderId", orderId);
	    obj.put("amount", amount);
	    obj.put("paymentKey", paymentKey);
	    
	    // 토스페이먼츠 API는 시크릿 키를 Basic 인증의 사용자 ID로 사용하고, 비밀번호는 사용하지 않습니다.
	    // 비밀번호가 없다는 것을 알리기 위해 시크릿 키 뒤에 콜론을 추가합니다.
	    String widgetSecretKey = "test_gsk_docs_OaPz8L5KdmQXkzRz3y47BMw6";
	    Base64.Encoder encoder = Base64.getEncoder();
	    byte[] encodedBytes = encoder.encode((widgetSecretKey + ":").getBytes("UTF-8"));
	    String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);
	    
	    // 결제를 승인하면 결제수단에서 금액이 차감돼요.
	    URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
	    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	    connection.setRequestProperty("Authorization", authorizations);
	    connection.setRequestProperty("Content-Type", "application/json");
	    connection.setRequestMethod("POST");
	    connection.setDoOutput(true);
	    
	    System.out.println("@@@@@@@@@@@@  confirm connect");
	    
	    OutputStream outputStream = connection.getOutputStream();
	    outputStream.write(obj.toString().getBytes("UTF-8"));
	    
	    int code = connection.getResponseCode();
	    boolean isSuccess = code == 200 ? true : false;
	    
	    System.out.println("@@@@@@@@@@@@  confirm isSuccess : " + isSuccess);
	    
	    InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();
	    
	    // 결제 성공 및 실패 비즈니스 로직을 구현하세요.
	    Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
	    JSONObject jsonObject = (JSONObject) parser.parse(reader);
	    responseStream.close();
	    
	    System.out.println("@@@@@@@@@@@@  confirm 로직구현 : " + jsonObject.toJSONString());
	    
	    System.out.println("$$$$$$$$$$$1. sold_yn 체크 start");
	    //1. sold_yn 체크 
	    List<AssignmentTicketVO> checkY = tservice.selectSoldYn(orderId);
	    
	    for(AssignmentTicketVO checky : checkY) {
	    	
	    	if(checky.getSoldYn().equals("Y")) {
	    		tservice.updateAlreadySold(order);
	    		
				redirectAttributes.addFlashAttribute("msg", "이미 판매된 티켓입니다. 결제진행이 중단되었습니다");
				return "redirect:/transfer/success/ticketHubError";
	    	}
	    }

	    System.out.println("$$$$$$$$$$$1. sold_yn 체크 end");
	    
	    System.out.println("$$$$$$$$$$$2. 성공했을 때 주문번호의 상태코드 업데이트 start");
	    //2. 성공했을 때 주문번호의 상태코드 업데이트
	    order.setPaymentKey(paymentKey);
	    tservice.updateSuccess(order);
	    
	    System.out.println("$$$$$$$$$$$2. 성공했을 때 주문번호의 상태코드 업데이트 end");
	    
	    System.out.println("$$$$$$$$$$$3. 양수인 변경 start");
	    //3. 양수인 변경
	    for(AssignmentTicketVO checky : checkY) {
    		tservice.updateAssignmentTicket(checky);
	    }
	    
	    System.out.println("$$$$$$$$$$$3. 양수인 변경 end");
	    //4. 메일 전송
	    
		return "redirect:/transfer/success/ticketHubReceiveComplete";
	}
	
	@RequestMapping(value = "/confirm2")
	  public ResponseEntity<JSONObject> confirmPayment(@RequestBody String jsonBody) throws Exception {
	    
		/*
		 { ss: "sss", aa:'bbb"}
		 */
		System.out.println("@@@@@@@@@@@@  confirm start");
	    JSONParser parser = new JSONParser();
	    String orderId;
	    String amount;
	    String paymentKey;
	    try {
	      // 클라이언트에서 받은 JSON 요청 바디입니다.
	      JSONObject requestData = (JSONObject) parser.parse(jsonBody);
	      paymentKey = (String) requestData.get("paymentKey");
	      orderId = (String) requestData.get("orderId");
	      amount = (String) requestData.get("amount");
	    } catch (ParseException e) {
	      throw new RuntimeException(e);
	    };
	    
	    
		AssignmentOrderVO order = new AssignmentOrderVO();
		order.setOrderNo(orderId);
		order.setStatusCd("P");
		int amt = tservice.orderVerification(order);
		
		int settleAmt = Integer.valueOf(amount);
		
		if(amt != settleAmt) {
			//model.addAttribute("msg", "결제금액이 다릅니다.");
			JSONObject obj = new JSONObject();
			obj.put("code", "400");
			obj.put("message", "결제금액이 다릅니다.");
			
			return ResponseEntity.status(400).body(obj);
			//return "transfer/ticketHubError";
		}
	    
	    JSONObject obj = new JSONObject();
	    obj.put("orderId", orderId);
	    obj.put("amount", amount);
	    obj.put("paymentKey", paymentKey);
	    
	    
	    
	    // 토스페이먼츠 API는 시크릿 키를 Basic 인증의 사용자 ID로 사용하고, 비밀번호는 사용하지 않습니다.
	    // 비밀번호가 없다는 것을 알리기 위해 시크릿 키 뒤에 콜론을 추가합니다.
	    String widgetSecretKey = "test_gsk_docs_OaPz8L5KdmQXkzRz3y47BMw6";
	    Base64.Encoder encoder = Base64.getEncoder();
	    byte[] encodedBytes = encoder.encode((widgetSecretKey + ":").getBytes("UTF-8"));
	    String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);
	    
	    // 결제를 승인하면 결제수단에서 금액이 차감돼요.
	    URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
	    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
	    connection.setRequestProperty("Authorization", authorizations);
	    connection.setRequestProperty("Content-Type", "application/json");
	    connection.setRequestMethod("POST");
	    connection.setDoOutput(true);
	    
	    System.out.println("@@@@@@@@@@@@  confirm connect");
	    
	    OutputStream outputStream = connection.getOutputStream();
	    outputStream.write(obj.toString().getBytes("UTF-8"));
	    
	    int code = connection.getResponseCode();
	    boolean isSuccess = code == 200 ? true : false;
	    
	    System.out.println("@@@@@@@@@@@@  confirm isSuccess : " + isSuccess);
	    
	    InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();
	    
	    // 결제 성공 및 실패 비즈니스 로직을 구현하세요.
	    Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
	    JSONObject jsonObject = (JSONObject) parser.parse(reader);
	    responseStream.close();
	    
	    System.out.println("@@@@@@@@@@@@  confirm 로직구현 : ");
	    
	    
	    return ResponseEntity.status(code).body(jsonObject);
	  }

}
