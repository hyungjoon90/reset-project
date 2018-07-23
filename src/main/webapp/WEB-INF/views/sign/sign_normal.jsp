<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${goRoot}js/jquery-1.12.4.js"></script>
<script src="${goRoot}js/bootstrap.min.js"></script>
<link href="${goRoot}css/bootstrap.min.css" rel="stylesheet">
<link href="${goRoot}css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${goRoot}css/main.css" rel="stylesheet">
<script src="${goRoot}js/ser.js"></script>
<script src="${goRoot}js/sign.js"></script>
<title>Normol LoginView</title>
<script type="text/javascript">
	$(function() {
		addFormEvent();

		$("#form").submit(function(e) {
			e.preventDefault();
			var result = submitCheck();
			if (result) {
				if ($("#password").legnth > 0) {
					var pw = $("#password").val();
					$("#password").val(SHA256(pw));
				}
				var data = $('#form').serialize();
				console.log(data);
				$.post(".", data, function(output) {
					if (output.result == 200) {
						window.location.href = ouput.url;
					} else {
						alert("알수 없는 이유로 회원가입이 실패하였습니다. 잠시후 다시 이용해주세요");
					}
				});// end $.post
			}// end if
		});// end submit event
	});
</script>
<style>
/* label 글씨속성  */
.page_container label{
font-weight: bold;
font-size : 15px;
} 

/* 붉은색 테두리 
 .row-setting {
	background: white;
	border-radius: 3px;
	border: 1px solid #dd2d25;
	padding: 50px 50px 50px -100px;
} */

/* 회원가입 */
.entry-title {
	margin-bottom: 30px;
	font-weight: 800;
	font-size: 30px;
	color: #D00B01;
	margin-left: auto;
    margin-right: auto;
} 

/* 회원가입 아래 바 */
.entry-title:after {
    content: " ";
    width: 100px;
    height: 5px;
    background: #D00B01;
    display: block;
    margin-top: 20px;
    border-radius: 3px;

}

/* input style */
.page_container .form-control{
border-radius: 0px;
background-color: #D1D1D1;
opacity: 0.6; 
height: 50px;
}

/* input placeholder색 옅게 */
.form-control::placeholder {
    color: black;
   opacity: 0.5; 
}
 
/* 입력수정버튼 위치조정 */ 
 .btn-group{
margin-top: 30px;}

/* 입력버튼 css */
.redbtn {
	background-color: #d00b01;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: 1px solid #D00B01;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 11px 23px;
	text-decoration: none;
}
/* 입력버튼 css */
.redbtn:active {
	position: relative;
	top: 1px;
}


/* 취소버튼 css */
.blackbtn {
	background-color: #313131;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: 1px solid #313131;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 11px 23px;
	text-decoration: none;
}
/* 취소버튼 css */
.blackbtn:active {
	position: relative;
	top: 1px;
}





</style>
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="wrap">
			<nav class="main_menu container">
				<div class="menu_img">
					<img src="${goRoot}imgs/header_logo.png">
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
						<a href="${goRoot}login/" class="btn send_btn"><span
							class="main_font">로그인</span></a> <a href="${goRoot}sign/"
							class="btn send_btn"><span class="main_font">회원가입</span></a>
					</form>
				</div>
				<div class="menu_bar">
					<ul class="nav">
						<li class="current"><a href="index.html">홈</a></li>
						<li><a href="${goRoot}about.html">랭킹</a></li>
						<li class="top-menu"><a href="javascript:{}">화플</a>
							<ul class="sub-menu">
								<li><a href="${goRoot}scaffolding.html">Scaffolding</a></li>
								<li><a href="${goRoot}typography.html">Typography</a></li>
								<li><a href="${goRoot}shortcodes.html">Shortcodes</a></li>
								<li><a href="${goRoot}tables.html">Tables</a></li>
							</ul></li>
						<li class="top-menu"><a href="javascript:{}">이벤트</a>
							<ul class="sub-menu">
								<li><a href="${goRoot}portfolio_2columns.html">2
										Columns</a></li>
								<li><a href="${goRoot}portfolio_3columns.html">3
										Columns</a></li>
								<li><a href="${goRoot}portfolio_4columns.html">4
										Columns</a></li>
							</ul></li>
						<li class="top-menu"><a href="javascript:{}">리뷰</a>
							<ul class="sub-menu">
								<li><a href="${goRoot}blog.html">Blog with right
										sidebar</a></li>
								<li><a href="${goRoot}blog_post.html">Blog post</a></li>
							</ul></li>
						<li><a href="${goRoot}contacts.html">문의</a></li>
					</ul>
				</div>
			</nav>

		</div>
	</div>
	<!--//header-->

	<!-- main contents -->
	<div class="page_container">

		<div class="row row-setting">
			<h1 class="entry-title">회원가입</h1>
