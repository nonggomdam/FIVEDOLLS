package com.spring_boot_dolls_ticket.project.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.service.PerformanceService;

@Controller
public class PerformanceController {

	@Autowired
	PerformanceService pfmservice;
	
	@RequestMapping("/performance/musical")
	public String musical(ModelMap modelMap) {
		

		List<PerformanceVO> performanceList = pfmservice.selectPerformance();
		List<PerformanceVO> performanceOpenList = new ArrayList<PerformanceVO>();
		List<PerformanceVO> performanceOpenExpectedList = new ArrayList<PerformanceVO>();
		
		
		if(performanceList != null && performanceList.size() != 0) {
			
			//현재시간 구하기
			//LocalDate now = LocalDate.now();
			//DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
			//int nowDate = Integer.parseInt(now.format(formatter));
			
			Date today = new Date();
			//뮤지컬, 예매가능한 뮤지컬만 필터링
			performanceOpenList = performanceList.stream().filter( o -> "M".equals(o.getPerformanceKindCd()))
														  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
														  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) > 0)
														  .limit(8)
														  .collect(Collectors.toList());
			//뮤지컬, 오픈예정인 애들만 필터링	
			performanceOpenExpectedList = performanceList.stream().filter( o -> "M".equals(o.getPerformanceKindCd()))
																  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
																  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) <= 0)
																  .limit(8)
																  .collect(Collectors.toList());
		}
		
		modelMap.put("performanceOpenList", performanceOpenList);
		modelMap.put("performanceOpenExpectedList", performanceOpenExpectedList);
		
		return "performance/musical";
		
	}
	

	
	@RequestMapping("/performance/concert")
	public String concert() {
		
		return "performance/concert";
		
	}
	
	@RequestMapping("/performance/detailViewPerformance/{performanceId}")
	public String detailViewPerformance(@PathVariable String performanceId, Model model) {
		PerformanceVO pfm =pfmservice.detailViewPerformance(performanceId);
		
		model.addAttribute("pfm",pfm);
		
		return "performance/performanceDetail";
	}
	
	
}
