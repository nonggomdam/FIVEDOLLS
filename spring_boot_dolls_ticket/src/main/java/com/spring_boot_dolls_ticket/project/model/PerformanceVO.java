package com.spring_boot_dolls_ticket.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PerformanceVO {
	
	private String performanceId;
	private String performanceKindCd;
	private int performanceRatingCode;
	private String performanceName;
	private int performancePriceR;
	private String performanceZipcode;
	private String performanceAddress;
	private String performanceDetailAddress;
	private Date performanceDate;
	private Date reservationOpenExpectedDate;
	private String performanceImagePath;
	private Date firstChanceDate;
	private Date lastChanceDate;
	private int performanceTime;
	private int performancePriceS;
	private Date performanceDate2;
	
	public String getPerformanceId() {
		return performanceId;
	}
	public void setPerformanceId(String performanceId) {
		this.performanceId = performanceId;
	}
	public String getPerformanceKindCd() {
		return performanceKindCd;
	}
	public void setPerformanceKindCd(String performanceKindCd) {
		this.performanceKindCd = performanceKindCd;
	}
	public int getPerformanceRatingCode() {
		return performanceRatingCode;
	}
	public void setPerformanceRatingCode(int performanceRatingCode) {
		this.performanceRatingCode = performanceRatingCode;
	}
	public String getPerformanceName() {
		return performanceName;
	}
	public void setPerformanceName(String performanceName) {
		this.performanceName = performanceName;
	}
	public int getPerformancePriceR() {
		return performancePriceR;
	}
	public void setPerformancePriceR(int performancePriceR) {
		this.performancePriceR = performancePriceR;
	}
	public String getPerformanceZipcode() {
		return performanceZipcode;
	}
	public void setPerformanceZipcode(String performanceZipcode) {
		this.performanceZipcode = performanceZipcode;
	}
	public String getPerformanceAddress() {
		return performanceAddress;
	}
	public void setPerformanceAddress(String performanceAddress) {
		this.performanceAddress = performanceAddress;
	}
	public String getPerformanceDetailAddress() {
		return performanceDetailAddress;
	}
	public void setPerformanceDetailAddress(String performanceDetailAddress) {
		this.performanceDetailAddress = performanceDetailAddress;
	}
	public Date getPerformanceDate() {
		return performanceDate;
	}
	public void setPerformanceDate(Date performanceDate) {
		this.performanceDate = performanceDate;
	}
	public Date getReservationOpenExpectedDate() {
		return reservationOpenExpectedDate;
	}
	public void setReservationOpenExpectedDate(Date reservationOpenExpectedDate) {
		this.reservationOpenExpectedDate = reservationOpenExpectedDate;
	}
	public String getPerformanceImagePath() {
		return performanceImagePath;
	}
	public void setPerformanceImagePath(String performanceImagePath) {
		this.performanceImagePath = performanceImagePath;
	}
	public Date getFirstChanceDate() {
		return firstChanceDate;
	}
	public void setFirstChanceDate(Date firstChanceDate) {
		this.firstChanceDate = firstChanceDate;
	}
	public Date getLastChanceDate() {
		return lastChanceDate;
	}
	public void setLastChanceDate(Date lastChanceDate) {
		this.lastChanceDate = lastChanceDate;
	}
	public int getPerformanceTime() {
		return performanceTime;
	}
	public void setPerformanceTime(int performanceTime) {
		this.performanceTime = performanceTime;
	}
	public int getPerformancePriceS() {
		return performancePriceS;
	}
	public void setPerformancePriceS(int performancePriceS) {
		this.performancePriceS = performancePriceS;
	}
	public Date getPerformanceDate2() {
		return performanceDate2;
	}
	public void setPerformanceDate2(Date performanceDate2) {
		this.performanceDate2 = performanceDate2;
	}
	
	
	
}