<br><br>
			<form action="./" method="post" class="form-horizontal" id="form">
				<div class="form-group">
					<div class="col-md-2">
						<label for="email">이메일</label>
					</div>
					<div class="col-md-6">
						<input type="email" name="email" id="email" class="form-control"
							value="${login_email }" placeholder="이메일 입력" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label for="nick">닉네임</label>
					</div>
					<div class="col-sm-6">
						<input type="text" name="nick" id="nick" class="form-control"
							value="" placeholder="닉네임 입력" />
					</div>
				</div>
				<c:if test="${login_route eq 'normal' }">
					<div class="form-group">
						<div class="col-sm-2">
							<label for="password">password</label>
						</div>
						<div class="col-sm-6">
							<input type="password" name="password" id="password"
								 class="form-control" placeholder="영소대문자,숫자 포함. 10자이상" />
						</div>
					</div>
					<div class="form-group">
					<div class="col-sm-2">
						<label for="pwchk">password 확인</label> 
						</div>
						<div class="col-sm-6">
						<input type="password"
							id="pwchk" class="form-control" />
							</div>
					</div>
				</c:if>
				<div class="form-group">
					<div class="col-sm-2">
						<label for="phone">연락처</label>
					</div>
					<div class="col-sm-6">
						<input type="text" name="phone" id="phone" class="form-control"
							placeholder="-를 제외한 숫자만 입력" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2">
						<label for="gender">성별</label>
					</div>
					<div class="col-sm-6" class="label-padding">
						<input type="radio" name="gender" id="gender_1"
							class="label-padding checkmark" value="남성" checked /><label for="gender_1"
							class="label-padding checkmark">남성</label><br> <input type="radio"
							name="gender" id="gender_2" value="여성" /><label for="gender_2"
							class="label-padding">여성</label><br>

					</div>
				</div>
				<div class="form-group">
				<div class="col-sm-2">
					<label for="age">age</label>
					</div>
					<div class="col-sm-6">
						<input type="number" name="age" id="age" class="form-control" min="1"
							value="30" />
					</div>
				</div>
				<div class="form-group">
<div class="col-sm-2">
					<label class="">피부타입</label>
					</div>
					<div class="col-sm-9">
						<input type="radio" name="skin" id="skin_1" value="지성" checked /><label
							for="skin_1">지성</label><br>
						<input type="radio" name="skin" id="skin_2" value="건성" /><label
							for="skin_2">건성</label><br>
						<input type="radio" name="skin" id="skin_3" value="민감성" /><label
							for="skin_3">민감성</label>
					</div>

					<br>
				</div>
				<input type="hidden" name="join_route" value="${login_route}" /> <input
					type="hidden" name="user_type" value="일반" /> <input type="hidden"
					name="cart" value=";" /> <input type="hidden" name="exp" value="0" />
				<div class="col-sm-8">
				<div role="group" class="btn-group pull-right">
					<button type="submit" class="btn redbtn">입력</button>
					<button type="reset" class="btn blackbtn">취소</button>
				</div>
				</div>
			</form>

		</div>
		<!-- row end  -->
	</div>
	<!-- page container -->
<br><br><br><br>
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
