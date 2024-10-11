package com.spring_boot_dolls_ticket.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import jakarta.security.auth.message.callback.PrivateKeyCallback.Request;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_dolls_ticket.project.model.AssignmentNoticeBoardVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicketVO;
import com.spring_boot_dolls_ticket.project.model.TransferVO;
import com.spring_boot_dolls_ticket.project.service.TransferService;

@Controller
public class TransferController {

	@Autowired
	TransferService tservice;
	
	@RequestMapping("/transfer/login")
	public String login(HttpSession session ) {
		session.setAttribute("userId", "kingsMan");
		return "redirect:/transfer/list";
	}
	
	@RequestMapping("/transfer/login2")
	public String login2(HttpSession session) {
		session.setAttribute("userId", "kingsGirl");
		
		return "redirect:/transfer/list";
	}
	
	@RequestMapping("/transfer/login3")
	public String login3(HttpSession session) {
		session.setAttribute("userId", null);
		
		return "redirect:/transfer/list";
	}
	
	
	@RequestMapping("/transfer/regForm")
	public String registerTransfer(HttpSession session, Model model) {
		
		String custId=(String)session.getAttribute("userId");
		
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
								 @RequestParam("reservationNumber") String[] reservationNumber,
								 Model model, HttpSession session) {
		
		String custId=(String)session.getAttribute("userId");
	
		AssignmentNoticeBoardVO vo = new AssignmentNoticeBoardVO();
		vo.setNoticeTitle(noticeTitle);
		vo.setCustId(custId);
		vo.setAssignmentStatus("A");
		vo.setReservationNumber(reservationNumber);
		
		
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
	
	@RequestMapping("/receive/complete")
	public String registrationForm5(HttpSession session, 
									@RequestParam("noticeId") String noticeId,
									@RequestParam("seatAndId") String[] values) {
		
		String receiveId=(String)session.getAttribute("userId");
		
		AssignmentTicketVO ticketvo = new AssignmentTicketVO();
		ticketvo.setNoticeId(noticeId); 
		ticketvo.setReceiveCustId(receiveId);
		

		for(String value:values) { 
	      String[] parts = value.split("@"); 
	      System.out.println(Arrays.toString(parts));
		  
	      String performanceId = parts[0]; 
		  ticketvo.setPerformanceId(performanceId);
		  
		  String reservationSeatInformation = parts[1]; 
		  ticketvo.setReservationSeatInformation(reservationSeatInformation);
		  
		  int ticketUpdate=tservice.updateAssignmentTicket(ticketvo);
		  System.out.println(ticketUpdate);
		}
		 
		 
		return "transfer/ticketHubReceiveComplete";
	}
}
