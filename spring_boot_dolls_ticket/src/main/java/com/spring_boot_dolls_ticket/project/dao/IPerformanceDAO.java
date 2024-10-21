package com.spring_boot_dolls_ticket.project.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring_boot_dolls_ticket.project.model.PerformanceScheduleVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;


public interface IPerformanceDAO {

	PerformanceVO detailViewPerformance(String performanceId);
	PerformanceVO getEventById(String performanceId);
	ArrayList<PerformanceVO> listAllPerformance(); // READ - 모든 공연 정보 list
	void updatePerformance(PerformanceVO performance); // UPDATE - 공연 정보 수정
	void deletePerformance(String performanceId); // DELETE - 공연 정보 삭제
	void insertPerformance(PerformanceVO performance); // INSERT - 공연 정보 추가
	public List<PerformanceVO> selectPerformance(); // 카테고리 page
	public List<PerformanceScheduleVO> selectPerformanceDate(String performanceId);
	
}
