<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>

	<body>
		<div class="navbar">
			<div style="width:20%; text-align: center;" class="mainLogo">
				<a href="/">FiveDolls</a>
			</div>
	        <!-- Center: Musical and Concert Categories -->
	        <div style="width:60%; text-align: center;" class="categories">
	            <a href="/performance/musicalDetailPage">뮤지컬</a>
	            <a href="/performance/consertDetailPage">콘서트</a>
	            <a href="">양도하기</a>
	        </div>
	        
			
			<div style="width:20%; text-align: right;" class="member">
				<c:if test="${empty sessionScope.sid }">			
					<a href="<c:url value='/member/loginPage'/>">로그인</a>					
				</c:if>
						
				<c:if test="${not empty sessionScope.sid }">
					<span style="color: white;">${sessionScope.sid }님 환영합니다!</span>		
					<a href="<c:url value='/member/logout'/>">로그아웃</a>					
					<a href="<c:url value='/member/myPage'/>">마이페이지</a>
				</c:if> 
			</div>
    	</div> 
    	
    </body>
</html>
