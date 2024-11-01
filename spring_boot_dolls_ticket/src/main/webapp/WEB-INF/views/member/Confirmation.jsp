<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지</title>
    <c:import url="/WEB-INF/views/layout/top.jsp"/>
    <c:import url="/WEB-INF/views/layout/head.jsp"/>
    <script src="jquery-3.7.1.min.js"></script>
	<script type="text/javascript">	</script>
	
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f0f0f0;
        }


        .main {
            display: flex;
		    padding: 20px;
		    width:65%;
		    margin-top :30px;
		    margin-bottom : 60px;
        }
        .event h2{
        	margin-bottom: 20px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        
        .event img{
        	width: 100%;
        	margin-top : 10px;
        	margin-bottom : 40px;
        }

        .sidebar {
            width: 250px;
            background-color: #fff;
            padding: 20px;
            border-right: 1px solid #ddd;
            height:720px;
            border-radius: 10px;
        }

        .sidebar h2 {
            font-size: 20px;
            margin-bottom: 15px;
            color: #333;
        }

        .sidebar p {
            margin: 10px 0;
            color: #666;
        }

        .sidebar button {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            background-color: #e0e0e0;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            color: #333;
            cursor: pointer;
        }

        .sidebar button:hover {
            background-color: #ccc;
        }

        .mypage-content {
            flex: 1;
            justify-content: center; /* 수평 중앙 정렬 */
		    align-items: center;
            padding: 20px 30px;
            background-color: #fff;
            margin-left : 50px;
            border-radius: 10px;
        }

        .mypage-content h3 {
            font-size: 22px;
            margin-bottom: 20px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        
        

        .order-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 65px;
        }

        .order-table th, .order-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
            
        }
        .order-table img{
        	width:80px;
        }
        
        .order-table p{
        	margin-left : 10px;
		}

        .order-table th {
            background-color: #f4f4f4;
            width: 20%;
        }

        .order-status {
            display: flex;
            justify-content: space-around;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
        }

        .order-status div {
            text-align: center;
            font-size: 14px;
            color: #666;
        }
        
         .welcome-box {
            padding: 20px;
            background-color: #C97;
            height:90px;
            color: #fff;
            border-radius: 8px;
            margin-top : 30px;
            margin-bottom: 65px;
        }

        .welcome-box h2 {
            font-size: 22px;
            margin-top : 8px;
            margin-bottom : 15px;
            
        }
        
        .myInfo{
        	margin-top : 30px;
        	margin-bottom : 40px;
        	border: 1px solid #ddd;
        	padding: 10px;
        	align-items: center; /* 수직 중앙 정렬 */     
        	border-radius: 8px;
        }
        .service-center{
        	margin-top : 40px;
        }
        
        .warning {
			background-color: #f9f9f9;
			padding: 15px;
			border: 1px solid #ddd;
			color: red;
			font-size: 0.9em;
			margin-top: 30px;
			text-align: left;
		}
		
		.warning p {
			margin: 25px;
		}
		
		.warning h4{
			margin: 25px;
			color: black;
		}
		h3{
			margin-top:65px;
		}
		.filter-bar {
            display: flex;
            align-items: center;
            padding: 10px;
            background-color: #f8f9fa;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            margin-bottom : 15px;
        }

        .filter-bar select, 
        .filter-bar input[type="date"],
        .filter-bar button {
            padding: 8px 12px;
            margin-right: 10px;
            border: 1px solid #e0e0e0;
            border-radius: 3px;
            background-color: white;
            cursor: pointer;
        }

        .filter-bar button {
            background-color: #333;
            color: white;
            border: none;
        }

        .filter-bar .date-range {
            display: flex;
            align-items: center;
        }

        .filter-bar .date-range input[type="date"] {
            margin-right: 5px;
        }

        .filter-bar .time-periods button {
            padding: 8px 12px;
            margin-right: 5px;
            border: 1px solid #e0e0e0;
            background-color: white;
            cursor: pointer;
            color:black;
        }

        .filter-bar .time-periods button.active {
            border: 1px solid black;
        }
        
		.interest {
		    display: flex;
		    flex-wrap: wrap; /* 요소가 줄 바꿈되도록 설정 */
		    gap: 10px; /* 이미지 사이에 간격 추가 (선택 사항) */
		    margin-top : 40px;
		}
		
		.interest img {
		    width: calc(25% - 20px); /* 이미지가 5개 들어가도록 너비를 설정, 간격 고려 */
		    height: 360px; /* 비율에 맞게 자동으로 높이 조정 */
		}
		

    </style>
