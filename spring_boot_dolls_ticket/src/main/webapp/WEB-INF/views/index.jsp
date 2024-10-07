<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main page</title>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
	</head>
	<body>
		<div id="wrap">
			<a href="<c:url value='/csAdmin'/>">admin</a><br>
			<a href="<c:url value='/myPage'/>">mypage</a><br>
			<a href="<c:url value='/performance/detailViewPerformance/${1}'/>">상세페이지</a><br>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>