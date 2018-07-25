<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/template/head.jsp"%>
	<title>Home</title>
	<script type="text/javascript">
	  $(function(){
		cartList();
      });
	 
	  function cartList(){
		  	var email="cus1@naver.com";
			var Data= {"email":email};
			$.ajax({
			        type: 'POST', // get 방식으로 요청
					dataType: 'text',
					url: "${goRoot}item/cart", // 데이터를 불러오는 json-server 주소입니다 .
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
<%@include file="/WEB-INF/views/template/menu.jsp"%>
    
    <!-- main contents -->
    <div class="page_container">
    	
    	<h1>회원정보</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
		<div id="info">${alist }</div>
    	<script type="text/javascript">
    	var a = ${alist};
    	console.log(a);
    	</script>
		<h1>찜목록</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
		<div id="cart"></div>
       
       	<h1>리뷰</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
		<div id="review"></div>
       	
       	<h1>댓글</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
		<div id="comment"></div>
    </div>
    <!-- //main contents -->
    
    
<%@include file="/WEB-INF/views/template/footer.jsp"%>
</body>
</html>
