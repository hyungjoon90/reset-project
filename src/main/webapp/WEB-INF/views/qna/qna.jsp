<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/jquery-1.12.4.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">



<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: "Nanum Gothic", sans-serif;
	font-size: 17px;
}

.submitbtn {
	background-color: #d00b01;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: 1px solid #d00b01;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 11px 23px;
	text-decoration: none;
}

.submitbtn:active {
	position: relative;
	top: 1px;
}

.cancelbtn {
	background-color: #D1D1D1;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: 1px solid #D1D1D1;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 11px 23px;
	text-decoration: none;
}

.cancelbtn:active {
	position: relative;
	top: 1px;
}

#accordion .panel {
	border: none;
	border-radius: 3px;
	box-shadow: none;
	margin-bottom: 10px;
	background: transparent;
}

#accordion .panel-heading {
	padding: 0;
	border: none;
	border-radius: 3px;
	background: transparent;
	position: relative;
}

#accordion .panel-title a {
	display: block;
	padding: 20px 30px;
	margin: 0;
	background: rgba(0, 0, 0, 0.4);
	font-size: 17px;
	font-weight: bold;
	color: #fff;
	letter-spacing: 1px;
	border: none;
	border-radius: 3px;
	position: relative;
}

#accordion .panel-body {
	padding: 20px 30px;
	background: rgba(0, 0, 0, 0.1);
	font-size: 15px;
	font-weight: bold;
	color: black;
	line-height: 28px;
	letter-spacing: 1px;
	border-top: none;
	border-radius: 3px;
}

.qnatitle {
	font-size: 30px;
	
}

.well {
	background: white;
	border-style: none;
}

.panel-group a {
	text-decoration: none;
}

.agree p {
	text-align: center;
	font-size: 16px;
}

.agreetxt {
	padding: 10px;
	margin-top: 50px;
}

		input.invalid, textarea.invalid{
			border: 2px solid red;
		}
		
		input.valid, textarea.valid{
			border: 2px solid green;
		}


