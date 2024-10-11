<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<c:import url="/WEB-INF/views/layout/head.jsp"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubError.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/font3.css'/>">
</head>
<body>

	<div id="wrapper">
		<div>
			<h1>Ticket Hub</h1>
			<br>
			<h4>안전하고 투명한 티켓 양도 거래!</h4>
			<h4>신뢰할 수 있는 파이브돌스에서 안전하게 티켓을 양도하세요</h4>
		</div>
		
		
		<div id="complete">
			<p>${msg}</p>
			<a href="<c:url value='/transfer/list'/>"><h4 class="line">[로그인 하기]</h4></a>
		</div>
		
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		
</body>
</html>