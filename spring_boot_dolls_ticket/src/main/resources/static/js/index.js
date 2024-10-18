/**
 * index.js
 */
$(document).ready(function() { 
 
    // Top 버튼 클릭시 페이지 상단으로 이동
   	$('#topBtn').click(function(){
    	$('html, body').animate({scrollTop : 0}, 800);
        return false;
    });
    
 });