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
<!-- TODO 경로 넣어줘야됨 -->
<link href="${goRoot }css/bootstrap.min.css" rel="stylesheet">
<link href="${goRoot }css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${goRoot }css/main.css" rel="stylesheet">
<script src="${goRoot }js/jquery-1.12.4.js"></script>
<script src="${goRoot }js/bootstrap.min.js"></script>
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