package com.spring_boot_dolls_ticket.project.dao;

import java.util.ArrayList;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;

public interface IPerformanceDAO {
	
	public ArrayList<PerformanceVO> listAllPerformance(); // READ - 모든 공연 정보 list
	PerformanceVO getLatestEvent();
	public PerformanceVO detailViewPerformance(String performanceId); // READ - 공연 상세 정보
	public void updatePerformance(PerformanceVO performance); // UPDATE - 공연 정보 수정
	public void deletePerformance(String performanceId); // DELETE - 공연 정보 삭제
	public void insertPerformance(PerformanceVO performance); // INSERT - 공연 정보 추가

}
