package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;

import com.spring_boot_dolls_ticket.project.model.PerformanceVO;

public interface IPerformanceService {

	PerformanceVO detailViewPerformance(String performanceId);
	PerformanceVO getEventById(String performanceId);
	ArrayList<PerformanceVO> listAllPerformance(); // READ - 모든 공연 정보 list
	void updatePerformance(PerformanceVO performance); // UPDATE - 공연 정보 수정
	void deletePerformance(String performanceId); // DELETE - 공연 정보 삭제
	void insertPerformance(PerformanceVO performance); // INSERT - 공연 정보 추가
	
}
