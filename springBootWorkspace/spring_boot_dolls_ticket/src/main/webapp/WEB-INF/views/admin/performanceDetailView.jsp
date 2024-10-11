<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공연 상세 페이지</title>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<script>
			function deleteCheck() {
				let answer = confirm("등록된 공연 정보를 삭제하시겠습니까? ");
				
				if (answer) location.href = "/admin/deletePerformance/${performance.performanceId}";
			}
			function updatePerformance() {
				location.href = "/admin/updatePerformanceForm/${performance.performanceId}";
			}
		</script>
	</head>
	<body>
		<div id="wrapper">
			<c:import url="/WEB-INF/views/admin/adminMenu.jsp"/>
				<p><a>${peformance.performanceKindCd}</a></p>
				<p>${performance.performanceName}</p>
				<p>등록일 : ${performance.firstChangeDate}</p>
				<p>마지막 수정일 : ${performance.lastChangeDate}</p>
				<div class="poster">
					<img src="<c:url value='/image/${performance.performanceImagePath}'/>">
				</div>
				<table>
					<tr>
						<th>공연 등록 ID</th>
						<td>${performance.performanceId}</td>
					</tr>
					<tr>
						<th>공연 이름</th>
						<td>${performance.performanceName}</td>
					</tr>
					<tr>
						<th>공연 종류</th>
						<td>${performance.performanceKindCd}</td>
					</tr>
					<tr>
						<th>공연 일시1</th>
						<td><fmt:formatDate value="${performance.performanceDate}" pattern="yyyy-MM-dd HH시"/></td>
					</tr>
					<tr>
						<th>공연 일시2</th>
						<td><fmt:formatDate value="${performance.performanceDate2}" pattern="yyyy-MM-dd HH시"/></td>
					</tr>
					<tr>
						<th>R석 가격</th>
						<td>${performance.performancePriceR}원</td>
					</tr>
					<tr>
						<th>S석 가격</th>
						<td>${performance.performancePriceS}원</td>
					</tr>
					<tr>
						<th>관람 등급</th>
						<td>${performance.performanceRatingCode}세 이상</td>
					</tr>
					<tr>
						<th>관람 시간</th>
						<td>총 ${performance.performanceTime}분</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							우편 번호 : ${performance.performanceZipcode}<br>
							주소 : ${performance.performanceAddress}<br>
							상세 주소 : ${performance.performanceDetailaddress}<br>
						</td>
					</tr>
					<tr>
						<th>티켓 오픈 일자</th>
						<td>${performance.reservationOpenExpectedDate}</td>
					</tr>
				</table>
				<div>
					<button class="updateBtn" onclick="updatePerformance();">수정</button>
					<button class="deleteBtn" onclick="deleteCheck();">삭제</button>
				</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>