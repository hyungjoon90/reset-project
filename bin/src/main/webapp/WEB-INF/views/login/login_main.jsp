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
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="https://apis.google.com/js/api:client.js"></script>
<title>Insert title here</title>
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
    	  xhr.open('POST', 'http://localhost:8080/reset/login/google');
    	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	  xhr.send('idtoken=' + id_token);
    	  xhr.onreadystatechange = function () {
    		  if(xhr.readyState === 4 && xhr.status === 200) {
    	        var myJson = JSON.parse(this.responseText);
    	        window.location.href = myJson.result;
    		  }
    		};
 		}, function(error) {
          alert(JSON.stringify(error, undefined, 2));
        });
  }
	// 그외 일반
  $(function(){
	startGoogleApp();
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

    String kakko_clientId = "f709273524fdad8902b81660b68a0735";//애플리케이션 클라이언트 아이디값";
	String kakko_redirectURI = "http://localhost:8080/reset/login/kakko";
    String kakko_apiURL = "https://kauth.kakao.com/oauth/authorize?response_type=code";
    kakko_apiURL += "&client_id=" + kakko_clientId;
    kakko_apiURL += "&redirect_uri=" + kakko_redirectURI;
    //kakko_apiURL += "&state=" + state;
%>
<body>
	<!--header-->
	<div class="header">
		<div class="wrap">
			<nav class="main_menu container">
				<div class="menu_img">
					<img src="imgs/header_logo.png">
				</div>
				<div class="menu_login">
					<form class="form-inline">
						<div class="form-group">
							<label class="sr-only" for="search">검색</label> <input type="text"
								class="form-control input_box" placeholder="검색">
						</div>
						<button type="submit" class="btn send_btn">
							<span class="main_font">검색</span>
						</button>
						<button type="submit" class="btn send_btn">
							<span class="main_font">로그인</span>
						</button>
						<button type="submit" class="btn send_btn">
							<span class="main_font">회원가입</span>
						</button>
					</form>
				</div>
				<div class="menu_bar">
					<ul class="nav">
						<li class="current"><a href="index.html">홈</a></li>
						<li><a href="about.html">랭킹</a></li>
						<li class="top-menu"><a href="javascript:{}">화플</a>
							<ul class="sub-menu">
								<li><a href="scaffolding.html">Scaffolding</a></li>
								<li><a href="typography.html">Typography</a></li>
								<li><a href="shortcodes.html">Shortcodes</a></li>
								<li><a href="tables.html">Tables</a></li>
							</ul></li>
						<li class="top-menu"><a href="javascript:{}">이벤트</a>
							<ul class="sub-menu">
								<li><a href="portfolio_2columns.html">2 Columns</a></li>
								<li><a href="portfolio_3columns.html">3 Columns</a></li>
								<li><a href="portfolio_4columns.html">4 Columns</a></li>
							</ul></li>
						<li class="top-menu"><a href="javascript:{}">리뷰</a>
							<ul class="sub-menu">
								<li><a href="blog.html">Blog with right sidebar</a></li>
								<li><a href="blog_post.html">Blog post</a></li>
							</ul></li>
						<li><a href="contacts.html">문의</a></li>
					</ul>
				</div>
			</nav>

		</div>
	</div>
	<!--//header-->

	<!-- main contents -->
	<div class="page_container">
		<!--  네이버 -->
		<a href="<%=naver_apiURL%>"><img height="50"
			src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
		<!-- REST API 카카오 -->
		<a href="<%=kakko_apiURL%>">카카오로그인</a>
		<!-- google sign- -->
		<button id="google">구글로그인</button>
		<a href = "normal" id="normal">이메일로 로그인</a>
		
	</div>
	<!-- //main contents -->

	<!--footer-->
	<div class="footer">
		<div class="wrap">
			<div class="container">
				<div class="row">
					<div class="footer_L">
						<div class="foot_logo">
							<a href="index.html"><img src="imgs/footer_logo.png" alt="" /></a>
						</div>
						<div class="copyright">&copy; 2020 Jessica White.
							Professional Fashion Photography. All Rights Reserved.</div>
					</div>
					<div class="footer_R">
						<div class="fright">
							<form action="#" method="post">
								<input class="inp_search" name="name" type="text"
									value="   Search the Site"
									onfocus="if (this.value == 'Search the Site') this.value = '';"
									onblur="if (this.value == '') this.value = 'Search the Site';" />
							</form>
						</div>
						<div class="footer_menu">
							<ul class="nav">
								<li><a href="index.html" class="current">홈</a></li>
								<li><a href="about.html">랭킹</a></li>
								<li><a href="scaffolding.html">화플</a></li>
								<li><a href="portfolio_2columns.html">이벤트</a></li>
								<li><a href="blog.html">리뷰</a></li>
								<li><a href="contacts.html">문의</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--//footer-->
</body>
</html>