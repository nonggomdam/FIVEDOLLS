package com.spring_boot_dolls_ticket.project.dao;

import com.spring_boot_dolls_ticket.project.model.PerformanceVO;

public interface IPerformanceDAO {

	PerformanceVO detailViewPerformance(String PERFORMANCE_ID);
}
