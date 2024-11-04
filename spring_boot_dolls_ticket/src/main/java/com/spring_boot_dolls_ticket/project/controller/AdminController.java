package com.spring_boot_dolls_ticket.project.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_dolls_ticket.project.model.NoticeVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceSeatVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.service.NoticeService;
import com.spring_boot_dolls_ticket.project.service.PerformanceService;

@Controller
public class AdminController {
	
	@Autowired
	PerformanceService performanceService;
	
	@Autowired
	NoticeService noticeService;
	
	// 관리자 메인 페이지 이동 처리
	@RequestMapping("/admin")
	public String adminMainPage(Model model) {
		
		ArrayList<PerformanceVO> performanceList = performanceService.listAllPerformance();
		ArrayList<NoticeVO> noticeList = noticeService.listAllNotice();
		
		model.addAttribute("performanceList", performanceList);
		model.addAttribute("noticeList", noticeList);
		
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
		PerformanceSeatVO location = performanceService.getLocation(performance.getPerformanceLocationId());
		
		model.addAttribute("performance", performance);
		model.addAttribute("performanceLocation", location);
		
		return "admin/performanceDetailView";
		
	}
	// 관리자 공연 정보 수정 페이지 이동 처리
	@RequestMapping("/admin/updatePerformanceForm/{performanceId}")
	public String updatePerformanceForm(@PathVariable String performanceId, Model model) {
		
		PerformanceVO performance = performanceService.detailViewPerformance(performanceId);
		Date performanceDate1 = performance.getPerformanceDate1();
		Date performanceDate2 = performance.getPerformanceDate2();
		Date reservationOpenExpectedDate = performance.getReservationOpenExpectedDate();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		List<PerformanceSeatVO> locationList = performanceService.locationList();
		
		model.addAttribute("formattedDate1", df.format(performanceDate1));
	    model.addAttribute("formattedDate2", df.format(performanceDate2));
	    model.addAttribute("reservationOpenExpectedDate", df.format(reservationOpenExpectedDate));
		
		model.addAttribute("performance", performance);
		model.addAttribute("locationList", locationList);
		
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
	public String newPerformanceForm(Model model) {

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
    
    // 관리자 공지 사항 목록 페이지 이동 처리
 	@RequestMapping("/admin/noticeList")
 	public String noticeList(Model model) {
 		
 		ArrayList<NoticeVO> noticeList = noticeService.listAllNotice();
 		
 		model.addAttribute("noticeList", noticeList);
 		
 		return "admin/noticeList";
 		
 	}
 	
 	// 관리자 공지 사항 등록
 	@RequestMapping("/admin/newNoticeForm")
	public String newNoticeForm(Model model) {
		
		return "admin/newNoticeForm";
		
	}
 	// 관리자 공지 사항 등록 처리
    @RequestMapping("/admin/insertNotice")
    public String insertNotice(@ModelAttribute NoticeVO notice)  {
        
        // 공연 정보를 DB에 등록하고 이미지 경로를 업데이트
        noticeService.insertNotice(notice);

        return "redirect:/admin/noticeList";
    }
    // 관리자 공지 사항 상세 페이지 이동 처리
 	@RequestMapping("/admin/noticeDetailView/{noticeNo}")
 	public String noticeDetailView(@PathVariable int noticeNo, Model model) {
 		
 		NoticeVO notice = noticeService.detailViewNotice(noticeNo);
 		
 		model.addAttribute("notice", notice);
 		
 		return "admin/noticeDetailView";
 		
 	}
	// 관리자 공지 사항 수정 페이지 이동 처리
	@RequestMapping("/admin/updateNoticeForm/{noticeNo}")
	public String updateNoticeForm(@PathVariable int noticeNo, Model model) {
		
		NoticeVO notice = noticeService.detailViewNotice(noticeNo);
		
		model.addAttribute("notice", notice);
		
		return "admin/updateNoticeForm";
		
	}
	// 관리자 공지 사항 수정 처리
	@RequestMapping("/admin/updateNotice")
	public String updateNotice(@ModelAttribute NoticeVO notice) {
	
        noticeService.updateNotice(notice);
       
        return "redirect:/admin/noticeList";  // 공연 목록 페이지로 리다이렉트
		
	}
	// 관리자 공지 사항 삭제 처리
	@RequestMapping("/admin/deleteNotice/{noticeNo}")
	public String deleteNotice(@PathVariable int noticeNo) {
		
		noticeService.deleteNotice(noticeNo);
		
		return "redirect:/admin/noticeList";
		
	}

}