package com.spring_boot_dolls_ticket.project.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring_boot_dolls_ticket.project.model.PerformanceVO;
import com.spring_boot_dolls_ticket.project.service.PerformanceService;

@RestController
public class TicketOpenController {

	@Autowired
	PerformanceService pfmservice;
	
	// 이벤트 활성화 상태를 확인하는 API
    @GetMapping("/api/check-event")
    public EventStatus checkEventStatus() {
        PerformanceVO event = pfmservice.getLatestEvent();
        if (event == null) {
            return new EventStatus(false, null);
        }

        boolean isOpen = new java.util.Date().after(event.getReservationOpenExpectedDate());
        return new EventStatus(isOpen, event.getReservationOpenExpectedDate());
        
    }
    
    // 이벤트 상태를 반환하는 DTO 클래스
    public static class EventStatus {
        private boolean isOpen;
        private Date targetDate;

        public EventStatus(boolean isOpen, Date targetDate) {
            this.isOpen = isOpen;
            this.targetDate = targetDate;
        }

        // Getters and Setters
        public boolean isOpen() {
            return isOpen;
        }

        public void setOpen(boolean open) {
            isOpen = open;
        }

        public Date getTargetDate() {
            return targetDate;
        }

        public void setTargetDate(Date targetDate) {
            this.targetDate = targetDate;
        }
    }
}