<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<div id="wrapper">
		<article  id="slideShow"> <!-- 슬라이드 쇼 -->   	
	        <!-- 이전/다음 버튼 -->
			<div id="prevNextButtonBox">
				<img id="prevButton" src="image/prevButton.png">
				<img id="nextButton" src="image/nextButton.png">
			</div>	
			<div id="slideShowBox">
				<div id="slidePanel">
					<a href="<c:url value='/performance/detailViewPerformance/P0004'/>">
					<img src= "<c:url value='/image/banner1.png'/>" class="slideImage"></a>
					<a href="<c:url value='/performance/detailViewPerformance/P0013'/>">
					<img src= "<c:url value='/image/banner2.jfif'/>" class="slideImage"></a>
					<a href="<c:url value='/performance/detailViewPerformance/P0001'/>">
					<img src= "<c:url value='/image/banner3.jfif'/>" class="slideImage"></a>
					<a href="<c:url value='/performance/detailViewPerformance/P0010'/>">
					<img src= "<c:url value='/image/banner4.jfif'/>" class="slideImage"></a>
					<a href="<c:url value='/performance/detailViewPerformance/P0015'/>">
					<img src= "<c:url value='/image/banner5.png'/>" class="slideImage"></a>
				</div>
			</div> <!-- slideShowBox 끝 -->  
			<div id = "controlPanel">
				<img src="image/controlButton1.png" class="controlButton">
				<img src="image/controlButton1.png" class="controlButton">
				<img src="image/controlButton1.png" class="controlButton">
				<img src="image/controlButton1.png" class="controlButton">
				<img src="image/controlButton1.png" class="controlButton">
			</div>	
	    </article>
			<h1>RANKING</h1>
			<div class='bTab'>
				<div class="hashtag"><span class='active' data='#initialTable'>#콘서트</span></div>
				<div class="hashtag"><span data='#dynamicTable' >#뮤지컬</span></div>
			</div>
				
			<table id="initialTable">
            <tr>
                <c:forEach var="performance" items="${performances}">
                    <td class="ranking">
                        <div class="info">
                            <a href="<c:url value='/performance/detailViewPerformance/${performance.performanceId}'/>" data-id="${performance.performanceId}">
                                <img src="<c:url value='${performance.performanceImagePath}'/>">
                                <div class="textinfo">
                                    <span>
                                        ${performance.performanceName}<br>
                                        <br>
                                        ${performance.performanceDate1}<br>
                                        ${performance.performanceAddress}<br>
                                        <br>
                                        관람연령 ${performance.performanceRatingCode}세이상<br>
                                    </span>
                                </div>
                            </a>						
                        </div>
                    </td>
                </c:forEach>
            </tr>
        </table>
		</div>
		
		<div id="dynamicTable" style="display:none;">
      		<table>
			<tr>
				<td class="ranking">
					<div class="info">
						<a href="<c:url value='/performance/detailViewPerformance/P0009'/>"><img src="<c:url value='/image/P0009.PNG'/>">
							<div class="textinfo">
								<span>뮤지컬 [알라딘] 한국 초연 (ALADDIN The Musical)<br>
									  <br>
									  2024.12.24<br>~2024.12.25<br><br>
									  샤롯데씨어터<br>
								</span>	  
							</div>
						</a>	
					</div>
				</td>
				<td class="ranking">
					<div class="info">				
						<a href="<c:url value='/performance/detailViewPerformance/P0014'/>"><img src="<c:url value='/image/P0014.PNG'/>">
							<div class="textinfo">
								<span>뮤지컬 [ 쿠로이 저택엔 누가 살고 있을까? ]<br>
									  <br>	
									  2024.12.13<br>~2024.12.14<br><br>
									  샤롯데씨어터<br>
								</span>
							</div>
						</a>	
					</div>	
				</td>
				<td class="ranking">
					<div class="info">
						<a href="<c:url value='/performance/detailViewPerformance/P0011'/>"><img src="<c:url value='/image/P0011.PNG'/>">
							<div class="textinfo">
								<span>뮤지컬 〈젠틀맨스 가이드：사랑과 살인편〉<br>
									  <br>
									  2024.11.20<br>~2024.11.21<br><br>
									  샤롯데씨어터<br>
								</span>	  
							</div>
						</a>	
					</div>
				</td>
				<td class="ranking">
					<div class="info">
						<a href="<c:url value='/performance/detailViewPerformance/P0012'/>"><img src="<c:url value='/image/P0012.PNG'/>">
							<div class="textinfo">
								<span>뮤지컬 〈이터니티〉<br>
									  <br>
									  2024.12.07<br>~2024.12.08<br><br>
									  샤롯데씨어터<br>
							 	</span>
							</div>	 	
						</a>	
					</div>
				</td>
			</tr>
			
			<tr>
				<td class="ranking">
					<div class="info">
						<a href="<c:url value='/performance/detailViewPerformance/P0013'/>"><img src="<c:url value='/image/P0013.jpg'/>">
							<div class="textinfo">
								<span>2024 뮤지컬 [지저스 크라이스트 수퍼스타]<br>
									  <br>
									  2024.11.07<br>~2024.11.08<br><br>
									  샤롯데씨어터<br>
							 	</span>
							</div>	 	
						</a>	
					</div>
				</td>
				<td class="ranking">
					<div class="info">
						<a href="<c:url value='/performance/detailViewPerformance/P0010'/>"><img src="<c:url value='/image/P0010.jpg'/>">
							<div class="textinfo">
								<span>뮤지컬 [빈센트 반 고흐]<br>
									  <br>
									  2024.11.10<br>~2024.11.11<br><br>
									  샤롯데씨어터<br>
								</span>	  
							</div>
						</a>	
					</div>
				</td>
				<td class="ranking">
					<div class="info">
						<a href="<c:url value='/performance/detailViewPerformance/P0016'/>"><img src="<c:url value='/image/P0016.jpg'/>">
							<div class="textinfo">
								<span>뮤지컬 [드라이 플라워]<br>
									  <br>
									  2024.12.20<br>~2024.12.21<br><br>
									  샤롯데씨어터<br>
								</span>	  
							</div>
						</a>	
					</div>					
				</td>
				<td class="ranking">
					<div class="info">
						<a href="<c:url value='/performance/detailViewPerformance/P0015'/>"><img src="<c:url value='/image/P0015.jpg'/>">
							<div class="textinfo">
								<span>뮤지컬 [시지프스]<br>
									  <br>
									  2024.12.10<br>~2024.12.11<br><br>
									  샤롯데씨어터<br>
								</span>	  
							</div>
						</a>	
					</div>
				</td>
			</tr>
			</table>	
		</div> <!--dynamicTable 끝  -->
		<div class="banner">
			<a href="<c:url value='/performance/detailViewPerformance/P0017'/>"><img src="<c:url value='/image/long_banner.png'/>"></a>
		</div>
		<div id="box2">
			<h1>TICKET COMING SOON</h1>
			<div class="empty"></div>
			<table>
				<tr>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='/performance/detailViewPerformance/P0006'/>"><img src="<c:url value='/image/P0006.jpg'/>">
								<div class="donut-dday">D-16</div>
								<div class="info-txt">
									<p class="info-txt1">2024 이찬원 콘서트 ‘ 찬가（燦歌）’</p>
									<p class="info-txt2">2024.11.02 14:00</p>
								</div></a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='/performance/detailViewPerformance/P0008'/>"><img src="<c:url value='/image/P0008.PNG'/>">
								<div class="donut-dday">D-26</div>
								<div class="info-txt">
									<p class="info-txt1">박진영 30주년 콘서트〈Still JYP〉</p>
									<p class="info-txt2">2024.11.12 14:00</p>
								</div></a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='/performance/detailViewPerformance/P0009'/>"><img src="<c:url value='/image/P0009.PNG'/>">
								<div class="donut-dday">D-26</div>
								<div class="info-txt">
									<p class="info-txt1">뮤지컬 [알라딘] 한국 초연 (ALADDIN The Musical)</p>
									<p class="info-txt2">2024.11.12 14:00</p>
								</div></a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='/performance/detailViewPerformance/P0017'/>"><img src="<c:url value='/image/P0017.jpg'/>">
								<div class="donut-dday">D-28</div>
								<div class="info-txt">
									<p class="info-txt1">2024 이무진 전국투어 콘서트 [별책부록]</p>
									<p class="info-txt2">2024.11.14 14:00</p>
								</div></a>
						</div>
					</td>
				</tr>
				
				<tr>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='/performance/detailViewPerformance/P0012'/>"><img src="<c:url value='/image/P0012.PNG'/>">
								<div class="donut-dday">D-28</div>
								<div class="info-txt">
									<p class="info-txt1">뮤지컬 〈이터니티〉</p>
									<p class="info-txt2">2024.11.14 14:00</p>
								</div></a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='/performance/detailViewPerformance/P0013'/>"><img src="<c:url value='/image/P0013.jpg'/>">
								<div class="donut-dday">D-28</div>
								<div class="info-txt">
									<p class="info-txt1">2024 뮤지컬 [지저스 크라이스트 수퍼스타]</p>
									<p class="info-txt2">2024.11.14 14:00</p>
								</div></a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='/performance/detailViewPerformance/P0014'/>"><img src="<c:url value='/image/P0014.PNG'/>">
								<div class="donut-dday">D-28</div>
								<div class="info-txt">
									<p class="info-txt1">뮤지컬 [쿠로이 저택엔 누가 살고 있을까?]</p>
									<p class="info-txt2">2024.11.14 14:00</p>
								</div></a>
						</div>
					</td>
					<td class="ranking">
						<div class="infocoming">
							<a href="<c:url value='/performance/detailViewPerformance/P0001'/>"><img src="<c:url value='/image/P0001.jpg'/>">
								<div class="donut-dday">D-28</div>
								<div class="info-txt">
									<p class="info-txt1">나훈아 ‘2024 고마웠습니다-라스트 콘서트(LAST CONCERT)’</p>
									<p class="info-txt2">2024.11.14 14:00</p>
								</div></a>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="empty2"></div>
		
 		