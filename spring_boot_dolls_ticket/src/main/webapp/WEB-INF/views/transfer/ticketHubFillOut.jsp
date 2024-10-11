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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubFillOut.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/font3.css'/>">
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/ticketHubCheckYN.js'/>"></script>
</head>
<body>

	<div id="wrapper">
		<div>
			<h1>Ticket Hub</h1>
			<br>
			<h4>안전하고 투명한 티켓 양도 거래!</h4>
			<h4>신뢰할 수 있는 파이브돌스에서 안전하게 티켓을 양도하세요</h4>
		</div>
		
		<div id="box">
			<form action="<c:url value='/transfer/regist'/>" method="post">
			<table>
				
				<tr style="height:10px;">
				</tr>
				
				<tr>
					<th><span class="back">양도인 ID</span></th>
				</tr>
				<tr>
					<td style="border-bottom:1px solid lightgray"><div style="margin-top:-10px;"><span>${sessionScope.sid}</span></div></td>
				</tr>
				
				<tr style="height:10px;">
				</tr>
				
				<tr>
					<th><span class="back">제목</span></th>
				</tr>
				<tr>
					<td style="border-bottom:1px solid lightgray;"><input type="text" id="title" style="margin-left:40px;margin-bottom:15px;margin-top:12px;" placeholder="ex) 티켓 양도합니다." name="noticeTitle"></td>
				</tr>

				<tr style="height:10px;">
				</tr>
				
				<tr>
					<th><span class="back">내 주문 티켓 중 양도 가능 티켓</span></th>
				</tr>
				<tr>	
					<td>
						<c:forEach var="show" items="${showInfo}"> 
							<div class="show-item">
								<input type="checkbox" style="width:20px;" value="${show.reservationNumber}" name="reservationNumber">
								<span>${show.performanceKindCd}</span>
								<span>${show.performanceName}</span>
								<br>
								<span style="margin-left:40px;">${show.performanceDate}</span>
								<span>${show.reservationSeatInformation}석</span>
								<span><fmt:formatNumber value="${show.performancePrice}" pattern="#,###"/>원</span>
							</div>	
						</c:forEach>	
					</td>	
				</tr>
			</table>
		</div>
		
		<button id="submitBtn" type="submit">양도 신청하기</button>
		</form>
	</div>
	
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
</body>
</html>