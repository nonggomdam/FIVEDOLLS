/**
 * 티켓 오픈 타이머 기능
 */
 
 document.addEventListener('DOMContentLoaded', () => {
 	const ticketOpenBtn = document.getElementById('ticketOpenBtn');
 	
 	// 예매 가능 시간 설정
    const targetDate = new Date('2024-10-30T11:00:00');
    
    // 버튼 상태 업데이트 함수
    function updateButtonState() {
        const now = new Date();
        const remainingTime = targetDate - now;
 		if (remainingTime <= 30 * 60 * 1000 && remainingTime > 0) { // 남은시간이 30분 이하이면 남은시간 표시
            const minutes = Math.floor((remainingTime / (1000 * 60)) % 60);
            const seconds = Math.floor((remainingTime / 1000) % 60);

            ticketOpenBtn.textContent = `남은시간 ${minutes}분 ${seconds}초`;
        } else if (remainingTime <= 0) {
            // 시간이 다 되면 버튼 활성화 및 텍스트 변경
            ticketOpenBtn.disabled = false;
            ticketOpenBtn.textContent = '예매하기';
            clearInterval(timer); // 타이머 중지
        }
    }
        
    // 타이머 설정 (매초마다 버튼 상태 확인)
    const timer = setInterval(updateButtonState, 1000);
    updateButtonState(); // 초기 상태 확인
    
 });
 
 