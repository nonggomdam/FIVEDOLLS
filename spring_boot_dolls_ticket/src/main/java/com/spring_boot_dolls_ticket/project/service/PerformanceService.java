package com.spring_boot_dolls_ticket.project.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_dolls_ticket.project.dao.IPerformanceDAO;
import com.spring_boot_dolls_ticket.project.model.PerformanceScheduleVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceSeatVO;
import com.spring_boot_dolls_ticket.project.model.PerformanceVO;

@Service
public class PerformanceService implements IPerformanceService {
	
	
	
	@Autowired
	@Qualifier("IPerformanceDAO")
	IPerformanceDAO dao;
	

	public PerformanceVO detailViewPerformance(String performanceId) {
		// TODO Auto-generated method stub
		return dao.detailViewPerformance(performanceId);
	}


	@Override
	public PerformanceVO getEventById(String performanceId) {
		// TODO Auto-generated method stub
		return dao.getEventById(performanceId);
	}
	@Override
	public ArrayList<PerformanceVO> listAllPerformance() {
		return dao.listAllPerformance();
	}
	// 공연 정보 수정 및 이미지 업데이트
	@Override
    public void updatePerformance(PerformanceVO performance, MultipartFile performancePoster, MultipartFile performanceInfoImg) throws IOException {
		
		String performanceId = performance.getPerformanceId();
		
		// 1. 기존 경로 가져오기
		String oldPosterPath = performance.getPerformanceImagePath();
		String oldInfoImgPath = performance.getPerformanceInformationImagePath();
		
		System.out.println(oldPosterPath);
		System.out.println(oldInfoImgPath);
		
		// 2. 기존 파일 삭제하기
		deleteFile(oldPosterPath);
		deleteFile(oldInfoImgPath);
		
		// 3. 새 파일 확장자 추출
		String posterExtension = getFileExtension(performancePoster);
        String infoImgExtension = getFileExtension(performanceInfoImg);
        
        // 4. 새 파일 경로 생성
        String newPosterPath = performanceId + posterExtension;
		String newInfoImgPath = performanceId + "_info" + infoImgExtension;
		
		System.out.println(newPosterPath);
		System.out.println(newInfoImgPath);
		
		// 5. 이미지 경로 설정
		performance.setPerformanceImagePath(newPosterPath);
		performance.setPerformanceInformationImagePath(newInfoImgPath);
		
		// 6. 이미지 경로 먼저 update
		dao.updateImgPath(performance);
		dao.updatePerformance(performance);
        
    }
	@Override
	public void deletePerformance(String performanceId) {
		dao.deletePerformance(performanceId);
	}
	// 공연 정보 등록 및 이미지 경로 설정
	@Override
    public void insertPerformance(PerformanceVO performance, MultipartFile performancePoster, MultipartFile performanceInfoImg) throws IOException {
        // 공연 정보 삽입 -> 삽입 후 performanceId가 자동으로 설정됨
        dao.insertPerformance(performance);
        String generatedId = dao.selectGeneratedId();
        performance.setPerformanceId(generatedId);
        
        // ID가 제대로 생성되었는지 확인하는 디버깅 코드
        System.out.println("Generated PERFORMANCE_ID: " + performance.getPerformanceId());

        // 파일 확장자 추출 메서드 호출
        String posterExtension = getFileExtension(performancePoster);
        String infoImgExtension = getFileExtension(performanceInfoImg);
        
        // 생성된 performanceId로 이미지 경로 생성
        String performanceId = performance.getPerformanceId();
        String posterPath = performanceId + posterExtension;
        String infoImgPath = performanceId + "_info" + infoImgExtension;

        // 이미지 경로 VO에 설정
        performance.setPerformanceImagePath(posterPath);
        performance.setPerformanceInformationImagePath(infoImgPath);

        // 이미지 파일 저장
        saveFile(performancePoster, posterPath);
        saveFile(performanceInfoImg, infoImgPath);
        System.out.println(posterPath);
        System.out.println(infoImgPath);

        // 이미지 경로를 DB에 업데이트
        dao.updateImgPath(performance);
    }
	// 파일 삭제 메서드
    private void deleteFile(String filePath) {
        File file = new File("/Users/dlwlgus/springBootWorkspace/ticket_images/" + filePath);
        if (file.exists()) {
            if (file.delete()) {
                System.out.println("파일 삭제 성공: " + filePath);
            } else {
                System.out.println("파일 삭제 실패: " + filePath);
            }
        } else {
            System.out.println("파일이 존재하지 않음: " + filePath);
        }
    }
    private String getFileExtension(MultipartFile file) {
    	String fileName = file.getOriginalFilename();
        String extension = fileName.substring(fileName.lastIndexOf("."));
        return extension;
	}
    // 파일 저장 메서드
    private void saveFile(MultipartFile file, String filePath) throws IOException {
        if (!file.isEmpty()) {
            Path path = Paths.get("/Users/dlwlgus/springBootWorkspace/ticket_images/" + filePath);
            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
        }
    }
    // 이미지 경로를 DB에 업데이트
    public void updateImgPath(PerformanceVO performance) {
        dao.updateImgPath(performance);
    }

	@Override
	public List<PerformanceVO> selectPerformance() {
		// TODO Auto-generated method stub
		return dao.selectPerformance();
	}


	@Override
	public List<PerformanceScheduleVO> selectPerformanceDate(String performanceId) {
		// TODO Auto-generated method stub
		return dao.selectPerformanceDate(performanceId);
	}


	@Override
	public List<PerformanceSeatVO> selectPerformanceSeatInfoList(PerformanceSeatVO performanceSeatVO) {
		// TODO Auto-generated method stub
		return dao.selectPerformanceSeatInfoList(performanceSeatVO);
	}


	@Override
	public List<PerformanceVO> getRankedPerformances() {
		return dao.getRankedPerformances();
	}
	
	@Transactional
	public void incrementClickCount(String performanceId) {
	    System.out.println("서비스 메서드 호출됨: " + performanceId); // 로그 추가
	    dao.incrementClickCount(performanceId);
	}



}
