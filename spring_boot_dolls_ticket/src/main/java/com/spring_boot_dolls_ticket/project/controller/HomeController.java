package com.spring_boot_dolls_ticket.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index() {
		
		return "index";
		
	}
	@RequestMapping("/csAdmin")
	public String adminPage() {
		
		return "customerService/csAdmin";
		
	}
	@RequestMapping("member/myPage")
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
	
}
