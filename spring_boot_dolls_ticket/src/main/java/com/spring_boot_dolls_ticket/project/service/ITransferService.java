package com.spring_boot_dolls_ticket.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.spring_boot_dolls_ticket.project.model.AssignmentNoticeBoardVO;
import com.spring_boot_dolls_ticket.project.model.AssignmentTicketVO;
import com.spring_boot_dolls_ticket.project.model.Transfer2VO;
import com.spring_boot_dolls_ticket.project.model.TransferVO;

public interface ITransferService {
	public ArrayList<TransferVO> showTransInfo(String custId);
	public void insertAssignmentNotice(AssignmentNoticeBoardVO vo);
	public ArrayList<AssignmentNoticeBoardVO> selectAssignmentNotice();
	public HashMap<String, Object> selectAssignmentNotice(String noticeId);
	public int updateHit(String noticeId);
	public int updateAssignmentTicket(AssignmentTicketVO ticketVo);
}
