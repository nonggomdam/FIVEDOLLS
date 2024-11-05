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
  	
	<h1>NOW OPEN</h1>
	<table id="initialTable">
		<tr>
		<c:forEach items="${consertOpenList}" var="consertOpen" varStatus="status">
		<c:if test="${status.index % 4 == 0}">
            <tr>
        </c:if>
			<td class="ranking">
				<div class="info">				
					<img src="<c:url value='/image/${consertOpen.performanceImagePath}'/>">
						<div class="textinfo">
							<span>${consertOpen.performanceName}<br>
								  <br>
								  <fmt:formatDate value="${consertOpen.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${consertOpen.maxPerformanceDate}" pattern="yyyy.MM.dd"/><br>
								  <br><a href="/performance/detailViewPerformance/${consertOpen.performanceId}">공연 상세정보</a>
						 	</span>
						</div>
					</a>						
				</div>	
			</td>
		    <c:if test="${(status.index + 1) % 4 == 0}">
	            </tr>
	        </c:if>
		</c:forEach>
		</tr>
	</table>

		<div class="banner">
				<a href="<c:url value='/performance/detailViewPerformance/P0017'/>"><img src="<c:url value='/image/long_banner.png'/>"></a>
		</div>
		<h1>TICKET COMING SOON</h1>
		<table id="initialTable">
		<tr>
		<c:forEach items="${consertOpenExpectedList}" var="consertOpenExpected" varStatus="status">
		<c:if test="${status.index % 4 == 0}">
            <tr>
        </c:if>
			<td class="ranking">
				<div class="info">				
					<img src="<c:url value='/image/${consertOpenExpected.performanceImagePath}'/>">
						<div class="textinfo">
							<span>${consertOpenExpected.performanceName}<br>
								  <br>
								  <fmt:formatDate value="${consertOpenExpected.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${consertOpenExpected.maxPerformanceDate}" pattern="yyyy.MM.dd"/><br>
								  <br>오픈예정일자: <fmt:formatDate value="${consertOpenExpected.reservationOpenExpectedDate}" pattern="yyyy.MM.dd"/>
								  <br><br><a href="/performance/detailViewPerformance/${consertOpenExpected.performanceId}">공연 상세정보</a>
						 	</span>
						</div>
						<div class="info-txt">
							<p class="info-txt1">${consertOpenExpected.performanceName}</p>
							<p class="info-txt2"><fmt:formatDate value="${consertOpenExpected.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${consertOpenExpected.maxPerformanceDate}" pattern="yyyy.MM.dd"/></p>
						</div>						
				</div>	
			</td>
		    <c:if test="${(status.index + 1) % 4 == 0}">
	            </tr>
	        </c:if>
		</c:forEach>
		</tr>
			<%-- <tr>
			<td class="">
	            <div class="images">
	                <c:forEach items = "${consertOpenExpectedList}"  var = "consertOpenExpected">
	                	<div class="item">
			                <img src="<c:url value='/image/${consertOpenExpected.performanceImagePath}'/>">			                  
			                <p id="deteail"> <fmt:formatDate value="${consertOpenExpected.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${consertOpenExpected.maxPerformanceDate}" pattern="yyyy.MM.dd"/> </p>
			                <p>오픈예정일자: <fmt:formatDate value="${consertOpenExpected.reservationOpenExpectedDate}" pattern="yyyy.MM.dd"/></p>
			                	<h2 >${consertOpenExpected.performanceName}</h2>
			                <div class="caption">
			                    <h2>${consertOpenExpected.performanceName}</h2>
			                    <p>공연날짜: <fmt:formatDate value="${consertOpenExpected.minPerformanceDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${consertOpenExpected.maxPerformanceDate}" pattern="yyyy.MM.dd"/>  </p>
			                    <p>공연장소</p>
			                    <p>${consertOpenExpected.performanceAddress} ${consertOpenExpected.performanceDetailAddress}</p>
			                    <a href="/performance/detailViewPerformance/${consertOpenExpected.performanceId}">공연 상세정보</a>
			                </div>
			            </div>
	                </c:forEach>
	            </div>
			</td>
			</tr> --%>
		</table>

	<div class="empty2"></div>

	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script src="<c:url value='/js/swiper.js'/>"></script>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>	
	</body>
</html>
 		
