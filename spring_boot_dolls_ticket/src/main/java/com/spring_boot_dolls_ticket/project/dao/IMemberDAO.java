
package com.spring_boot_dolls_ticket.project.dao;

import java.util.HashMap;
import java.util.List;

import com.spring_boot_dolls_ticket.project.model.MemberVO;

public interface IMemberDAO {
	public String loginCheck(String id);
	public String idCheck(String id);
	public void insertMember(MemberVO vo);
	public List<String> findId(String name, String email, String phone); // 아이디 찾기
	public boolean checkIdInDatabase(String id); // 아이디 찾기 전 아이디 확인
	public boolean resetPassword(String name, String email, String newPassword);
	public MemberVO selectCustInfo(String custId);
	public void updateMember(MemberVO in);
	public String findAdministratorYnById(String id);
}  
  
