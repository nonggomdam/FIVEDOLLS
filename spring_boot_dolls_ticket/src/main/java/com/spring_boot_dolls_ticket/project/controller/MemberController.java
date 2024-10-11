package com.spring_boot_dolls_ticket.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring_boot_dolls_ticket.project.service.MemberService;

import jakarta.servlet.http.HttpSession;

import com.spring_boot_dolls_ticket.project.model.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memService;
	
	@RequestMapping("/member/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("/member/privacyPolicy")
	public String privacyPolicy(){
		return "member/privacyPolicy";
	}
	
	@RequestMapping("/member/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@ResponseBody
	@RequestMapping("/member/idCheck")
	public int idCheck(@RequestParam("id") String id) {
		String custId = memService.idCheck(id);
		
		int result = 0;
		if(custId != null) {
			result = 1;
		}
		return result; // view 결정하지 않고 result 변수값 그대로 요청
	}
	
	@RequestMapping("/member/join")
	public String join(MemberVO vo) {
		memService.insertMember(vo);
		return "redirect:/member/signupSuccess"; // 회원가입 후에 로그인페이지로 이동
	}
	
	@ResponseBody
	@RequestMapping("/member/login")
	public String loginCheck(@RequestParam("id") String id, @RequestParam("pwd") String pwd ,
							 HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("id", id);
        map.put("pwd", pwd);
        String result = memService.loginCheck(map); // MemberService의 loginCheck 메서드를 호출
        
        if("success".equals(result)) { // 로그인 성공시 세션 부여
        	session.setAttribute("sid", id);
        }
        
        return result;
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
	    // 세션 무효화
	    session.invalidate();
	    return "redirect:/"; // 메인 페이지로 리다이렉트
	}
	
	@RequestMapping("/member/searchId")
	public String searchId() {
		return "member/searchId";
	}
	@ResponseBody
	@RequestMapping("/member/findId")
	public ResponseEntity<List<String>> findId(@RequestBody Map<String, String> data) {
	    String name = data.get("name");
	    String email = data.get("email");
	    String phone = data.get("phone");

	    List<String> foundIds = memService.findId(name, email, phone);
	    
	    return ResponseEntity.ok(foundIds);
	}
	
	@RequestMapping("/member/searchPwd")
	public String searchPwd() {
		return "member/searchPwd";
	}
	
	@RequestMapping("/member/searchPwwd")
	public String searchPwwd() {
		return "member/searchPwwd";
	}
	
	@PostMapping("/member/checkId")
	public ResponseEntity<Map<String, Boolean>> checkId(@RequestParam String id) {
	    boolean exists = memService.checkIdInDatabase(id);
	    Map<String, Boolean> response = new HashMap<>();
	    response.put("exists", exists);
	    return ResponseEntity.ok(response);
	}
	
	@RequestMapping("/member/signupSuccess")
	public String signup_Success() {
		return "member/signupSuccess";
	}
	
}
