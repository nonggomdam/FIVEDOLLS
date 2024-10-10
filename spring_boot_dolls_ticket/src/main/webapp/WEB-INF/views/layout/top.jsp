<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- top 메뉴 구성 -->
<header>
        		<div id="headerBox">
	            	<%-- <div id="logoBox"><a href="<c:url value='/'/>"><img src="/image/logo.png" id="logoImg"></a></div> --%>
					<div id="topMenuBox">
					<!-- session 값에 따라 다르게 메뉴 항목 출력 -->
					<!-- 로그인 하지 않은 경우(session 값 없음) -->
				
					<c:if test="${empty sessionScope.sid }">
					<a href="<c:url value='/member/loginForm'/>">로그인</a> 
					<a href="<c:url value='/'/>">고객센터</a>
					</c:if>
					
					
					<!-- 로그인한 경우 -->
					<c:if test="${not empty sessionScope.sid }">
					${sessionScope.sid } 님 환영합니다.
					<a href="<c:url value='/member/logout'/>">로그아웃</a> 
					<a href="<c:url value='/member/joinForm'/>">마이페이지</a>
					<%-- <a href="<c:url value='/member/myPage'/>">마이페이지</a> --%>
					</c:if>
					
					</div>
            	</div>
            	
        <div id="mainMenu" class="deactive">
            <h1 class="title"><a href="index.jsp">Five Dolls</a></h1>
            <nav>
                <ul>
                    <li><a href="">뮤지컬</a></li>
                    <li><a href="">콘서트</a></li>
                    <!-- <li><a href="">연극</a></li>
                    <li><a href="">전시</a></li> -->
                    <li><a href="">커뮤니티</a></li>
                </ul>
            </nav>
            <div id="searchBox">
            <input type="text" id="search">
            <button id="searchBtn">검색</button>
            </div>
            
        </div>
        
        
   
            </header>
             
