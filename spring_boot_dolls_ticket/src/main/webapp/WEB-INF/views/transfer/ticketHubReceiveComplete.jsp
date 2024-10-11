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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubReceiveComplete.css'/>">
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
			<p>양도받기가 완료되었습니다</p>
			<p>마이페이지에서 양도받은 내역을 확인하실 수 있습니다</p>
			<a href="<c:url value='#'/>"><h4 class="line">[나의 양도받은 내역 확인하러 가기]</h4></a>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
</body>
</html>