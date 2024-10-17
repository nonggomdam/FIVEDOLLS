package com.spring_boot_dolls_ticket.project.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_boot_dolls_ticket.project.service.MemberService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring_boot_dolls_ticket.project.model.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memService;
	
	//private kakaoLogin kakao_restapi = new kakaoLogin();
	
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
	
	@RequestMapping("/kakao/oauth")
	public void getKakaoAuthUrl(HttpServletResponse response) throws Exception {
	    String reqUrl = "https://kauth.kakao.com/oauth/authorize"
	            + "?client_id=0672e740c19121be04471cca72ca8d44"
	            + "&redirect_uri=http://localhost:8080/kakao/callback"
	            + "&response_type=code";
	    
	    response.sendRedirect(reqUrl); // 카카오 인증 URL로 리다이렉트
	}
	
	@RequestMapping("/kakao/callback")
	public String oauthKakao(
	        @RequestParam(value = "code", required = false) String code,
	        HttpSession session) throws Exception {
	    
	    // Access Token을 가져옵니다.
	    String access_Token = getAccessToken(code);
	    
	    // 사용자 정보를 가져옵니다.
	    HashMap<String, Object> userInfo = getUserInfo(access_Token);
	    System.out.println("###access_Token#### : " + access_Token);
	    System.out.println("###userInfo#### : " + userInfo.get("email"));
	    System.out.println("###nickname#### : " + userInfo.get("nickname"));
	    
	    // 사용자 정보를 세션에 저장합니다.
	    session.setAttribute("accessToken", access_Token); // 액세스 토큰 저장
	    session.setAttribute("sid", userInfo);
	    
	    // 로그인 성공 후 카카오 로그인 화면으로 리디렉션
	    return "redirect:/"; // 적절한 URL로 변경
	}
	
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=0672e740c19121be04471cca72ca8d44");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8080/kakao/callback");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }
	
	public HashMap<String, Object> getUserInfo(String access_Token) {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line;
	        StringBuilder result = new StringBuilder();

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }
	        System.out.println("response body : " + result);

	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result.toString());

	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

	        String nickname = properties.has("nickname") ? properties.get("nickname").getAsString() : "이름 없음";
	        String email = kakao_account.has("email") ? kakao_account.get("email").getAsString() : "이메일 없음";

	        userInfo.put("accessToken", access_Token);
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);

	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return userInfo;
	}
	
	// naver 로그인
	@RequestMapping("/naver/oauth")
	public void getNaverAuthUrl(HttpServletResponse response) throws Exception {
	    String reqUrl = "https://nid.naver.com/oauth2.0/authorize"
	            + "?client_id=M8tmkDymjlbYysnk7E5u"
	            + "&redirect_uri=http://localhost:8080/naver/callback"
	            + "&response_type=code";
	    
	    response.sendRedirect(reqUrl); // 카카오 인증 URL로 리다이렉트
	} 
	
	@RequestMapping("/naver/callback")
	public String oauthNaver(@RequestParam(value = "code", required = false) String code, 
	                          @RequestParam(value = "state", required = false) String state,
	                          HttpSession session) throws Exception {
	    
	    // Access Token을 가져옵니다.
	    String accessToken = getNaverAccessToken(code, state);
	    
	    // 사용자 정보를 가져옵니다.
	    HashMap<String, Object> userInfo = getNaverUserInfo(accessToken);
	    
	    // 사용자 정보를 세션에 저장합니다.
	    session.setAttribute("accessToken", accessToken);
	    session.setAttribute("sid", userInfo);
	    
	    // 로그인 성공 후 리다이렉션
	    return "redirect:/"; // 적절한 URL로 변경
	}

	public String getNaverAccessToken(String code, String state) {
	    String accessToken = "";
	    String reqURL = "https://nid.naver.com/oauth2.0/token";

	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	        conn.setDoOutput(true);

	        StringBuilder sb = new StringBuilder();
	        sb.append("client_id=M8tmkDymjlbYysnk7E5u");
	        sb.append("&client_secret=ZX9Dc_7J0k"); // 여기에 네이버 클라이언트 시크릿 추가
	        sb.append("&grant_type=authorization_code");
	        sb.append("&code=" + code);
	        sb.append("&state=" + state);

	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        bw.write(sb.toString());
	        bw.flush();

	        int responseCode = conn.getResponseCode();

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        StringBuilder result = new StringBuilder();
	        String line;

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }

	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result.toString());
	        accessToken = element.getAsJsonObject().get("access_token").getAsString();

	        br.close();
	        bw.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return accessToken;
	}

	public HashMap<String, Object> getNaverUserInfo(String accessToken) {
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://openapi.naver.com/v1/nid/me";

	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        int responseCode = conn.getResponseCode();

	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        StringBuilder result = new StringBuilder();
	        String line;

	        while ((line = br.readLine()) != null) {
	            result.append(line);
	        }

	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result.toString());

	        String nickname = element.getAsJsonObject().get("response").getAsJsonObject().get("nickname").getAsString();
	        String email = element.getAsJsonObject().get("response").getAsJsonObject().get("email").getAsString();

	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);

	        br.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    return userInfo;
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
	    // 세션 무효화
	    HttpSession session = request.getSession(false);
	    
	    if (session != null) {
	        // 세션에서 카카오 액세스 토큰 가져오기
	        String accessToken = (String) session.getAttribute("accessToken");
	        if (accessToken != null) {
	            kakaoLogout(accessToken); // 카카오 로그아웃 호출
	        }
	        session.invalidate(); // 세션 무효화
	    }
	    
	    // 쿠키 삭제
	    Cookie cookie = new Cookie("JSESSIONID", null);
	    cookie.setPath("/");
	    cookie.setMaxAge(0);
	    response.addCookie(cookie);
	    
	    return "redirect:/"; // 메인 페이지로 리다이렉트
	}

	public void kakaoLogout(String accessToken) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	        int responseCode = conn.getResponseCode();
	        
	        System.out.println("Kakao logout response code: " + responseCode);
	        
	        // 로그아웃 결과 처리
	        BufferedReader br;
	        if (responseCode >= 200 && responseCode <= 300) {
	            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        String line;
	        StringBuilder responseSb = new StringBuilder();
	        while ((line = br.readLine()) != null) {
	            responseSb.append(line);
	        }
	        br.close();
	    } 
	    catch (IOException e) {
	        e.printStackTrace();
	    }
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
	
	@RequestMapping("/member/findPwd")
    public ResponseEntity<List<String>> findPwd(@RequestBody Map<String, String> data) {
        String name = data.get("name");
        String email = data.get("email");
        String phone = data.get("phone");

        List<String> foundIds = memService.findId(name, email, phone);
        
        // 찾은 아이디 리스트 반환
        return ResponseEntity.ok(foundIds);
    }
	
	@RequestMapping("/member/resetPassword")
	public ResponseEntity<Void> resetPassword(@RequestBody Map<String, String> data) {
	    String name = data.get("name");
	    String email = data.get("email");
	    String newPassword = data.get("newPassword");

	    boolean success = memService.resetPassword(name, email, newPassword);
	    if (success) {
	        return ResponseEntity.ok().build(); // 성공적으로 비밀번호가 재설정됨
	    } else {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build(); // 실패 시
	    }
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
	
	/**
	 * 회원정보 수정
	 */
	@RequestMapping("member/correctionMember")
	public String correctionMemberPage(Model model, HttpSession session) {
		String custId=(String)session.getAttribute("sid");
		
		
		MemberVO myInfo = memService.selectCustInfo(custId);

		model.addAttribute("myInfo", myInfo);
		return "member/correctionMember";
	}
	
}
