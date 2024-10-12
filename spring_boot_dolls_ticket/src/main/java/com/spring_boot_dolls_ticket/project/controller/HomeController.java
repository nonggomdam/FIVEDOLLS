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
	
	@RequestMapping("/performance/musical")
	public String musical() {
		
		return "performance/musical";
		
	}
	
	@RequestMapping("/performance/concert")
	public String concert() {
		
		return "performance/concert";
		
	}
}
