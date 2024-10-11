package com.spring_boot_dolls_ticket.project.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring_boot_dolls_ticket.project.model.AssignmentNoticeBoardVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicketVO;
import com.spring_boot_dolls_ticket.project.model.Transfer2VO;
import com.spring_boot_dolls_ticket.project.model.TransferReservationInfoVO;
import com.spring_boot_dolls_ticket.project.model.TransferVO;

public interface ITransferDAO {
	public ArrayList<TransferVO> showTransInfo(String custId);
	public void insertAssignmentNotice(AssignmentNoticeBoardVO vo);
	public ArrayList<AssignmentNoticeBoardVO> selectAssignmentNotice();
	public String maxNoticeId();
	public void insertAssignmentTicket(AssignmentTicketVO ticketVo);
	public TransferReservationInfoVO selectSeatInfo(TransferReservationInfoVO infoVo);
	public AssignmentNoticeBoardVO selectAssignmentNotice(@Param("noticeId") String noticeId);
	public ArrayList<Transfer2VO> selectListTicketAndPerformance(String noticeId);
	public int updateHit(String noticeId);
	public int updateAssignmentTicket(AssignmentTicketVO ticketVo);
	public int updateCustId(@Param("receiveCustId") String receiveCustId, @Param("performanceId") String performanceId, @Param("reservationSeatInformation") String seatInfo);
} 
