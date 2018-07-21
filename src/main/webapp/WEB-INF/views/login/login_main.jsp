<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="google-signin-client_id"
	content="1051220480905-p8890ral8a45q8c1q6201a57oqg75k7f.apps.googleusercontent.com">
<link href="${goRoot}css/bootstrap.min.css" rel="stylesheet">
<link href="${goRoot}css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${goRoot}css/main.css" rel="stylesheet">
<link href="${goRoot }css/login.css" rel="stylesheet" >
<link href="${goRoot }js/jquery.bxslider.css" rel="stylesheet" >
<script src="${goRoot}js/jquery-1.12.4.js"></script>
<script src="${goRoot}js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript" src="${goRoot }js/jquery.bxslider.js"></script>
<title>Insert title here</title>

<!-- Latest compiled and minified JavaScript -->
<script>
	// 전부 login.js 로 넣을거임
	// 구글용
  var googleUser = {};
  var startGoogleApp = function() {
    gapi.load('auth2', function(){
      // Retrieve the singleton for the GoogleAuth library and set up the client.
      auth2 = gapi.auth2.init({
        client_id: '1051220480905-p8890ral8a45q8c1q6201a57oqg75k7f.apps.googleusercontent.com',
        cookiepolicy: 'single_host_origin',
        scope: 'profile email'
      });
      attachSignin(document.getElementById('google'));
    });
  };
	// 구글용
  function attachSignin(element) {
    auth2.attachClickHandler(element, {},
        function(googleUser) {
    	  var id_token = googleUser.getAuthResponse().id_token;
		  var xhr = new XMLHttpRequest();
    	  xhr.open('POST', 'http://localhost:8080/reset/login/google/');
    	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	  xhr.send('idtoken=' + id_token);
    	  xhr.onreadystatechange = function () {
    		  if(xhr.readyState === 4 && xhr.status === 200) {
    	        var myJson = JSON.parse(this.responseText);
    	        // 200 성공, 201 회원가입, 300 연동
    	        if(myJson.result==200)alert("로그인성공");
    	        else if(myJson.result==201)alert("회원가입으로 이동");
    	        window.location.href = myJson.redirect;
    		  }
    		};
 		}, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
  }
	// 그외 일반
  $(function(){
	startGoogleApp();
	$('.slider').bxSlider();
  })
  </script>
</head>
<%
  	SecureRandom random = new SecureRandom();
  	String state = new BigInteger(130, random).toString();
  
  	String naver_clientId = "tfJeSZAfwMMgSJ0l4M9h";//애플리케이션 클라이언트 아이디값";
    String naver_redirectURI = URLEncoder.encode("http://localhost:8080/reset/login/naver/", "UTF-8");
    String naver_apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"; 
    naver_apiURL += "&client_id=" + naver_clientId;
    naver_apiURL += "&redirect_uri=" + naver_redirectURI;
    naver_apiURL += "&state=" + state;
    session.setAttribute("state", state);

    String kakao_clientId = "f709273524fdad8902b81660b68a0735";//애플리케이션 클라이언트 아이디값";
	String kakao_redirectURI = "http://localhost:8081/reset/login/kakao/"; // TODO 나중에 바꿀거
    String kakao_apiURL = "https://kauth.kakao.com/oauth/authorize?response_type=code";
    kakao_apiURL += "&client_id=" + kakao_clientId;
    kakao_apiURL += "&redirect_uri=" + kakao_redirectURI;
    //kakao_apiURL += "&state=" + state;
%>
<body>
<!------ Include the above in your HEAD tag ---------->

<section class="login-block">
	<div class="container">
		<div class="row">
		<div class="col-md-4 login-sec">
		    <h2 class="text-center">Login Now</h2>
		    <form class="login-form">
		    
				<div class="form-group">
				  <label for="exampleInputEmail1" class="text-uppercase">Username</label>
				  <input type="text" class="form-control" placeholder="">
				</div>
				
				<div class="form-group">
				  <label for="exampleInputPassword1" class="text-uppercase">Password</label>
				  <input type="password" class="form-control" placeholder="">
				</div>
    			<div class="loginBtn">
    				<span class="loginA">
	    				<a href=""><strong class="loginB">비밀번호 찾기</strong></a>
	    				&nbsp;
	    				<a href=""><strong class="loginB">회원가입</strong></a>
    				</span>
					<a href="./normal/" id="normal" class="btn btn-login float-right">로그인</a>
    			</div>
    			
    			<hr class="line"/>
    			<div class="webBtn">
    				<a href="<%=kakao_apiURL%>"><img alt="" src="${goRoot }imgs/login_imgs/kakao.png" class="webicon"></a>
    				<a href="<%=naver_apiURL%>"><img alt="" src="${goRoot }imgs/login_imgs/naver.png" class="webicon"></a>
    				<button id="google"><img alt="" src="${goRoot }imgs/login_imgs/google.png" class="webicon"></button>
    			</div>
    			
			</form>
		</div><!-- <div class="col-md-4 login-sec"> end -->
		<div class="col-md-8 banner-sec">
           <div class="slider">
  			<div><img alt="" src="${goRoot }imgs/login_imgs/1.jpg"> </div>
 			 <div><img alt="" src="${goRoot }imgs/login_imgs/2.jpg"></div>
</div>
	</div><!-- banner-sec end -->
</div>
</div><!-- container end -->
</section>
	<!-- footer 들어가야됨 -->
</body>
</html>