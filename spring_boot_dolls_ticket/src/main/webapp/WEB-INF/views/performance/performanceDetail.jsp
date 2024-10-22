<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true"%>
<%
// 세션에서 "username"이라는 값을 가져옴
String userId = (String) session.getAttribute("sid");
if (userId == null) {
	userId = ""; // 세션에 값이 없으면 빈 문자열로 설정
}
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>detail Page</title>
	<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<c:import url="/WEB-INF/views/layout/head.jsp"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/performanceDetail.css'/>">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1df0943899c83997c7b907c959ed39c1"></script>
	<script src="<c:url value='/js/ticketOpen.js'/>"></script>
	<script src="<c:url value='/js/review.js'/>"></script>
	</head>
<body>
	<div class="detailPage-wrap">
		<div class="detailPage-content">
			<div class="dt-01">
				<!--로케이션-->
				<p class="dt-location">
				<c:if test="${pfm.performanceKindCd eq 'C'}">
					<a>콘서트 ></a>
				</c:if>
				<c:if test="${pfm.performanceKindCd eq 'M'}">
					<a>뮤지컬 ></a>
				</c:if>
				</p>
			</div>
		</div>
		<div class="dt-02">
			<!--제목-->
			<input type="hidden" id="performanceId" value="${pfm.performanceId}">
			<p class="dt-title">${pfm.performanceName}</p>
		</div>
	</div>
	<div class="concert-wrap"></div>
	<div class="detailPage-wrap dw2">
		<div class="detailPage-content">
			<div class="dt-03">
				<!--상단-->
				<div class="dt-03-left">
					<!--포스터-->
					<div class="dt-product-imgbox">
						<img src="<c:url value='${pfm.performanceImagePath}'/>">
					</div>
				</div>
				<!--dt-03-left-->
				<div class="dt-03-right">
					<!--상품정보-->
					<dl>
						<dt>등급</dt>
						<c:if test="${pfm.performanceRatingCode == 0}">
						<dd>&nbsp;전체 관람가</dd>
						</c:if>
						<c:if test="${pfm.performanceRatingCode != 0}">
						<dd>&nbsp;만 ${pfm.performanceRatingCode}세 이상</dd>
						</c:if>
						<dt>관람시간</dt>
						<dd>&nbsp;총 ${pfm.performanceTime}분</dd>
						<dt>장소</dt>
						<dd>&nbsp;${pfm.performanceDetailAddress}</dd>
						<dt>가격</dt>
						<dd>&nbsp;R석 <fmt:formatNumber value="${pfm.performancePriceR}" pattern="###,###"/>원</dd>
						<dd>&nbsp;S석 <fmt:formatNumber value="${pfm.performancePriceS}" pattern="###,###"/>원</dd>
						<dt>공연시간</dt>
						<dd>&nbsp;<fmt:formatDate value="${pfm.performanceDate1}" pattern="YYYY년 MM월 dd일(E) a h시"/></dd>
						<dd>&nbsp;<fmt:formatDate value="${pfm.performanceDate2}" pattern="YYYY년 MM월 dd일(E) a h시"/></dd>
					</dl>
					<button id="ticketOpenBtn" disabled></button>
				</div>
			</div>
		</div>
		<div class="dt-04">
			<a href="" id="describe"><span>상세정보</span></a>
			<a href="" id="goReview"><span>관람후기<span class="dt-04-count">(10)</span></span></a>
		</div>
		<div class="detailPage-describe">
			<div class="dt-05">
				<p class="dt05-tit">유의사항</p>
				<p>※ 매수제한 : 1인 4매</p>
				<p>※ 본 공연은 할인쿠폰이벤트 대상에서 제외됩니다.</p>
				<p>※ 불법적인 경로 혹은 불법적인 시스템을 통해 티켓을 구매할 경우 법적 제재를 받을 수 있습니다.</p>
				<p class="dt05-tit">공연정보<br><br>
				<img src="<c:url value='${pfm.performanceInformationImagePath}'/>"></p>	
				<%-- <p>공연일시: <fmt:formatDate value="${pfm.performanceDate1}" pattern="YYYY년 MM월 dd일(E) a h시"/>,
				<fmt:formatDate value="${pfm.performanceDate2}" pattern="YYYY년 MM월 dd일(E) a h시"/></p>
				<p>예매가능시간: 공연시작 3시간 전까지</p> --%>
				<p class="dt05-tit">장소안내</p>
					<div id="map"></div>
				<input type="hidden" id="performanceDetailAddress" value="${pfm.performanceDetailAddress}">
				<p>주소: ${pfm.performanceZipcode} ${pfm.performanceAddress} ${pfm.performanceDetailAddress}</p>
				<p>주차공간이 없으므로 대중교통을 이용하시기 바랍니다.</p>
				<p class="dt05-tit">상품정보제공 고시</p>
				<div class="dt05-txt">
					<div class="dt05-tbl dt05-tbl-plus">
						<table>
							<caption></caption>
							<colgroup>
								<col width="18.5%">
								<col width="31.5%">
								<col width="18.5%">
								<col width="31.5%">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">주최/기획</th>
									<td>파이브돌스엔터테인먼트</td>
									<th scope="row" class="rn08-tbl-tit2">고객센터</th>
									<td>1234-1234</td>
								</tr>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">관람시간</th>
									<td>${pfm.performanceTime}분</td>
									<th scope="row" class="rn08-tbl-tit2">관람등급</th>
									<td>만 ${pfm.performanceRatingCode}세 이상</td>
								</tr>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">예매수수료</th>
									<td>2,000원</td>
									<th scope="row" class="rn08-tbl-tit2">배송료</th>
									<td>3,000원</td>
								</tr>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">유효기간</th>
									<td colspan="3"><fmt:formatDate value="${pfm.performanceDate1}" pattern="YYYY년 MM월 dd일(E) a h시"/>,
													<fmt:formatDate value="${pfm.performanceDate2}" pattern="YYYY년 MM월 dd일(E) a h시"/> 예매한 공연 날짜, 회차에 한해 이용가능</td>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">취소/환불방법</th>
									<td colspan="3">
										<div class="dt05-detail-box">
											<p>
												공연시작 3시간 전까지 취소수수료가 없으며, 예매 수수료도 환불됩니다.<br> 취소는
												마이페이지&gt;예매확인/취소 에서 직접 취소 또는 고객센터(1234-1234)를 통해 취소 가능합니다.<br>
												티켓이 배송된 후에는 인터넷 취소가 불가하며, 취소마감시간 이전에 고객센터로 티켓이 반송되어야 취소
												가능합니다.<br>
											</p>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<p class="dt05-tit">관람후기</p>
				<div class="write">
					<c:if test="${sessionScope.sid == null}">
						<a onclick="alert('로그인이 필요합니다.')"><span>후기 작성하기</span></a>
					</c:if>
					<c:if test="${sessionScope.sid != null}">
						<a href="" onclick="openPopup()"><span>후기 작성하기</span></a>
					</c:if>
				</div>
				<div class="rev-container">
					<ul class="review">
						<li>
							<div class="writerBox">
								<span class="writerId">xhaht***</span> <span class="writeDate">2024.10.18</span>
								<span class="reviewGrade"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>">
								</span>
								<div class="reviewText">새로운 시즌! 새로운 배우님들의 조합이 좋았습니다 재미있게
									관람했어요 개인적으로 경수베를렌느가 좋았습니다~ 감정선이 와닿았어요</div>
							</div>
						</li>
						<li>
							<div class="writerBox">
								<span class="writerId">tin***</span> <span class="writeDate">2024.10.17</span>
								<span class="reviewGrade"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>">
								</span>
								<div class="reviewText">와아~~~ 배우들이 극을 잘 마는데ㅠ 무대 조명 오케 모든
									것이 완벽하여~~~ 보는내내 감탄을~ 와아~~~ 신박하다! 나보다 화장을 잘하는 배우들이란!? 오옷♡♡♡</div>
							</div>
						</li>
						<li>
							<div class="writerBox">
								<span class="writerId">ehdwn0***</span> <span class="writeDate">2024.10.15</span>
								<span class="reviewGrade"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>">
								</span>
								<div class="reviewText">꼭 락콘서트 다녀 온 기분이에요 컷콜에서 신나게 목소리 한껏
									높여 질렀더니 날아갈 거 같아요... 알앤디 특유의 현란한 조명과 배우들의 열연 라이브밴드까지 좋았습니다</div>
							</div>
						</li>
						<li>
							<div class="writerBox">
								<span class="writerId">ytr***</span> <span class="writeDate">2024.10.13</span>
								<span class="reviewGrade"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>">
								</span>
								<div class="reviewText">이름만큼 아름답고 눈부신 반짝반짝한 글램락을 보실 수
									있습니다.</div>
							</div>
						</li>
						<li>
							<div class="writerBox">
								<span class="writerId">lemon***</span> <span class="writeDate">2024.10.11</span>
								<span class="reviewGrade"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>"> <img
									src="<c:url value='/image/icons8-star-16.png'/>">
								</span>
								<div class="reviewText">너무나 아름다운 이야기 평생했으면좋겠어요아니 열자 넘었잖아요</div>
							</div>
						</li>
					</ul>
					<div class="list-pagination" style="display: block;">
						<a href="" class="list-page-first"><img src="<c:url value='/image/icons8-arrow-20.png'/>"></a>
						<div>
							<a href="#" onclick="return false;" class="on"><span>1</span></a><a
								href=""><span>2</span></a><a
								href=""><span>3</span></a><a
								href=""><span>4</span></a><a
								href=""><span>5</span></a><a
								href=""><span>6</span></a><a
								href=""><span>7</span></a><a
								href=""><span>8</span></a><a
								href=""><span>9</span></a><a
								href=""><span>10</span></a>
						</div>
						<a href="" class="list-page-last"><img	src="<c:url value='/image/icons8-arrow-20_2.png'/>"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
<script>

$(document).ready(function() {
    $('#ticketOpenBtn').on('click', function() {
        var userConfirmed = confirm(" 좌석예약 페이지로 이동하시겠습니까?");
        
        if (userConfirmed) {
            // 사용자가 "예"를 눌렀을 때 페이지 이동
            window.location.href = '/performance/dateReservation/${pfm.performanceId}'; // 원하는 URL로 변경
        }
    });
});

</script>
</html>