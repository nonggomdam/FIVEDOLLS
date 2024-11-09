/**
 * 티켓 오픈 타이머 기능
 */
 
$(document).ready(function() {
    
 	const ticketOpenBtn = document.getElementById('ticketOpenBtn');
	const performanceId = document.getElementById('performanceId').value; 
    
 	// 이벤트 상태를 확인하는 함수
     function checkEventStatus() {
        fetch(`/api/check-event?performanceId=${performanceId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('네트워크 응답에 문제가 있습니다.');
                } 
                return response.json();
            })
            .then(data => {
           		data.targetDate = new Date(data.targetDate);
                console.log('Received data:', data);
                if (data.isOpen) {
                    ticketOpenBtn.disabled = false;
                    ticketOpenBtn.textContent = '예매하기';
                    clearInterval(timer); // 타이머 중지
                    
                    $(document).ready(function() {
				        $('#ticketOpenBtn').on('click', function() {
				            var userConfirmed = confirm(" 좌석예약 페이지로 이동하시겠습니까?");
				            
				            if (userConfirmed) {
				                // 사용자가 "예"를 눌렀을 때 페이지 이동
				                window.location.href = '/performance/dateReservation/${performance.performanceId}'; // 원하는 URL로 변경
				            } else {
				                // 사용자가 "아니오"를 눌렀을 때 별도의 동작을 하지 않음
				                alert("정보를 다시 확인해주세요");
				            }
				        });
				    });
                    
                } else {
                    // 남은 시간 계산
                    const targetDate = new Date(data.targetDate);
                    const now = new Date();
                    console.log(targetDate);
                    console.log(now);
                    const remainingTime = targetDate - now;

                    if (remainingTime <= 30 * 60 * 1000 && remainingTime > 0) { // 남은시간이 30분 이하이면 남은시간 표시
        		   		const minutes = Math.floor((remainingTime / (1000 * 60)) % 60);
         				const seconds = Math.floor((remainingTime / 1000) % 60);
        			    ticketOpenBtn.textContent = `남은시간 ${minutes}분 ${seconds}초`;
                    } else if(remainingTime > 30 * 60 * 1000){
                    	const options = {month: '2-digit', day: '2-digit', hour: 'numeric', minute: '2-digit'};
			            const formattedDate = targetDate.toLocaleString('ko-KR', options).replace(',', '');
			            ticketOpenBtn.textContent = `${formattedDate} 오픈`;
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

 });
 
 