package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TransferVO {
	
	private String custId;
	private String performanceKindCd;
	private String performanceName;
	private int performancePrice;
	private String performanceDate;
	private String reservationSeatInformation;
	private String reservationNumber;
	
	
	public String getReservationNumber() {
		return reservationNumber;
	}
	public void setReservationNumber(String reservationNumber) {
		this.reservationNumber = reservationNumber;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
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
	public String getReservationSeatInformation() {
		return reservationSeatInformation;
	}
	public void setReservationSeatInformation(String reservationSeatInformation) {
		this.reservationSeatInformation = reservationSeatInformation;
	}
	
	
	@Override
	public String toString() {
		return "TransferVO [custId=" + custId + ", performanceKindCd=" + performanceKindCd + ", performanceName="
				+ performanceName + ", performancePrice=" + performancePrice + ", performanceDate=" + performanceDate
				+ ", reservationSeatInformation=" + reservationSeatInformation + ", reservationNumber="
				+ reservationNumber + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
}
