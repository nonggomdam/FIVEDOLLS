<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공연 정보 등록 페이지</title>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
	</head>
	<body>
		<div id="wrapper">
			<c:import url="/WEB-INF/views/admin/adminMenu.jsp"/>
			<h3>공연 정보 등록</h3>
			<form method="post" action="<c:url value='/admin/insertPerformance'/>">
				<table>
					<tr>
						<th>공연 등록 ID</th>
						<td><input type="text" name="performanceId" id="performanceId"></td>
					</tr>
					<tr>
						<th>공연 이름</th>
						<td><input type="text" name="performanceName"></td>
					</tr>
					<!-- <tr>
						<th>공연 포스터</th>
						<td><input type="file" name="performanceImagePath"></td>
					</tr> -->
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
						<td><input type="date" name="performanceDate"/></td>
					</tr>
					<tr>
						<th>공연 일시2</th>
						<td><input type="date" name="performanceDate2"></td>
					</tr>
					<tr>
						<th>R석 가격</th>
						<td><input type="text" name="performancePriceR">원</td>
					</tr>
					<tr>
						<th>S석 가격</th>
						<td><input type="text" name="performancePriceS">원</td>
					</tr>
					<tr>
						<th>관람 등급</th>
						<td><input type="text" name="performanceRatingCode">세 이상</td>
					</tr>
					<tr>
						<th>관람 시간</th>
						<td>총 <input type="text" name="performanceTime">분</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							<input type="text" id="performanceZipcode" name="performanceZipcode" size="5">
							<input type="button" id="searchZipBtn" name="searchZipBtn" value="우편 번호 찾기"><br>
							<input type="text" id="performanceAddress" name="performanceAddress" placeholder="주소 입력" size="70"><br>
							<input type="text" id="performanceDetailaddress" name="performanceDetailaddress" placeholder="상세 주소 입력" size="70">
						</td>
					</tr>
					<tr>
						<th>티켓 오픈 일자</th>
						<td><input type="date" name="reservationOpenExpectedDate" id="reservationOpenExpectedDate"></td>
					</tr>
				</table><br>
				<input type="submit" value="등록 완료">
			</form>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>