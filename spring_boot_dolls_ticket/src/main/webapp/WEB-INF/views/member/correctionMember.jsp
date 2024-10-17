<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    	<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/mypage.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/correctionMember.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/font5.css'/>">
    	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
		<script src="<c:url value='/js/canclelation.js'/>"></script>
		<script src="<c:url value='/js/moveChangepassword.js'/>"></script>
</head>
<body>
    <div class="container">
    	<div class="correction">
    	<h1>회원정보수정</h1>
        <form id="updateForm" name="updateForm" method="post" 
        		 action="<c:url value='/member/memberUpdate'/>">
            <!-- ID Field (Non-editable) -->      
            <div class="form-group">
                <label for="custId">아이디</label>
                <input type="text" id="custId" name="custId" value="${myInfo.custId}" readonly>
            </div>

            <!-- Password Field with Change Button -->
            <div class="form-group">
                <label for="custPassword">비밀번호 확인</label>
                <input type="password" id="custPassword" name="custPassword" value="${myInfo.custPassWord}" >
   				<button type="button" id="changePassword">비밀번호 변경</button>
            </div>

            <!-- Name Field -->
            <div class="form-group">
                <label for="custName">이름</label>
                <input type="text" id="custName" name="custName" value="${myInfo.custName}">
            </div>

            <!-- Email Field -->
            <div class="form-group">
                <label for="custEmail">이메일</label>
                <input type="email" id="custEmail" name="custEmail" value="${myInfo.custEmail}">
            </div>

            <!-- Phone Number Field with Change Button -->
            <div class="form-group">
                <label for="custPhonenumber">휴대전화번호</label>
                <input type="text" id="custPhonenumber" name="custPhonenumber" value="${myInfo.custPhoneNumber}" maxlength = "11" placeholder="숫자로만 입력하세요">
            </div>

            <!-- Postal Code Field -->
            <div class="form-group">
                <label for="custZipcode">우편번호</label>
       			 <input type="text" id="custZipcode" name="custZipcode" value="${myInfo.custZipcode}" size="5" readonly>
        		 <input type="button" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기"><br>
                
            </div>

            <!-- Address Field -->
            <div class="form-group">
                <label for="custAddress">주소</label>
       			 <input type="text" id="custAddress" name="custAddress" value="${myInfo.custAddress}" readonly>
            </div>

            <!-- Detailed Address Field with Change Button -->
            <div class="form-group">
                <label for="custDetailAddress">상세주소</label>
        		<input type="text" id="custDetailAddress" name="custDetailAddress" value="${myInfo.custDetailAddress}" placeholder="상세주소를 입력해주세요" >
            </div>
            <div class="subBtn">
	            <button type="submit" id="updateMember">회원정보 수정</button>
	            <button type="button" id="cancellation">취소</button>
            </div>
        </form>
        </div>
    </div>
 	
 	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		
<script>

// 회원정보 변경 버튼 클릭 시 확인 알림창
	document.getElementById('updateMember').addEventListener('click', function(event) {
    // 확인창을 띄움
    var confirmed = confirm("회원정보를 변경하시겠습니까?");
    
    // '확인' 버튼을 누르면 폼이 제출되고, '취소'를 누르면 제출이 취소됨
    if (!confirmed) {
        event.preventDefault();  // '취소'를 눌렀을 때 폼 제출을 방지
    }else{
    	confirm("마이페이지로 이동합니다");
    }
});
</script>
</body>
</html>
