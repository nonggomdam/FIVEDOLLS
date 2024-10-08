<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<div id="wrapper">
		<div>
			<h1>RANKING</h1>
			<div class='bTab'>
				<div class="hashtag"><span class='active' data='#initialTable'>#콘서트</span></div>
				<div class="hashtag"><span data='#dynamicTable' >#뮤지컬</span></div>
			</div>
				
			<table id="initialTable">
				<tr>
					<td class="ranking">
						<div class="info">
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/superjunior0001.PNG'/>">
								<div class="textinfo">
									<span>슈퍼주니어<br>
										  <br>
										  2024.09.26~2024.09.27<br>
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
										  2024.09.26~2024.09.27<br>
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
										  2024.09.26~2024.09.27<br>
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
										  2024.09.26~2024.09.27<br>
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
										  2024.09.26~2024.09.27<br>
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
							<a href="<c:url value='#'/>"><img src="<c:url value='/image/jyp0006.PNG'/>">
								<div class="textinfo">
									<span>JYP<br>
										  <br>
										  2024.09.26~2024.09.27<br>
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
										  2024.09.26~2024.09.27<br>
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
										  2024.09.26~2024.09.27<br>
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
		
		<div id="dynamicTable" style="display:none;">
      		<table>
			<tr>
				<td class="ranking">
					<div class="info">
						<a href="<c:url value='#'/>"><img src="<c:url value='/image/aladdin0009.PNG'/>">
							<div class="textinfo">
								<span>뮤지컬 알라딘<br>
									  <br>
									  2024.09.26~2024.09.27<br>
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
						<a href="<c:url value='#'/>"><img src="<c:url value='/image/house0010.PNG'/>">
							<div class="textinfo">
								<span>쿠로이 저택엔 누가 살고 있을까?<br>
									  <br>	
									  2024.09.26~2024.09.27<br>
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
						<a href="<c:url value='#'/>"><img src="<c:url value='/image/gentleman0011.PNG'/>">
							<div class="textinfo">
								<span>젠틀맨'스 가이드<br>
								      <br>
									  2024.09.26~2024.09.27<br>
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
						<a href="<c:url value='#'/>"><img src="<c:url value='/image/eternity0012.PNG'/>">
							<div class="textinfo">
								<span>ETERNITY<br>
									  <br>
									  2024.09.26~2024.09.27<br>
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
						<a href="<c:url value='#'/>"><img src="<c:url value='/image/long0013.PNG'/>">
							<div class="textinfo">
								<span>긴긴밤<br>
									  <br>
									  2024.09.26~2024.09.27<br>
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
						<a href="<c:url value='#'/>"><img src="<c:url value='/image/swing0014.PNG'/>">
							<div class="textinfo">
								<span>스윙 데이즈_암호명 A<br>
									  <br>
									  2024.09.26~2024.09.27<br>
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
						<a href="<c:url value='#'/>"><img src="<c:url value='/image/town0015.PNG'/>">
							<div class="textinfo">
								<span>하데스타운<br>
									  <br>
									  2024.09.26~2024.09.27<br>
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
						<a href="<c:url value='#'/>"><img src="<c:url value='/image/boots0016.PNG'/>">
							<div class="textinfo">
								<span>Kinky Boots<br>
									  <br>
									  2024.09.26~2024.09.27<br>
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
		</div> <!--dynamicTable 끝  -->
		
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
										2024.10.01(화) 13:00 OPEN<br>								
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
										2024.10.02(수) 17:00 OPEN<br>								
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
										2024.10.03(목) 20:00 OPEN<br>								
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
										2024.10.04(금) 18:00 OPEN<br>								
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
										2024.10.05(토) 14:00 OPEN<br>								
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
										2024.10.06(일) 20:00 OPEN<br>								
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
										2024.12.01(일) 17:00 OPEN<br>								
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
										2024.12.02(월) 13:00 OPEN<br>								
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
 		