</style>
</head>
<body>
	<!--header-->
	<div class="header">
		<div class="wrap">
			<nav class="main_menu container">
				<div class="menu_img">
					<a href="/reset/"> <img src="../imgs/header_logo.png">
					</a>
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
						<a href="./login/" class="btn send_btn"><span
							class="main_font">로그인</span></a> <a href="./sign/"
							class="btn send_btn"><span class="main_font">회원가입</span></a>
					</form>
				</div>
				<div class="menu_bar">
					<ul class="nav">
						<li class="current"><a href="/reset/">홈</a></li>
						<li class="top-menu"><a href="/reset/">랭킹</a>
							<div class="space">
								<ul class="sub-menu">
									<li><a href="./ranking?id=1">스킨</a></li>
									<li><a href="./ranking?id=2">로션</a></li>
									<li><a href="./ranking?id=3">에센스</a></li>
								</ul>
							</div></li>
						<li><a href="#">화플</a></li>
						<li><a href="#">이벤트</a></li>
						<li><a href="./qna/qnaEmail">문의</a></li>
						<li><a href="./admin/qnaList">admin</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<!--//header-->


	<!-- collapse start -->
	<div class="container">
		<h3>자주 묻는 질문</h3>

		<div class="fna well">
			<div class="panel-group" id="accordion" role="tablist"
				aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
						<h4 class="panel-title">
							<a role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne"> 제품에 대해 궁금한 점이 있어요 </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in"
						role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">제품에 대해 궁금한 점이 있을 경우, 제품 상세페이지 하단의
							Q&A를 통해 판매자에게 문의하실 수 있습니다. 문의하신 글에 판매자가 답변을 완료한 경우, 문의 글 하단에 노출되며
							나의 리셋 제품 Q&A 페이지에서도 확인하실 수 있습니다. ※ 제품 문의 이외에 다른 목적이나 불건전한 내용을
							등록하신 경우 삭제 처리될 수 있습니다. ㆍ연락처를 따로 기재하여 할인/직거래 등을 유도 ㆍ상대방에 대한 비방/욕설
							또는 가격 비교 ㆍ물품과 관련 없는 광고물이나 가입 유도, 홈페이지 및 매장 홍보 또한, 기재하신 e-mail로
							답변내용이 전송됩니다. 문의 후 3영업일 내 진행 상황을 안내해드립니다</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseTwo"
								aria-expanded="false" aria-controls="collapseTwo"> 회원가입 절차가
								궁금해요. </a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">
						<div class="panel-body">리셋 누구나 무료로 회원 가입이 가능하며, 리셋 홈 우측 상단의
							회원가입 페이지에서 하실 수 있습니다. 일반 회원가입 뿐만 아니라 구글, 다음, 네이버 같은 소셜 아이디로 연동,
							가입 가능합니다.</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingThree">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseThree"
								aria-expanded="false" aria-controls="collapseThree"> 이메일을
								변경하고 싶어요. </a>
						</h4>
					</div>
					<div id="collapseThree" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingThree">
						<div class="panel-body">아이디 변경은 불가능합니다. 단, 거래내역이 없는 경우, 개인
							구매회원의 경우에 한해 회원 탈퇴 7일 이후 재가입을 통해 새로운 아이디로 가입이 가능합니다.</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingFour">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFour"
								aria-expanded="false" aria-controls="collapseFour"> 매거진 캐스트와
								제휴하고 싶어요. </a>
						</h4>
					</div>
					<div id="collapseFour" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingFour">
						<div class="panel-body">매거진/이벤트 서비스와 제휴를 원하신다면 홈 페이지 하단의
							‘RE:SET 제휴 제안’을 통해 등록해 주셔야 합니다. 제휴해주신 내용은 담당 부서에서 검토한 후 반영되기 때문에
							제안 주실 콘텐츠의 샘플을 포함하여 회사 연락처, 담당자 이름을 문의하기로 글을 남겨주세요. ▶ RE:SET 제휴
							제안 바로 가기 리셋 매거진 서비스에 대한 제휴 건에 대해서는 모두 해당 페이지를 통하여 진행되고 있는 점
							참고해주시면 감사하겠습니다</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingFive">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseFive"
								aria-expanded="false" aria-controls="collapseFive"> 리뷰나 댓글을
								등을 신고하고 싶어요. </a>
						</h4>
					</div>
					<div id="collapseFive" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingFive">
						<div class="panel-body">문의사항에 문의글을 남겨주시면 확인 후 연락드리겠습니다. 신고하실
							때, 신고하시는 이유를 선택해 주세요. ※ 참고해주세요! -리뷰/댓글을 신고하고 싶다면 등록된 게시물 중 대표적으로
							문제되는 게시물의 URL을 입력해주세요. 개인정보 노출 내 창작물에 대한 저작권 침해 비방/비하, 명예훼손,
							사생활침해 부적절한 홍보(불법물, 프리서버 홍보 등), 음란/청소년에게 부적합한 내용, 악성코드</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingSix">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse"
								data-parent="#accordion" href="#collapseSix"
								aria-expanded="false" aria-controls="collapseSix"> (구)단체
								아이디를 쓸 수 없어요 </a>
						</h4>
					</div>
					<div id="collapseSix" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingSix">
						<div class="panel-body">안녕하세요, 리셋입니다. 개인사업자, 법인, 공식 단체뿐만 아니라
							동아리, 친목 단체 같은 비공식 단체에서도 간편하게 가입하고 쉽게 사용하실 수 있도록 새로운 단체 아이디 서비스를
							선보인 바 있는데요, 이에 따라 (구)단체 아이디 서비스의 이용률 저하 및 기존 서비스 유지에 많은 어려움이 있어

							(구)단체 아이디 서비스를 2018년 3월 27일 부로 종료하게 되어 안내 드립니다. 그동안 (구)단체 아이디를
							이용해 주신 분들께 감사드리며, 서비스 종료와 관련한 자세한 사항은 아래 내용을 참고 부탁드립니다. * 종료 일시 :
							2018년 3월 27일 1. (신)단체 아이디로 새롭게 가입(전환)하시면 기존 데이터를 그대로 이전하여 사용하실 수
							있습니다. - 기존에 사용하시던 (구)단체 아이디 그대로 (신)단체 아이디로 가입이 가능합니다. (아이디 재설정
							불필요) - (신)단체 아이디 가입은 관리자만 가능하며, 관리자의 약관 동의 및 휴대전화 인증이 필요합니다. -
							관리자가 없는 (구)단체 아이디의 경우 관리자를 선정하신 후 (신)단체 아이디 서비스에 가입(전환)하시기 바랍니다.

							- 연령, 성별 또는 실명 정보 확인이 필요한 일부 서비스(유료 컨텐츠 구입, 연령 인증 필요한 웹툰 등)는
							(신)단체 아이디의 이용이 제한됩니다. - (신)단체 아이디로 가입(전환)은 사용하시던 (구)단체 아이디로 로그인 후
							가능합니다.</div>
					</div>
				</div>
			</div>
		</div>


		<!-- fna well end  -->

		<!-- contend -->
		<br /> <br /> <br />

		<!-- qna container start -->
		<div>
			<span class="qnatitle">문의 내용</span><span class="pull-right"><sup
				style="color: red">*</sup>는 필수항목입니다</span> <br>

			<div class="well">
				<form action="/reset/qna" method="post" id="form">
					<!-- TODO reset -->
					<div class="form-group row">
						<label for="qa_type" id="qa_type" class="col-sm-2 form-label">문의분류</label>
						<div class="col-sm-10">
							<select class="form-control" name="qa_type" id="select">
								<option value="0">분류를 선택하세요</option>
								<option value="1">1. 쇼핑문의</option>
								<option value="2">2. 이벤트 문의</option>
								<option value="3">3. 서비스 불편, 오류 제의</option>
								<option value="4">4. 사용 방법, 기타 문의</option>
								<option value="5">5. 아이디어 제안,칭찬</option>
								<option value="6">6. 제휴문의</option>
							</select>
						</div>
		
						
					</div>
					<div class="form-group row">
						<label for="con" class="col-sm-2">문의내용<sup
							style="color: red">*</sup></label>
						<div class="col-sm-10">
							<textarea class="form-control" id="con" name="con" rows="15"
								placeholder="내용을 입력하세요. 30자 이상 입력시 작성완료 가능"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<div class="emailContatiner">
							<label for="email" class="col-sm-2 form-label">답변 이메일<sup
								style="color: red">*</sup></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="email" id="email" placeholder="이메일 ( email@example.com )">
							</div>
						</div>
					</div>

					<div class="agree">
						<hr>
						<div class="agreetxt">개인정보 수집·이용에 대한 안내 필수 수집·이용 항목 (문의접수와
							처리,회신을 위한 최소한의 개인정보로 동의가 필요합니다.) 수집항목 목적 보유기간 이메일 주소, 휴대폰 번호
							고객문의 및 상담요청에 대한 회신, 상담을 위한 서비스 이용기록 조회 관련 법령 또는 회사 내부방침에 의해 보존 필요
							시 까지 보관, 그외 지체없이 파기합니다. 더 자세한 내용에 대해서는 리셋 개인정보처리방침을 참고하시기 바랍니다.</div>
						<br> <br>
						<p class="agreeask">
							<strong><input type="checkbox" id="agreebtn"> 위
								내용에 동의합니다.</strong>
						<p>
						<hr>
					</div>

					<script type="text/javascript">
					$(document).ready(function() {
							var qnaSave = $('#qnaSave');
							var con = $('#con');
							var email = $('#email');
							var checkbox = $('input[type="checkbox"]');
				
							
							qnaSave.click(function(event) {
							var select = $("#select option:selected").val();
									if(select == 0){
										console.log('문의 분류 미선택 : submit 불가능');
										/* event.preventDefault(); */
									}else{
										return true;
									}
									if(con.val().length < 1){
										console.log('내용 미입력 : submit 불가능');
										event.preventDefault();
									}else{
										return true;
									}
									if(email.val().length < 1){
										console.log('이메일 미입력 : submit 불가능'); 
										$('#email').append("<span>오류</span>");
										event.preventDefault();
									}else{
										return true;
									}
									if(checkbox.is(':checked')){
										console.log('checkbox : checked');
										return true;
									}else{
										console.log('checkbox : unchecked');
										event.preventDefault();
									}
								
									
							/* 		
							    function validate_Email(email) {
							        var expression = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
							        if (expression.test(email)) {
							        return true;
							        }
							        else {
							        alert('이메일 주소가 아님');
							        return false;
							        } 
							    };*/
							});
						});
						
					</script>

					<div class="btns pull-right">
						<!-- <button class="submitbtn" type="submit" onclick="verifyEmail();">전송</button> -->
						<button type="submit" id="qnaSave" class="submitbtn"
							value="submit">작성</button>
						<button class="cancelbtn" type="reset">취소</button>
					</div>
				</form>
			</div>
			<!-- well end  -->
		</div>
		<br /> <br /> <br />
	</div>
	<!-- qna container end -->



	<!--footer-->
	<div class="footer">
		<div class="wrap">
			<div class="container">
				<div class="row">
					<div class="footer_L">
						<div class="foot_logo">
							<a href="index.html"><img src="../imgs/footer_logo.png"
								alt="" /></a>
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
	<!-- footer -->

</body>

</html>
