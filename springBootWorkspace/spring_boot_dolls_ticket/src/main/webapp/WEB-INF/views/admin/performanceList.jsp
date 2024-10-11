<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 공연 리스트 페이지</title>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<script src="<c:url value='/js/performanceDetailView.js'/>"></script>
	</head>
	<body>
		<div id="wrapper">
			<c:import url="/WEB-INF/views/admin/adminMenu.jsp"/>
			<div>
				<h3>공연 관리</h3>
				<button class="newPerformance" onclick="location.href='/admin/newPerformanceForm'">신규 공연 등록</button>
				<table id="performanceTable">
					<thead>
						<tr>
							<th>공연 ID</th>
							<th>공연명</th>
							<th>분류</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody id="performanceItems">
					<c:choose>
						<c:when test="${empty performanceList}">
							<tr>
								<td colspan="4">등록된 공연이 없습니다. </td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${performanceList}" var="performance">
								<tr id="${performance.performanceId}" class="performanceRow" style="cursor:pointer">
									<td>${performance.performanceId}</td>
									<td>${performance.performanceName}</a></td>
									<td>${performance.performanceKindCd}</td>
									<td>${performance.firstChangeDate}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>