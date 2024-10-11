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
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/ticketHubInquire.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/font3.css'/>">
	<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
	<script src="<c:url value='/js/ticketHubChangePrice.js'/>"></script>
	<script src="<c:url value='/js/ticketHubInquireModal.js'/>"></script>
</head>
<body>

	<div id="wrapper">
		<div>
			<h1>Ticket Hub</h1>
			<br>
			<h4>안전하고 투명한 티켓 양도 거래!</h4>
			<h4>신뢰할 수 있는 파이브돌스에서 안전하게 티켓을 양도하세요</h4>
		</div>
		
		<div id="status">

			<span>
				<c:choose>
			        <c:when test="${nb.assignmentStatus == 'A'}">
			            진행중
			        </c:when>
			        <c:when test="${nb.assignmentStatus == 'B'}">
			            완료
			        </c:when>
	        	</c:choose>
			</span>
			<span id="hit">조회 <span>${nb.hit}</span></span>
		</div>
		
		<div id="box">
			<table>
				
				<tr>
					<th style="border-top:1px solid lightgray;padding:20px;"><span class="back" sytle="width:200px;">작성자 ID</span></th>
					<td style="border-top:1px solid lightgray;"><div><span>${nb.custId}</span></div></td>
				</tr>
				
				
				<tr>
					<th style="padding:20px;"><span class="back">제목</span></th>
					<td><div><span>${nb.noticeTitle }</span></div></td>
				</tr>
			
			
				<tr>
					<th style="padding:20px;"><span class="back">양수 가능 티켓</span></th>
					<td>
						<form action="<c:url value='/receive/complete'/>" method="post" name="frm1">
						<input type="hidden" name="noticeId" value="${nb.noticeId}">
						<c:forEach var="item" items="${list}"> 
							<div class="show-item ${item.soldYn =='Y'?'sold':'' }">
								<input type="checkbox"  ${item.soldYn =='Y'?'disabled':'' } class="chkbox" style="width:20px;" name="seatAndId" value="${item.performanceId}@${item.reservationSeatInformation}">
								
								<span>${item.performanceKindCd}</span>
								<span>${item.performanceName}</span>
								<br>
								<span style="margin-left:40px;">${item.performanceDate}</span>
								<span>${item.reservationSeatInformation}</span>
								<span class="price" data-price=${item.performancePrice }>
									<fmt:formatNumber value="${item.performancePrice}" pattern="#,###"/>원
								</span>
								<c:if test="${item.soldYn == 'Y'}">
								<span style="margin-left:30px;color:red;font-weight:bold;border:3px solid red;border-radius:5px;padding:8px;">판매완료</span> 
								</c:if>
							</div>	
						</c:forEach>
						</form>	
					</td>
				</tr>		
			</table>
			
			<c:if test="${nb.custId != sessionScope.userId}">
			<div id="combine">
				<div id="price">
					<span class="total-price">최종 결제예정금액</span>
					<div>  		
						<div id="inner">
							<span class="total-price confirm-price">0원</span>
						</div>
					</div>
				</div>
				<div>
							
			
					<div class="receiveBtn">
						<c:if test="${sessionScope.userId == null }">
							<span onclick="alert('로그인이 필요합니다.');return false;">양수하기</span>
						</c:if> 
						<c:if test="${sessionScope.userId != null }"> 
							<span id="receiveBtn">양수하기</span>
						</c:if>		
					</div>
				</div>
			</div>
			</c:if>
		</div>

		
		<div id="open-modal" class="modal">
		    <div class="modal-content">
		        <p>총 결제 금액</p>
		        <p style="font-weight:bold;"><span class="confirm-price">원</span></p>
		        <p>결제 하시겠습니까?</p>
		        <div id="ask">
		        	<span class="ok" onclick="receiveTicket()">확인</span>
		        	<span class="close">취소</span>
		        </div>   
		    </div>
		</div>
	</div>
	
	<script>
		function receiveTicket(){
			frm1.submit();
		}
	
	</script>
	
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
</body>
</html>