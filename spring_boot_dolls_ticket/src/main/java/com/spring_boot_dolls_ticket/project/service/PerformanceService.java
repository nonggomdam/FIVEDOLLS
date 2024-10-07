package com.spring_boot_dolls_ticket.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_dolls_ticket.project.dao.IPerformanceDAO;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;

@Service
public class PerformanceService implements IPerformanceService {

	@Autowired
	@Qualifier("IPerformanceDAO")
	IPerformanceDAO dao;
	
	@Override
	public PerformanceVO detailViewPerformance(String PERFORMANCE_ID) {
		// TODO Auto-generated method stub
		return dao.detailViewPerformance(PERFORMANCE_ID);
	}

}
