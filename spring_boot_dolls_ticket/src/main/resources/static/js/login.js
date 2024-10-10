/**
 *  비동기 통신 (ajax) 활용한 login submit
 */
 
 $(document).ready(function() {
    $('#loginForm').on('submit', function(event) {
        event.preventDefault(); // 기본 submit 기능 중단
        const data = {
            id: $('#signupId').val(),
            pwd: $('#signupPwd').val()
        };

        $.ajax({
            type: "POST",
            url: "/member/login",
            data: data,
            success: function(response) {
                if (response === 'success') {
                    // 성공적인 로그인 처리
                    alert("로그인 성공!");
                    window.location.href = "/"; // 로그인 성공시 메인페이지로
                } else {
                    // 로그인 실패 처리
                    alert("로그인 실패!");
                }
            },
            error: function(xhr, status, error) {
                console.error("Login error: ", error);
                // 오류 처리
                alert("로그인 중 오류 발생!"); // 오류 처리
            }
        });
    }); // on 끝
}); // ready 끝