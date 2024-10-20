package com.spring_boot_dolls_ticket.project.model;

public class Transfer2VO {
	
	private String custId;
	private String assignmentSqno;
	private String reservationNumber;
	private String reservationSeatInformation;
	private String performanceKindCd;
	private String performanceName;
	private int performancePrice;
	private String performanceDate;
	private String performanceId;
	private String soldYn;
	
	
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getAssignmentSqno() {
		return assignmentSqno;
	}
	public void setAssignmentSqno(String assignmentSqno) {
		this.assignmentSqno = assignmentSqno;
	}
	public String getReservationNumber() {
		return reservationNumber;
	}
	public void setReservationNumber(String reservationNumber) {
		this.reservationNumber = reservationNumber;
	}
	public String getReservationSeatInformation() {
		return reservationSeatInformation;
	}
	public void setReservationSeatInformation(String reservationSeatInformation) {
		this.reservationSeatInformation = reservationSeatInformation;
	}
	public String getPerformanceKindCd() {
		return performanceKindCd;
	}
	public void setPerformanceKindCd(String performanceKindCd) {
		this.performanceKindCd = performanceKindCd;
	}
	public String getPerformanceName() {
		return performanceName;
	}
	public void setPerformanceName(String performanceName) {
		this.performanceName = performanceName;
	}
	public int getPerformancePrice() {
		return performancePrice;
	}
	public void setPerformancePrice(int performancePrice) {
		this.performancePrice = performancePrice;
	}
	public String getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(String performanceDate) {
		this.performanceDate = performanceDate;
	}
	public String getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(String performanceId) {
		this.performanceId = performanceId;
	}
	public String getSoldYn() {
		return soldYn;
	}
	public void setSoldYn(String soldYn) {
		this.soldYn = soldYn;
	}
	
	@Override
	public String toString() {
		return "Transfer2VO [custId=" + custId + ", assignmentSqno=" + assignmentSqno + ", reservationNumber="
				+ reservationNumber + ", reservationSeatInformation=" + reservationSeatInformation
				+ ", performanceKindCd=" + performanceKindCd + ", performanceName=" + performanceName
				+ ", performancePrice=" + performancePrice + ", performanceDate=" + performanceDate + ", performanceId="
				+ performanceId + ", soldYn=" + soldYn + "]";
	}
	
	
	


	
	

	
	
	
	
	
	
}
