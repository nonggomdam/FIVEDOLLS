<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>concert page</title>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/concert.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/font5.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/body.js'/>"></script>
	</head>
	<body>

	<div id="wrapper">
		<div>
			<h1>RANKING</h1>
		
			<table id="initialTable">
				<tr>
					<td class="ranking">
						<div class="info">
							<a href="<c:url value='/performance/detailViewPerformance/P0001'/>"><img src="<c:url value='/image/superjunior0001.PNG'/>">
								<div class="textinfo">
									<span>슈퍼주니어<br>
										  <br>
										  2024.11.14~2024.11.15<br>
										  올림픽홀<br>
										  <br>
										  관람연령 15세이상<br>
									</span>
								</div>
							</a>						
						</div>
					</td>
					<td class="ranking">
						<div class="info">				
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/langlang0002.PNG'/>">
								<div class="textinfo">
									<span>랑랑<br>
										  <br>
										  2024.11.16~2024.11.18<br>
										  올림픽홀<br>
										  <br>
										  관람연령 15세이상<br>
								 	</span>
								</div>
							</a>						
						</div>	
					</td>
					<td class="ranking">
						<div class="info">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/neo0003.PNG'/>">
								<div class="textinfo">
									<span>neo<br>
										  <br>
										  2024.11.18~2024.11.20<br>
										  올림픽홀<br>
										  <br>
										  관람연령 15세이상<br>
								 	</span>
								</div>
							</a>							
						</div>
					</td>
					<td class="ranking">
						<div class="info">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/onerepublic0004.PNG'/>">
								<div class="textinfo">
									<span>OneRepublic<br>
										  <br>
										  2024.11.20~2024.11.22<br>
										  올림픽홀<br>
										  <br>
										  관람연령 15세이상<br>
								 	</span>
								</div>
							</a>							
						</div>
					</td>
				</tr>
				
				<tr>
					<td class="ranking">
						<div class="info">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/youngtak0005.PNG'/>">
								<div class="textinfo">
									<span>영탁<br>
										  <br>
										  2024.12.01~2024.12.03<br>
										  올림픽홀<br>
										  <br>
										  관람연령 15세이상<br>
									</span>
								</div>
							</a>							
						</div>
					</td>
					<td class="ranking">
						<div class="info">				
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/jukjae0006.PNG'/>">
								<div class="textinfo">
									<span>적재<br>
										  <br>
										  2024.12.03~2024.12.05<br>
										  올림픽홀<br>
										  <br>
										  관람연령 15세이상<br>
								 	</span>
								</div>
							</a>							
						</div>	
					</td>
					<td class="ranking">
						<div class="info">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/david0007.PNG'/>">
								<div class="textinfo">
									<span>David<br>
										  <br>
										  2024.12.05~2024.12.07<br>
										  올림픽홀<br>
										  <br>
										  관람연령 15세이상<br>
								 	</span>
								</div>
							</a>								
						</div>
					</td>
					<td class="ranking">
						<div class="info">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/waves0008.PNG'/>">
								<div class="textinfo">
									<span>waves<br>
										  <br>
										  2024.12.07~2024.12.10<br>
										  올림픽홀<br>
										  <br>
										  관람연령 15세이상<br>
								 	</span>
								</div>
							</a>								
						</div>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="box2">
			<h1>TICKET COMING SOON</h1>
			<div class="empty"></div>
			<table>
				<tr>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/christmas0017.PNG'/>">
								<div class="textcoming">
									<span>
										2024.11.14(목) 18:00 OPEN<br>								
									</span>
								</div>
							</a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/dualipa0018.PNG'/>">
								<div class="textcoming">
									<span>
										2024.11.16(토) 17:00 OPEN<br>								
									</span>
								</div>
							</a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/god0019.PNG'/>">
								<div class="textcoming">
									<span>
										2024.11.17(일) 20:00 OPEN<br>								
									</span>
								</div>
							</a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/growth0020.PNG'/>">
								<div class="textcoming">
									<span>
										2024.11.22(금) 18:00 OPEN<br>								
									</span>
								</div>
							</a>
						</div>
					</td>
				</tr>
				
				<tr>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/laundry0021.PNG'/>">
								<div class="textcoming">
									<span>
										2024.11.30(토) 14:00 OPEN<br>								
									</span>
								</div>
							</a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/leemoonsae0022.PNG'/>">
								<div class="textcoming">
									<span>
										2024.12.07(토) 20:00 OPEN<br>								
									</span>
								</div>
							</a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/santa0023.PNG'/>">
								<div class="textcoming">
									<span>
										2024.12.21(토) 17:00 OPEN<br>								
									</span>
								</div>
							</a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/urban0024.PNG'/>">
								<div class="textcoming">
									<span>
										2024.12.23(월) 13:00 OPEN<br>								
									</span>
								</div>
							</a>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="empty2"></div>
	</div>
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	
	</body>
</html>
 		