</head>
<body>


<div class="main">

    <div class="sidebar">
    	<div class="myInfo">
        	<h2>나의 정보</h2>
        	<p>환영합니다!</p>
        	<p>김태우 님은 일반 회원입니다.</p>
        </div>
        <button onclick="location.href='http://localhost:8080/member/correctionMember';">회원정보 변경</button>
        <button>예약확인/취소</button>
        <button>나의 관람내역</button>
		<div class="service-center">
	        <h2>고객센터</h2>
	        <p>전화 상담: 1544-5555</p>
	        <p>운영시간: 평일 09:00~18:00</p>
	        <p>토요일 09:00~17:00</p>
	        <p>일요일 및 공휴일 휴무</p>
	    </div>
    </div>
    


    <div class="mypage-content">
		<div class="welcome-box">
            <h2>안녕하세요! 김**님</h2>
           	<p>현재 등급: WELCOME | 0P</p>
        </div>
        <h3>나의 관람내역</h3>
        
	    <div class="filter-bar">
	        <!-- 드롭다운 메뉴 -->
	
	        <select>
	            <option>구분</option>
	            <option value="M">뮤지컬</option>
   				<option value="C">콘서트</option>
	        </select>
	
	        <!-- 기간 선택 버튼들 -->
	        <div class="time-periods">
	            <button>당일</button>
	            <button>1주</button>
	            <button class="active">1개월</button>
	            <button>3개월</button>
	            <button>6개월</button>
	        </div>
	
	        <!-- 날짜 범위 선택 -->
	        <div class="date-range">
	            <input type="date" value="2024-09-24">
	            <span>~</span>
	            <input type="date" value="2024-10-24">
	        </div>
	
	        <!-- 조회 버튼 -->
	        <button>조회</button>
	    </div>
        <table class="order-table">
            <thead>
                <tr>
                    <th>상품 정보</th>
                    <th>좌석정보</th>
                    <th>공연날짜</th>
                    <th>진행상태</th>
                    <th>구매확정 및 리뷰</th>                   
                </tr>
            </thead>
            <tbody>
            <c:forEach var="List" items="${ReservationList}">
                <tr>
                    <td style="width:220px;">
                       	<img src="../<c:out value="${List.performanceImagePath}"/>" alt="공연 이미지" width="50">
                       	<p>${List.performanceName}</p>
                       	<p>${List.performancePrice}원</p>
                    </td>
                    <td>${List.reservationSeatInformation}</td>
                    <td>${List.performanceDate}</td>
                    <td>
                    	<c:choose>
						    <c:when test="${List.reservationStatus == 'Y'}">
						        <span>결제완료</span>
						    </c:when>
						    <c:when test="${List.reservationStatus == 'N'}">
						        <span>결제대기</span>
						    </c:when>
					    </c:choose>
					</td>
                    <td><button>구매확정</button><button onclick="deleteCartItem('${List.reservationId}')">삭제</button>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <h3>관심목록</h3>
		<div class="interest">
			<img src="<c:url value='/img/musicul1.jpg'/>">
    		<img src="<c:url value='/img/musicul11.jpg'/>">
    		<img src="<c:url value='/img/musicul7.jpg'/>">	
    		<img src="<c:url value='/img/consert11.jpg'/>">
    	</div>

        <h3>유의사항</h3>
        <div class="warning">
        	<h4>취소 유의사항</h4>
			<p>- 취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</p>
			<p>- 예매 취소 시 결제 금액에서 수수료를 제외한 금액만큼 환불 처리 됩니다.</p>
			<p>(부분 취소 시에는 잔여 티켓 금액 + 수수료 등을 제외하고 환불 처리 됩니다.)</p>
			<p>- 예매 취소 시점과 해당 카드사의 환불 처리 기준에 따라 환급방법과 환급일은 다소 차이가 있을 수 있습니다.</p>
		</div>
    </div>
</div>
<c:import url="/WEB-INF/views/layout/footer.jsp"/>
</body>
<script>
function deleteCartItem(reservationId) {
    fetch(`/deleteCart?reservationId=` + reservationId, {
        method: 'POST'
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert("삭제되었습니다.");
            // 삭제 후 화면 갱신 등의 로직
        }
    })
    .catch(error => console.error('삭제 오류:', error));
}
</script>
</html>

