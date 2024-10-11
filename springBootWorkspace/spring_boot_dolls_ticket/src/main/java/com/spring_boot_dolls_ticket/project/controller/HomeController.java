package com.spring_boot_dolls_ticket.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		
		return "index";
		
	}
	@RequestMapping("/myPage")
	public String myPage() {
		
		return "member/myPage";
		
	}
	@RequestMapping("/orderDetail")
	public String orderDetail() {
		
		return "member/orderDetail";
		
	}
	@RequestMapping("/refund")
	public String refund() {
		
		return "member/refund";
		
	}
	/*
	 * 회원정보 변경
	 */
	@RequestMapping("/myPage/MemberInfo")
	public String myPageMemberInfo() {
		
		return "member/correctionMember";
		
	}

}
