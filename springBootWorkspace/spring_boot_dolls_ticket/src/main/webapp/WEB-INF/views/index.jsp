<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main page</title>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/body.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/body.js'/>"></script>
	</head>
	<body>
<<<<<<< Updated upstream
		 	<c:import url="/WEB-INF/views/layout/body.jsp"/>
		 	
=======
		<div id="wrap">
			<a href="<c:url value='/admin'/>">admin</a><br>
			<a href="<c:url value='/myPage'/>">mypage</a><br>
			<a href="<c:url value='/performance/detailViewPerformance/${1}'/>">상세페이지</a><br>
>>>>>>> Stashed changes
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
	</body>
</html>