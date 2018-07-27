<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/template/head.jsp" %>
<meta name="google-signin-client_id"
	content="1051220480905-p8890ral8a45q8c1q6201a57oqg75k7f.apps.googleusercontent.com">
<script src="https://apis.google.com/js/api:client.js"></script>
<title>Insert title here</title>
<script>
	$(function(){
		$("button[bt='on']").on("click",function(){
			console.log($(this).attr("id"));
			$.post(".","command="+$(this).attr("id"))
				.done(function(data){
					if(data.result==200){
						alert("성공적으로 연동되었습니다.")
					}
					window.location.href=data.redirect;
				});// post End
		})// button click end
	}); // function() end

</script>
</head>
<body>
	<!--header-->
	<%@ include file="/WEB-INF/views/template/menu.jsp" %>
	<!--//header-->

	<!-- main contents -->
	<div class="page_container">
		<div>
			
			<h2>기존에 [${join_route}] 로 연동하셨습니다. </h2>
			<h2>혹시 [${login_route}]도 연동하시겠습니까?</h2>
			<button bt="on" id="adds_yes">예</button>
			<button bt="on" id="adds_no">로그인다시하기</button>
			<button bt="on" id="adds_back">이전경로로 가기</button>
		</div>
		
	</div>
	<!-- //main contents -->

	<!--footer-->
		<%@ include file="/WEB-INF/views/template/footer.jsp" %>
	<!--//footer-->
</body>
</html>