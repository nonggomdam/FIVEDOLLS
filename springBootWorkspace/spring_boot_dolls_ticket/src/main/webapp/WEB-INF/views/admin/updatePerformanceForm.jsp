<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공연 정보 수정 페이지</title>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
	</head>
	<body>
		<div id="wrapper">
			<c:import url="/WEB-INF/views/admin/adminMenu.jsp"/>
			<h3>${performance.performanceName} 정보 수정</h3>
			<form method="post" action="<c:url value='/admin/updatePerformance'/>">
				<table>
					<tr>
						<th>공연 등록 ID</th>
						<td><input type="text" name="performanceId" id="performanceId" value="${performance.performanceId}" readonly></td>
					</tr>
					<tr>
						<th>공연 이름</th>
						<td><input type="text" name="performanceName" id="performanceName" value="${performance.performanceName}"></td>
					</tr>
					<tr>
						<th>공연 종류</th>
						<td>
							<select name="performanceKindCd">
								<option value="콘서트">콘서트</option>
								<option value="뮤지컬">뮤지컬</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>공연 일시1</th>
						<td><input type="date" name="performanceDate" id="performanceDate" value="<fmt:formatDate value="${performance.performanceDate}" pattern="YYYY-MM-dd"/>"></td>
					</tr>
					<tr>
						<th>공연 일시2</th>
						<td><input type="date" name="performanceDate2" id="performanceDate2" value="<fmt:formatDate value="${performance.performanceDate2}" pattern="YYYY-MM-dd"/>"></td>
					</tr>
					<tr>
						<th>R석 가격</th>
						<td><input type="text" name="performancePriceR" id="performancePriceR" value="${performance.performancePriceR}">원</td>
					</tr>
					<tr>
						<th>S석 가격</th>
						<td><input type="text" name="performancePriceS" id="performancePriceS" value="${performance.performancePriceS}">원</td>
					</tr>
					<tr>
						<th>관람 등급</th>
						<td><input type="text" name="performanceRatingCode" id="performanceRatingCode" value="${performance.performanceRatingCode}">세 이상</td>
					</tr>
					<tr>
						<th>관람 시간</th>
						<td>총 <input type="text" name="performanceTime" id="performanceTime" value="${performance.performanceTime}">분</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							<input type="text" id="performanceZipcode" name="performanceZipcode" size="5" value="${performance.performanceZipcode}" readonly>
							<input type="button" id="searchZipBtn" name="searchZipBtn" value="우편 번호 찾기"><br>
							<input type="text" id="performanceAddress" name="performanceAddress" placeholder="주소 입력" size="70" value="${performance.performanceAddress}" readonly><br>
							<input type="text" id="performanceDetailaddress" name="performanceDetailaddress" placeholder="상세 주소 입력" size="70" value="${performance.performanceDetailaddress}">
						</td>
					</tr>
					<tr>
						<th>티켓 오픈 일자</th>
						<td><input type="date" name="reservationOpenExpectedDate" id="reservationOpenExpectedDate" value="<fmt:formatDate value="${performance.reservationOpenExpectedDate}" pattern="YYYY-MM-dd"/>"></td>
					</tr>
				</table><br>
				<input type="submit" value="수정 완료">
				<input type="reset" value="수정 취소">
			</form>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>