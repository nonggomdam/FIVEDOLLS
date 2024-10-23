package com.spring_boot_dolls_ticket.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_dolls_ticket.project.model.PerformanceScheduleVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceSeatVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.model.ReviewVO;
import com.spring_boot_dolls_ticket.project.service.PerformanceService;
import com.spring_boot_dolls_ticket.project.service.ReviewService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PerformanceController {

	@Autowired
	PerformanceService pfmservice;
	
	@Autowired
	ReviewService rvService;
	
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
	public String concert(ModelMap modelMap) {
		
		List<PerformanceVO> performanceConsertList = pfmservice.selectPerformance();
		List<PerformanceVO> consertOpenList = new ArrayList<PerformanceVO>();
		List<PerformanceVO> consertOpenExpectedList = new ArrayList<PerformanceVO>();
		
		if(performanceConsertList != null && performanceConsertList.size() != 0) {
			//현재시간 구하기
//			LocalDate now = LocalDate.now();
//			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
//			int nowDate = Integer.parseInt(now.format(formatter));
			
			Date today = new Date();
			//뮤지컬, 상영중인 뮤지컬만 필터링
			consertOpenList = performanceConsertList.stream().filter( o -> "C".equals(o.getPerformanceKindCd()))
														  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
														  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) > 0)
														  .limit(8)
														  .collect(Collectors.toList());
			
			//뮤지컬, 오픈예정인 애들만 필터링	
			consertOpenExpectedList = performanceConsertList.stream().filter( o -> "C".equals(o.getPerformanceKindCd()))
																  .filter( o -> o.getMinPerformanceDate() != null) //일단 오류 막기위해 널인애들 제거, 원래는 디비에서 다넣어줘야함.
																  .filter( o -> today.compareTo(o.getReservationOpenExpectedDate()) <= 0)
																  .limit(8)
																  .collect(Collectors.toList());
		}
		
		System.out.println(consertOpenExpectedList.size());
		modelMap.put("consertOpenList", consertOpenList);
		modelMap.put("consertOpenExpectedList", consertOpenExpectedList);
		
		
		return "performance/concert";
		
	}
	
	// 상세페이지
	@RequestMapping("/performance/detailViewPerformance/{performanceId}")
	public String detailViewPerformance(@PathVariable String performanceId, Model model) {
		PerformanceVO pfm =pfmservice.detailViewPerformance(performanceId);
		model.addAttribute("pfm",pfm);
		ArrayList<ReviewVO> reviewList = rvService.reviewList(performanceId);
		model.addAttribute("reviewList", reviewList);
		return "performance/performanceDetail";
	}
	// 리뷰기능
	@RequestMapping("/performance/insertReview") 
	public String insertReview(ReviewVO vo, HttpSession session, HttpServletRequest request) {
	    // 세션에서 사용자 ID 가져오기
	    String custId = (String) session.getAttribute("sid");
	    vo.setCustId(custId); 
	    vo.setPerformanceId(request.getParameter("performanceId"));
	    rvService.insertReview(vo);
	    return "redirect:/performance/detailViewPerformance/"+vo.getPerformanceId();
	}
	
	@RequestMapping(value = "/performance/deleteReview", method = RequestMethod.POST)
	@ResponseBody
	public String deleteReview(@RequestParam("reviewSeq") int reviewSeq, ReviewVO vo, HttpServletRequest request) {
		vo.setPerformanceId(request.getParameter("performanceId"));
	    rvService.deleteReview(reviewSeq); // 리뷰 삭제 처리
	    return "redirect:/performance/detailViewPerformance/"+vo.getPerformanceId();
	}

	
	
	/**
	 * 날짜선택 페이지
	 */
	@RequestMapping("performance/dateReservation/{performanceId}")
	public String dateReservation(@PathVariable String performanceId, ModelMap modelMap, Model model, HttpSession session) {
		
		if(session.getAttribute("sid") == null || session.getAttribute("sid") == "" ) {
			return "erorrPage";
		}
		
		ArrayList<String> arr = new ArrayList<String>();
		/*
		 * 공연 스케쥴 목록 조회
		 */
		List<PerformanceScheduleVO> performanceDateList = pfmservice.selectPerformanceDate(performanceId);
		if(performanceDateList != null && performanceDateList.size() > 0) {
			for (PerformanceScheduleVO o : performanceDateList) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHH:mm");
				arr.add(simpleDateFormat.format(o.getPerformanceDate()));
			}
		}
		//시간정렬
		Collections.sort(arr);
	    modelMap.put("performanceDateList", arr); //공연스케쥴
	    model.addAttribute("performanceId", performanceId);
	    
		return "performance/seatDateInfo";
	}
	
	/**
	 * 좌석정보
	 */
	@RequestMapping("performance/dateReservation/seatInfo")
	@ResponseBody
	public List<PerformanceSeatVO> dateReservation(@RequestBody PerformanceSeatVO performanceSeatVO) {
		
		performanceSeatVO.setPerformanceDate(performanceSeatVO.getPerformanceDate().replace(":", ""));
		
		/*
		 * 잔여 좌석 조회
		 */
		List<PerformanceSeatVO> performanceSeatInfo = pfmservice.selectPerformanceSeatInfoList(performanceSeatVO);
		
		return performanceSeatInfo;
	}
	
	
	
}
