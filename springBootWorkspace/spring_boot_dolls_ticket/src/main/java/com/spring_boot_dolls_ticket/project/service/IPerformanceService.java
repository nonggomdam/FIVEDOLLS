package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;

public interface IPerformanceService {
	
	public ArrayList<PerformanceVO> listAllPerformance(); // READ - 모든 공연 정보 list
	PerformanceVO detailViewPerformance(String performanceId);
	PerformanceVO getLatestEvent();
	void updatePerformance(PerformanceVO performance);
	void deletePerformance(String performanceId);
	void insertPerformance(PerformanceVO performance);
	
}

