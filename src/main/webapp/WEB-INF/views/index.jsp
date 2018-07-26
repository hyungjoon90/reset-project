<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	<title>Home</title>
	<script type="text/javascript">
	  $(function(){
		rankingLlist();
		cartList();
      });
	  function rankingLlist(){
		  $.ajax({
				type: 'get',
				url:'/reset/ranking/ajax?id=1',
				dataType:'text',
				success:function(result){
					$("#rankingList1").html(result);
				}
			});
    	$.ajax({
				type: 'get',
				url:'/reset/ranking/ajax?id=2',
				dataType:'text',
				success:function(result){
					$("#rankingList2").html(result);
				}
			});
    	$.ajax({
				type: 'get',
				url:'/reset/ranking/ajax?id=3',
				dataType:'text',
				success:function(result){
					$("#rankingList3").html(result);
				}
			});
	  }
	  function cartList(){
		  	var email="cus1@naver.com";
			var Data= {"email":email};
			$.ajax({
			        type: 'POST', // get 방식으로 요청
					dataType: 'text',
					url: "item/cart", // 데이터를 불러오는 json-server 주소입니다 .
					data: Data,
					success:function(result){
						$("#cart").html(result);
					}
			})
			.fail(function () { // 실패했을때 불러질 함수
				console.error('데이터 불러오기 실패');
			})
		} 
	
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/template/menu.jsp"></jsp:include>
    
    <!-- main contents -->
    <div class="page_container">
    	<h1>스킨</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
    	<div id="rankingList1"></div>
    	<h1>로션</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
   		<div id="rankingList2"></div>
    	<h1>에센스</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
    	<div id="rankingList3"></div>
		<h1>찜목록</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
		<div id="cart"></div>
       
    </div>
    <!-- //main contents -->
    
    
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>
