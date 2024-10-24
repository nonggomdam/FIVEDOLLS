package com.spring_boot_dolls_ticket.project.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.service.PerformanceService;

@Controller
public class AdminController {
	
	@Autowired
	PerformanceService performanceService;
	
	// 관리자 메인 페이지 이동 처리
	@RequestMapping("/admin")
	public String adminMainPage(Model model) {
		
		ArrayList<PerformanceVO> performanceList = performanceService.listAllPerformance();
		
		model.addAttribute("performanceList", performanceList);
		
		return "admin/adminMain";
		
	}
	// 관리자 상품 목록 페이지 이동 처리
	@RequestMapping("/admin/performanceList")
	public String adminPerformanceList(Model model) {
		
		ArrayList<PerformanceVO> performanceList = performanceService.listAllPerformance();
		
		model.addAttribute("performanceList", performanceList);
		
		return "admin/performanceList";
		
	}
	// 관리자 공연 상세 정보 페이지 이동 처리
	@RequestMapping("/admin/performanceDetailView/{performanceId}")
	public String adminPerformanceDetailView(@PathVariable String performanceId, Model model) {
		
		PerformanceVO performance = performanceService.detailViewPerformance(performanceId);
		
		model.addAttribute("performance", performance);
		
		return "admin/performanceDetailView";
		
	}
	// 관리자 공연 정보 수정 페이지 이동 처리
	@RequestMapping("/admin/updatePerformanceForm/{performanceId}")
	public String updatePerformanceForm(@PathVariable String performanceId, Model model) {
		
		PerformanceVO performance = performanceService.detailViewPerformance(performanceId);
		
		model.addAttribute("performance", performance);
		
		return "admin/updatePerformanceForm";
		
	}
	// 관리자 공연 정보 수정 처리
	@RequestMapping("/admin/updatePerformance")
	public String updatePerformance(@ModelAttribute PerformanceVO performance, @RequestParam("performancePoster") MultipartFile performancePoster, @RequestParam("performanceInfoImg") MultipartFile performanceInfoImg) throws IllegalStateException, IOException {
	
        performanceService.updatePerformance(performance, performancePoster, performanceInfoImg);
       
        return "redirect:/admin/performanceList";  // 공연 목록 페이지로 리다이렉트
		
	}
	// 관리자 특정 공연 정보 삭제 처리
	@RequestMapping("/admin/deletePerformance/{performanceId}")
	public String deletePerformance(@PathVariable String performanceId) {
		
		performanceService.deletePerformance(performanceId);
		
		return "redirect:/admin/performanceList";
		
	}
	// 관리자 공연 정보 등록
	@RequestMapping("/admin/newPerformanceForm")
	public String newPerformanceForm() {
		
		return "admin/newPerformanceForm";
		
	}
	// 관리자 공연 정보 등록 처리
    @RequestMapping("/admin/insertPerformance")
    public String insertPerformance(@ModelAttribute PerformanceVO performance,
                                    @RequestParam("performancePoster") MultipartFile performancePoster,
                                    @RequestParam("performanceInfoImg") MultipartFile performanceInfoImg) throws IllegalStateException, IOException {
        
        // 공연 정보를 DB에 등록하고 이미지 경로를 업데이트
        performanceService.insertPerformance(performance, performancePoster, performanceInfoImg);

        return "redirect:/admin/performanceList";
    }

}