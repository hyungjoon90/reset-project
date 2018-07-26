<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/template/admin_header.jsp"%>
<link href="${goRoot }css/login/sign_css.css" rel="stylesheet">
<link href="${goRoot }css/btn/btn.css" rel="stylesheet">
<script src="${goRoot}js/ser.js"></script>
<script src="${goRoot}js/sign.js"></script>
<script>
	function addFormEve() {
		//
		$("#form input").each(function() {
			$(this).on("focus", function() {
				$(this).val('');
				$(this).css("color", "black");
				$(this).parent().parent().find(".errM").remove();
			});
		});

		$("#email").on("blur", function(e) {
			checkEmail(e.target)
		});
		if ($("#password").length > 0) {
			$("#password").on("blur", function(e) {
				checkPW(e.target)
			});
			$("#pwchk").on("blur", function(e) {
				checkRePW(e.target)
			});
		}
		$("#phone").on("blur", function(e) {
			checkPhone(e.target)
		});
		$("#phone").on("keydown", function(e) {
			onlyNumber(e)
		});
		$("#phone").on("keyup", function(e) {
			onlyNumber(e)
		});
		//$("#bisnum").on("blur",function(e){checkBisNum(e)}); 이거했다가 재앙임
		$("#bisnum").on("keydown", function(e) {
			onlyNumber(e)
		});
		$("#bisnum").on("keyup", function(e) {
			onlyNumber(e)
		});

	}// addFormEvent();
	// 문서 온로드 시점
	$(function() {
		addFormEve();

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
				// TODO :[KSS] 경로 수정해야됨
				$.post("/reset/", data, function(output) {
					if (output.result == 200) {
						alert("회원등록 완료");
						window.location.href = "${goRoot}admin/";
					} else {
						alert("알수 없는 이유로 회원등록이 실패하였습니다. 잠시후 다시 이용해주세요");
					}
				});// end $.post
			}// end if
		});// end submit event
	});
</script>
<style>
<
style> /* label 글씨속성  */ .page_container label {
	font-weight: bold;
	font-size: 15px;
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
.page_container .form-control {
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
.btn-group {
	margin-top: 30px;
}

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
<title>계정등록</title>
</head>

<body>
	<div id="wrapper">
		<%@include file="/WEB-INF/views/template/admin_side_menu.jsp"%>
		<div id="page-wrapper">
			<div class="container-fluid">
				<!-- Page Heading -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">계정등록</h1>
					</div>
				</div>
				<!-- /.row -->
				<div class="row">
					<div class="col-xs-8 col-xs-offset-2">
						<!-- main contents -->
						<div class="row">
							<form action="./" method="post" id="form" class="form-horizontal">
								<div class="form-group">
									<label for="email" class="control-label col-sm-2">Email</label>
									<div class="col-md-8 col-sm-6">
										<div class="input-group">
											<span class="input-group-addon">@</span>
											<input type="email"	name="email" id="email" class="form-control" placeholder="이메일입력" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="control-label col-sm-2">password</label>
									<div class="col-md-8 col-sm-6">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
											<input type="password" name="password" id="password" class="form-control" placeholder="영소대문자,숫자 포함. 10자이상" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="pwchk" class="control-label col-sm-2">확인 </label>
									<div class="col-md-8 col-sm-6">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
											<input type="password" id="pwchk" class="form-control" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="company" class="control-label col-sm-2">기업이름</label>
									<div class="col-md-8 col-sm-6">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
											<input type="text" name="company" id="company" class="form-control" placeholder="담당자-호칭까지 입력" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="bisnum" class="control-label col-sm-2">사업자번호</label>
									<div class="col-md-8 col-sm-6">
										<div class="input-group">
											<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
											<input type="text" name="bisnum" id="bisnum" class="form-control" placeholder="-제외하고 입력" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="manager" class="control-label col-sm-2">담당자</label>
									<div class="col-md-8 col-sm-6">
										<div class="input-group">
											<span class="input-group-addon">
											<i class="glyphicon glyphicon-user"></i></span>
											<input type="text" name="manager" id="manager" class="form-control" placeholder="담당자-호칭까지 입력" />
										</div>
									</div>
								</div>
								<!-- 기업주소 넣어야됨 -->
								<div class="form-group">
									<label for="phone" class="control-label col-sm-2">연락처</label>
									<div class="col-md-8 col-sm-6">
										<div class="input-group">
											<span class="input-group-addon">
											<i class="glyphicon glyphicon-phone"></i></span>
											<input type="text" name="phone" id="phone" class="form-control" placeholder="-를 제외한 숫자만 입력" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="user_type" class="control-label col-sm-2">계정유형</label>
									<div class="col-md-8 col-sm-6 funkyradio">
										<div class="funkyradio-danger">
											<input type="radio" name="user_type" id="user_1" value="광고주"
												checked /><label for="user_1">광고주</label><br>
										</div>
										<div class="funkyradio-warning">
											<input type="radio" name="user_type" id="user_2" value="직원" /><label for="user_2">직원</label><br>
										</div>
										<div class="funkyradio-warning">
											<input type="radio" name="user_type" id="user_3" value="CEO" /><label for="user_3">관리자</label><br>
										</div>
									</div>
								</div>
								<input type="hidden" name="join_route" value="normal" />
								<div>
									<div class="col-sm-2"></div>
									<div role="group" class="btn-group col-md-8 col-sm-6">
										<button type="submit" class="btn redBtn">입력</button>
										<button type="reset" class="btn darkBtn">취소</button>
									</div>
								</div>
							</form>
						</div>
						<!-- end Row -->
					</div>
					<!--  end container -->
					<!-- //main contents -->
				</div>
				<!-- end row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->
</body>
</html>