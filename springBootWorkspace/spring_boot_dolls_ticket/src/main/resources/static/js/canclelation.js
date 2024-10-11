/**
 * 회원정보 취소시 화면전환
 */
 
     $(document).ready(function() {
        $('#cancellation').on('click', function() {
            var userConfirmed = confirm("변경을 취소하시겠습니까?");
            
            if (userConfirmed) { 
                // 사용자가 "예"를 눌렀을 때 페이지 이동
                window.location.href = "/member/myPage"; // 원하는 URL로 변경
            } else {
            	alert("정보를 입력해주세요.");
            }
        });
    });