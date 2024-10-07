<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세페이지</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/productDetail.css'/>">
<script src="<c:url value='/js/ticketOpen.js'/>"></script>
</head>
<body>
	<div class="detailPage-wrap">
		<div class="detailPage-content">
			<div class="dt-01">
				<!--로케이션-->
				<p class="dt-location">
					<a>콘서트</a>
				</p>
			</div>
		</div>
		<div class="dt-02">
			<!--제목-->
			<p class="dt-title">2024 FiveDolls concert</p>
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
						<img src="image/poster.png">
					</div>
				</div>
				<!--dt-03-left-->
				<div class="dt-03-right">
					<!--상품정보-->
					<dl>
						<dt>등급</dt>
						<dd>&nbsp;만 15세 이상</dd>
						<dt>관람시간</dt>
						<dd>&nbsp;총 120분 예상</dd>
						<dt>장소</dt>
						<dd>&nbsp;멀티캠퍼스</dd>
						<dt>가격</dt>
						<dd>
							&nbsp;R석 154,000원<br>&nbsp;S석 134,000원
						</dd>
						<dt>공연시간</dt>
						<dd>
							&nbsp;2024년 11월 14일(목) 오후 8시<br>&nbsp;2024년 11월 15일(금) 오후 8시
						</dd>
					</dl>
					<button id="ticketOpenBtn" disabled>10/30 11:00 오픈</button>
				</div>
			</div>
		</div>
		<div class="dt-04">
			<!--상세정보-->
			<a>상세정보</a>
		</div>
		<div class="detailPage-describe">
			<div class="dt-05">
				<p class="dt05-tit">유의사항</p>
				<p>※ 매수제한 : 1인 4매</p>
				<p>※ 본 공연은 할인쿠폰이벤트 대상에서 제외됩니다.</p>
				<p>※ 불법적인 경로 혹은 불법적인 시스템을 통해 티켓을 구매할 경우 법적 제재를 받을 수 있습니다.</p>
				<p class="dt05-tit">공연정보</p>
				<p>공연일시: 2024년 11월 14일(목)~15일(금) 오후 8시</p>
				<p>예매가능시간: 공연시작 3시간 전까지</p>
				<p class="dt05-tit">장소안내</p>
				<img src="image/map.gif">
				<p>주소: 서울특별시 강남구 테헤란로 212 (역삼동 718-5번지) 멀티캠퍼스 역삼</p>
				<p>주차공간이 없으므로 대중교통을 이용하시기 바랍니다.</p>
				<p>※ 대중교통 안내</p>
				<p>지하철: 2호선 역삼역 1번출구 (선릉역 방향으로 도보 3분거리)</p>
				<p>버스: 한서병원 하차 또는 (건너편) 아가방빌딩.하나은행 하차(146번, 242번, 341번, 360번,
					740번, N13번, N61번)</p>
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
									<td>120분</td>
									<th scope="row" class="rn08-tbl-tit2">관람등급</th>
									<td>만 15세 이상</td>
								</tr>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">예매수수료</th>
									<td>2,000원</td>
									<th scope="row" class="rn08-tbl-tit2">배송료</th>
									<td>3,000원</td>
								</tr>
								<tr>
									<th scope="row" class="dt05-tbl-tit2">유효기간</th>
									<td colspan="3">2024.11.14~2024.11.15 예매한 공연 날짜, 회차에 한해
										이용가능</td>
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
			</div>
		</div>
	</div>
</body>
</html>