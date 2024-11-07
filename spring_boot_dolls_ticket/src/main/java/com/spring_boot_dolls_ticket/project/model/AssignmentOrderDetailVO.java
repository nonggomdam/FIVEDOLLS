package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AssignmentOrderDetailVO {

	private String orderNo;
	private String sqno;
	private String noticeId;
	private String assignmentSqno;
	private int price;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date firstChangeDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lastChangeDate;
	
	
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getSqno() {
		return sqno;
	}
	public void setSqno(String sqno) {
		sqno = sqno;
	}
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public String getAssignmentSqno() {
		return assignmentSqno;
	}
	public void setAssignmentSqno(String assignmentSqno) {
		this.assignmentSqno = assignmentSqno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getFirstChangeDate() {
		return firstChangeDate;
	}
	public void setFirstChangeDate(Date firstChangeDate) {
		this.firstChangeDate = firstChangeDate;
	}
	public Date getLastChangeDate() {
		return lastChangeDate;
	}
	public void setLastChangeDate(Date lastChangeDate) {
		this.lastChangeDate = lastChangeDate;
	}
	@Override
	public String toString() {
		return "AssignmentOrderDetailVO [orderNo=" + orderNo + ", Sqno=" + sqno + ", noticeId=" + noticeId
				+ ", assignmentSqno=" + assignmentSqno + ", price=" + price + ", firstChangeDate=" + firstChangeDate
				+ ", lastChangeDate=" + lastChangeDate + "]";
	}
	
	
	
}
