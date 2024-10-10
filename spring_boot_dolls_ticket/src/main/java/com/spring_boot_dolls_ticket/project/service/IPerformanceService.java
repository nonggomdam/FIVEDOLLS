package com.spring_boot_dolls_ticket.project.service;

import com.spring_boot_dolls_ticket.project.model.PerformanceVO;

public interface IPerformanceService {

	PerformanceVO detailViewPerformance(String performanceId);
	PerformanceVO getLatestEvent();
}
