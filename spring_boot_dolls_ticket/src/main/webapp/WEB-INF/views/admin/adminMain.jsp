<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 메인 페이지</title>
		<c:import url="/WEB-INF/views/layout/adminHead.jsp"/>
		<c:import url="/WEB-INF/views/layout/adminTop.jsp"/>
		<script src="<c:url value='/js/adminPerformanceDetailView.js'/>"></script>
	</head>
	<body>
        <div class="adminMainWrapper">
            <table class="outerTable">
                <tr>
                    <td>
                        <div class="section">
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
                                                <td colspan="4">등록된 공연이 없습니다.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${performanceList}" var="performance">
                                                <tr id="${performance.performanceId}" class="performanceRow" style="cursor:pointer">
                                                    <td>${performance.performanceId}</td>
                                                    <td>${performance.performanceName}</td>
                                                    <td>${performance.performanceKindCd}</td>
                                                    <td><fmt:formatDate value="${performance.firstChangeDate}" pattern="yyyy-MM-dd"/></td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </td>
                    <td>
                        <div class="section">
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
                                	<c:choose>
                                        <c:when test="${empty notiecList}">
                                            <tr>
                                                <td colspan="4">등록된 공지 사항이 없습니다.</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${notiecList}" var="notice">
                                                <tr id="${notice.noticeNo}" class="noticeRow" style="cursor:pointer">
                                                    <td>${notice.noticeNo}</td>
                                                    <td>${notice.noticeType}</td>
                                                    <td>${notice.noticeTitle}</td>
                                                    <td><fmt:formatDate value="${notice.firstChangeDate}" pattern="yyyy-MM-dd"/></td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="section">
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
                    </td>
                    <td>
                        <div class="section">
                            <h3><a href="/admin/memList">사용자 관리</a></h3>
                            <table id="userTable">
                            	<thead>
                            		<tr>
                                        <th>ID</th>
                                        <th>가입일</th>
                                        <th>전화 번호</th>
                                        <th>이메일</th>
                                    </tr>
                            	</thead>
                            	<tbody id="userItems">
                            	</tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>
</html>