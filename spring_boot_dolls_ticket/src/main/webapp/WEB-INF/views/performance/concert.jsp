<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>concert page</title>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/body.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/concert.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/font5.css'/>">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/body.js'/>"></script>
	</head>
	<body>
	<div class="swiper mySwiper">
	    <div class="swiper-wrapper">
	      <div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0001'/>"><img src="<c:url value='/image/c_banner1.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 나훈아 콘서트</p>
						<p class="slide-detail">2024.12.14 ~ 2024.12.15</p>
				</div></a>
		  </div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0005'/>"><img src="<c:url value='/image/c_banner2.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 NE-YO 콘서트</p>
						<p class="slide-detail">2024.11.16 ~ 2024.11.17</p>
				</div></a>
		  </div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0004'/>"><img src="<c:url value='/image/c_banner3.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 적재 콘서트</p>
						<p class="slide-detail">2024.11.09 ~ 2024.11.10</p>
				</div></a>
			</div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0006'/>"><img src="<c:url value='/image/c_banner4.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 이찬원 콘서트</p>
						<p class="slide-detail">2024.12.14 ~ 2024.12.15</p>
				</div></a>
			</div>
			<div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0007'/>"><img src="<c:url value='/image/c_banner5.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">2024 송골매 콘서트</p>
						<p class="slide-detail">2024.11.16 ~ 2024.11.17</p>
				</div></a>
			</div>
	      <div class="swiper-slide">
				<a href="<c:url value='/performance/detailViewPerformance/P0008'/>"><img src="<c:url value='/image/c_banner6.jfif'/>">
				<div class="slide-txt">
						<p class="slide-tit">박진영 30주년 콘서트〈Still JYP〉</p>
						<p class="slide-detail">2024.12.28 ~ 2024.12.29</p>
				</div></a>
			</div>
	    </div>
  	</div>


	<div class="empty2"></div>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="<c:url value='/js/swiper.js'/>"></script>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
	</body>
</html>
 		
