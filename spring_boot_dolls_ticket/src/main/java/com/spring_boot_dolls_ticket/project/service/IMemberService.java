package com.spring_boot_dolls_ticket.project.service;

import java.util.HashMap;
import java.util.List;

import com.spring_boot_dolls_ticket.project.model.MemberVO;

public interface IMemberService {
	public String loginCheck(HashMap<String , Object> map);
	public String idCheck(String id);
	public void insertMember(MemberVO vo);
	public List<String> findId(String name, String email, String phone);
	public boolean checkIdInDatabase(String id);
	public boolean resetPassword(String name, String email, String newPassword);
	public MemberVO selectCustInfo(String custId);
}  
  