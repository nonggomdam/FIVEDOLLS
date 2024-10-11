<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 메인 페이지</title>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>		   	
		<script src="<c:url value='/js/performanceDetailView.js'/>"></script>
	</head>
	<body>
		<div id="wrapper">
			<c:import url="/WEB-INF/views/admin/adminMenu.jsp"/>
			<div>
				<h3><a href="/admin/performanceList">공연 관리</a></h3>
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
										<td>${performance.performanceName}</td>
										<td>${performance.performanceKindCd}</td>
										<td>${performance.firstChangeDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<div>
				<h3><a href="/admin/noticeList">공지 사항</a></h3>
				<table id="noticeTable">
					<thead>
						<tr>
							<th>NO</th>
							<th>분류</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody id="noticeItems">
					</tbody>
				</table>
			</div>
			<div>
				<h3><a href="/admin/qaList">1:1 문의</a></h3>
				<table id="qaTable">
					<thead>
						<tr>
							<th>NO</th>
							<th>처리 상태</th>
							<th>제목</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody id="qaItems">
					</tbody>
				</table>
			</div>
			<div>
				<h3><a href="/admin/memList">사용자 관리</a></h3>
			</div>
			<c:import url="/WEB-INF/views/layout/footer.jsp"/>
		</div>
	</body>
</html>