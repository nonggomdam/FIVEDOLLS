package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;
import java.util.List;

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
	

	public PerformanceVO detailViewPerformance(String performanceId) {
		// TODO Auto-generated method stub
		return dao.detailViewPerformance(performanceId);
	}


	@Override
	public PerformanceVO getEventById(String performanceId) {
		// TODO Auto-generated method stub
		return dao.getEventById(performanceId);
	}
	@Override
	public ArrayList<PerformanceVO> listAllPerformance() {
		return dao.listAllPerformance();
	}
	@Override
	public void updatePerformance(PerformanceVO performance) {
		dao.updatePerformance(performance);
	}
	@Override
	public void deletePerformance(String performanceId) {
		dao.deletePerformance(performanceId);
	}
	@Override
	public void insertPerformance(PerformanceVO performance) {
		dao.insertPerformance(performance);
	}


	@Override
	public List<PerformanceVO> selectPerformance() {
		// TODO Auto-generated method stub
		return dao.selectPerformance();
	}

}
