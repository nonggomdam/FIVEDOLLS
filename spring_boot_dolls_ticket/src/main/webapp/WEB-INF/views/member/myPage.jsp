<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>my page</title>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#orderedTicketList').click(function() {
	                window.location.href = '/orderDetail';
	            });
	        });
			$(document).ready(function() {
				$('.orderCancelBtn').click(function() {
	                window.location.href = '/refund';
	            });
			});
		</script>
	</head>
	<body>
		<div id="wrapper">
			<c:import url="/WEB-INF/views/member/myPageMenu.jsp"/>
			<div id="container">
				<div>
					<h3>예매 내역 검색</h3>
					<form method="post" id="orderSearchForm">
						예매 상태
						<select>
							<option value="all">전체</option>
							<option value="payCompleted">결제 완료</option>
							<option value="preparingShip">발송/배송 준비 중</option>
							<option value="shipping">발송/배송 중</option>
							<option value="shipCompleted">발송/배송 완료</option>
							<option value="cancelCompleted">취소 완료</option>
							<option value="cancelCompleted">환불 완료</option>
						</select>
						<br>
						주문 일시
						from 
						<input type="date">
						to
						<input type="date">
						<br>
						예매 번호
						<input type="text"><br>
						<input type="submit" value="검색">
					</form>
				</div>
				<div>
					<div>
						<h3>예매 내역 조회</h3>
						정렬
						<select>
							<option>날짜순</option>
							<option>상태순</option>
						</select>
					</div>
					<table id="orderList" class="orderInfo">
						<tr>
							<th>NO</th>
							<th>예매일</th>
							<th>예매 번호</th>
							<th>상품명</th>
							<th>관람 일시</th>
							<th>매수</th>
							<th>예매 상태</th>
							<th>결제 금액</th>
						</tr>
						<tr id="orderedTicketList">
							<td>1</td>
							<td>2024년 01월 01일</td>
							<td>1234-5678</td>
							<td>OO 공연</td>
							<td>2024년 12월 12일</td>
							<td>1매</td>
							<td>
								결제 완료<br>
								<button class="orderCancelBtn">취소</button>
							</td>
							<td>100000원</td>
						</tr>
					</table>
					<c:import url="/WEB-INF/views/layout/pagination.jsp"/>
				</div>
			</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>