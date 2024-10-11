/**
 * 비밀번호 변경 링크
 */
 
     $(document).ready(function() {
        $('#changePassword').on('click', function() {
            var userConfirmed = confirm("비밀번호를 변경하시겠습니까?");
            
            if (userConfirmed) {
                // 사용자가 "예"를 눌렀을 때 페이지 이동
                window.location.href = "/member/passwordCheck"; // 원하는 URL로 변경
            } else {
                // 사용자가 "아니오"를 눌렀을 때 별도의 동작을 하지 않음
                alert("비밀번호 변경이 취소되었습니다.");
            }
        });
    });