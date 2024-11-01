package com.spring_boot_dolls_ticket.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_dolls_ticket.project.model.AssignmentNoticeBoardVO;
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
			sum = sum + transfer2vo.getTotalSeatPrice();
			
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
		
		model.addAttribute("list", list);
		model.addAttribute("totalPrice", sum);
		
		model.addAttribute("itemName", sb.toString());
		
		return "transfer/pay";
	}
	
	@RequestMapping("/receive/complete")
	@Transactional
	public String registrationForm5(HttpSession session, 
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
				    rslt.get(i).getPerformancePrice());
				
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
	

}
