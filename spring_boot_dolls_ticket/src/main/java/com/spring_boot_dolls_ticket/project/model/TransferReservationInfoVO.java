package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TransferReservationInfoVO {
	
	private String reservationId;
	private String performanceId;
	private String custId;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date performanceDate;
	private int totalSeatPrice;
	private String reservationSeatInformation;
	private String reservationStatus;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date firstChangeDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date lastChangeDate; 
	
	
	
	public String getReservationId() {
		return reservationId;
	}
	public void setReservationId(String reservationId) {
		this.reservationId = reservationId;
	}
	public String getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(String performanceId) {
		this.performanceId = performanceId;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public Date getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(Date performanceDate) {
		this.performanceDate = performanceDate;
	}
	public int getTotalSeatPrice() {
		return totalSeatPrice;
	}
	public void setTotalSeatPrice(int totalSeatPrice) {
		this.totalSeatPrice = totalSeatPrice;
	}
	public String getReservationSeatInformation() {
		return reservationSeatInformation;
	}
	public void setReservationSeatInformation(String reservationSeatInformation) {
		this.reservationSeatInformation = reservationSeatInformation;
	}
	public String getReservationStatus() {
		return reservationStatus;
	}
	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
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
		return "TransferReservationInfoVO [reservationId=" + reservationId + ", performanceId=" + performanceId
				+ ", custId=" + custId + ", performanceDate=" + performanceDate + ", totalSeatPrice=" + totalSeatPrice
				+ ", reservationSeatInformation=" + reservationSeatInformation + ", reservationStatus="
				+ reservationStatus + ", firstChangeDate=" + firstChangeDate + ", lastChangeDate=" + lastChangeDate
				+ "]";
	}
	
	
	

	
	
	
}
