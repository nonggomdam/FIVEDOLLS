/**
 * 공연 상세 정보 페이지 이동
 */
$(document).ready(function() {
	$(".performanceRow").on("click", function() {
		var performanceId = $(this).attr("id");
		
		console.log(performanceId);
		window.location.href = "/admin/performanceDetailView/" + performanceId;
	});
});