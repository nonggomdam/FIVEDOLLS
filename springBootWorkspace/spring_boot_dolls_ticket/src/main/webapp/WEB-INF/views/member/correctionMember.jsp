<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
    	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
		<script src="<c:url value='/js/canclelation.js'/>"></script>
		<script src="<c:url value='/js/moveChangepassword.js'/>"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: inline-block;
            width: 150px;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 300px;
            padding: 5px;
        }
        button {
            padding: 5px 10px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원정보 수정</h2>
        <form action="" method="post">
            <!-- ID Field (Non-editable) -->
            <div class="form-group">
                <label for="userId">아이디:</label>
                <input type="text" id="userId" name="userId" value="${myInfo.custId}" readonly>
            </div>

            <!-- Password Field with Change Button -->
            <div class="form-group">
                <label for="password">비밀번호 확인 :</label>
                <input type="password" id="custPassword" name="custPassword" value="${myInfo.custPassword}" readonly>
                
   				<button type="button" id="changePassword">비밀번호 변경</button>
            </div>
           

            <!-- Name Field -->
            <div class="form-group">
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="${myInfo.custName}">
            </div>

            <!-- Email Field -->
            <div class="form-group">
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" value="${myInfo.custEmail}">
            </div>

            <!-- Phone Number Field with Change Button -->
            <div class="form-group">
                <label for="phone">휴대전화번호:</label>
                <input type="text" id="custPhonenumber" name="custPhonenumber" value="${myInfo.custPhonenumber}" maxlength = "11" placeholder="숫자로만 입력하세요">
            </div>

            <!-- Postal Code Field -->
            <div class="form-group">
                <label for="custZipcode">우편번호:</label>
       			 <input type="text" id="custZipcode" name="custZipcode" value="${myInfo.custZipcode}" size="5" readonly>
        		 <input type="button" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기"><br>
                
            </div>

            <!-- Address Field -->
            <div class="form-group">
                <label for="custAddress">주소:</label>
       			 <input type="text" id="custAddress" name="custAddress" value="${myInfo.custAddress}" readonly>
            </div>

            <!-- Detailed Address Field with Change Button -->
            <div class="form-group">
                <label for="custdetailAddress">상세주소:</label>
        		<input type="text" id="custDetailAddress" name="custDetailAddress" value="${myInfo.custDetailAddress}" placeholder="상세주소를 입력해주세요" >
            </div>
            
            <button type="submit">회원정보 변경</button>
            <button type="button" id="cancellation">취소</button>
        </form>
    </div>

</body>
</html>
