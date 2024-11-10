/**
 * 
 */
 $(document).ready(function() {
 	
 	const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

	const address = document.getElementById('performanceLocationId').value;

	let mapCenter;
	
	if (address === "SE0000001") {
	    mapCenter = new kakao.maps.LatLng(37.5147044, 127.1275107); // 올림픽공원 올림픽홀 좌표
	} else if (address === "SE0000002") {
	    mapCenter = new kakao.maps.LatLng(37.5107077, 127.0998494); // 샤롯데씨어터 좌표
	} else {
	    mapCenter = new kakao.maps.LatLng(37.5147044, 127.1275107); // 기본 좌표 (원하는 기본 좌표로 설정)
	}
	
	const options = { // 지도를 생성할 때 필요한 기본 옵션
	    center: mapCenter, // 지도의 중심좌표를 조건에 따라 설정
	    level: 3 // 지도의 레벨(확대, 축소 정도)
	};
	
	const map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴
	
	// 마커가 표시될 위치를 지도의 중심좌표로 설정
	const markerPosition = mapCenter;
	
	// 마커를 생성합니다
	const marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
});