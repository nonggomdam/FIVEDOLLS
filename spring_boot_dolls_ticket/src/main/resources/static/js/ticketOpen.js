/**
 * 티켓 오픈 타이머 기능
 */
 
 document.addEventListener('DOMContentLoaded', () => {
 	const ticketOpenBtn = document.getElementById('ticketOpenBtn');
 	
 	    // 이벤트 상태를 확인하는 함수
    function checkEventStatus() {
        fetch('/api/check-event')
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 응답에 문제가 있습니다.');
                }
                return response.json();
            })
            .then(data => {
                console.log('Received data:', data);
                if (data.isOpen) {
                    ticketOpenBtn.disabled = false;
                    ticketOpenBtn.textContent = '예매하기';
                    clearInterval(timer); // 타이머 중지
                } else {
                    // 남은 시간 계산
                    const targetDate = new Date(data.targetDate);
                    const now = new Date();
                    const remainingTime = targetDate - now;

                    if (remainingTime <= 30 * 60 * 1000 && remainingTime > 0) { // 남은시간이 30분 이하이면 남은시간 표시
        		   		const minutes = Math.floor((remainingTime / (1000 * 60)) % 60);
         				const seconds = Math.floor((remainingTime / 1000) % 60);

        			    ticketOpenBtn.textContent = `남은시간 ${minutes}분 ${seconds}초`;
                    } else {
                        ticketOpenBtn.disabled = false;
                        ticketOpenBtn.textContent = '예매하기';
                        clearInterval(timer); // 타이머 중지
                    }
                }
            })
            .catch(error => {
                console.error('이벤트 상태를 확인하는 중 오류 발생:', error);
                ticketOpenBtn.textContent = '이벤트 로딩 오류';
            });
    }

    // 초기 이벤트 상태 확인
    checkEventStatus();

    // 타이머 설정: 매초마다 이벤트 상태 확인
    const timer = setInterval(checkEventStatus, 1000);
    
 	// 예매 가능 시간 설정
    //const targetDate = new Date('2024-10-08T20:00:00');
    //const targetDateInput = document.getElementById('targetDate');
    //const targetDateString = targetDateInput.value; // 숨겨진 입력 필드 값 읽기
    //const targetDate = new Date(targetDateString); // 문자열을 Date 객체로 변환
    
    // 버튼 상태 업데이트 함수
    //function updateButtonState() {
    //    const now = new Date();
    //    const remainingTime = targetDate - now;
 	//	if (remainingTime <= 30 * 60 * 1000 && remainingTime > 0) { // 남은시간이 30분 이하이면 남은시간 표시
    //        const minutes = Math.floor((remainingTime / (1000 * 60)) % 60);
    //        const seconds = Math.floor((remainingTime / 1000) % 60);

    //        ticketOpenBtn.textContent = `남은시간 ${minutes}분 ${seconds}초`;
    //    } else if (remainingTime <= 0) {
            // 시간이 다 되면 버튼 활성화 및 텍스트 변경
    //        ticketOpenBtn.disabled = false;
    //        ticketOpenBtn.textContent = '예매하기';
    //        clearInterval(timer); // 타이머 중지
    //    } else {
            // 초기 메시지 표시 (예: "09/28 15:00 오픈")
    //        const options = {month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit'};
    //        const formattedDate = targetDate.toLocaleString('ko-KR', options).replace(',', '');
    //        ticketOpenBtn.textContent = `${formattedDate} 오픈`;
    //    }
//    }
        
    // 타이머 설정 (매초마다 버튼 상태 확인)
//    const timer = setInterval(updateButtonState, 1000);
//    updateButtonState(); // 초기 상태 확인

//------------------------------------------------------------------------------------------------------
	const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	const options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.5147044, 127.1275107), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	const map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 마커가 표시될 위치입니다 
	const markerPosition  = new kakao.maps.LatLng(37.5147044, 127.1275107); 
	
	// 마커를 생성합니다
	const marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
 });
 
 