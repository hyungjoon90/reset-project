<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">



<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
    font-family: "Nanum Gothic", sans-serif;
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


#accordion .panel{
    border: none;
    border-radius: 3px;
    box-shadow: none;
    margin-bottom: 10px;
    background: transparent;
}
#accordion .panel-heading{
    padding: 0;
    border: none;
    border-radius: 3px;
    background: transparent;
    position: relative;
}
#accordion .panel-title a{
    display: block;
    padding: 20px 30px;
    margin: 0;
    background: rgba(0,0,0,0.4);
    font-size: 17px;
    font-weight: bold;
    color: #fff;
    letter-spacing: 1px;
    border: none;
    border-radius: 3px;
    position: relative;
}

#accordion .panel-body{
    padding: 20px 30px;
    background: rgba(0,0,0,0.1);
    font-size: 15px;
     font-weight: bold;
    color: white;
    line-height: 28px;
    letter-spacing: 1px;
    border-top: none;
    border-radius: 3px;
}


.well {
    background: white;
	
	border-style: none;
}

.panel-group a{
text-decoration: none;
}

</style>
<title>문의하기</title>

<script type="text/javascript">
/* function validateEmail(sEmail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	if (filter.test(sEmail)) {
	return true;
	}
	else {
	return false;
	}
	}
	
$(document).ready(function() {
		$('#qnaSave').click(function() {
		var sEmail = $('#email').val();
				if ($.trim(sEmail).length == 0) {
					alert('Please enter valid email address');
					e.preventDefault();
			}
				if (validateEmail(sEmail)) {
				alert('올바른 이메일입니다');
			}
			else {
				alert('잘못된 이메일입니다');
				e.preventDefault();
			}
		});	
	}); 
	
	수정 중
	*/
	
	​
</script>


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
   <h3>자주 묻는 질문</h3>
   
   <div class="fna well">
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          제품에 대해 궁금한 점이 있어요
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
제품에 대해 궁금한 점이 있을 경우,
제품 상세페이지 하단의 Q&A를 통해 판매자에게 문의하실 수 있습니다.
문의하신 글에 판매자가 답변을 완료한 경우, 문의 글 하단에 노출되며
나의 리셋 제품 Q&A 페이지에서도 확인하실 수 있습니다.


※ 제품 문의 이외에 다른 목적이나 불건전한 내용을 등록하신 경우 삭제 처리될 수 있습니다.

 ㆍ연락처를 따로 기재하여 할인/직거래 등을 유도
 ㆍ상대방에 대한 비방/욕설 또는 가격 비교
 ㆍ물품과 관련 없는 광고물이나 가입 유도, 홈페이지 및 매장 홍보

또한, 기재하신 e-mail로 답변내용이 전송됩니다. 
문의 후 3영업일 내 진행 상황을 안내해드립니다
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          회원가입 절차가 궁금해요.
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
리셋 누구나 무료로 회원 가입이 가능하며,
리셋 홈 우측 상단의 회원가입 페이지에서 하실 수 있습니다. 일반 회원가입 뿐만 아니라 구글, 다음, 네이버 같은 소셜 아이디로 연동, 가입 가능합니다.
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
         이메일을 변경하고 싶어요.
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
	아이디 변경은 불가능합니다.
단, 거래내역이 없는 경우, 개인 구매회원의 경우에 한해 회원 탈퇴 7일 이후 재가입을 통해 새로운 아이디로 가입이 가능합니다.
      </div>
    </div>
  </div>
</div>
</div><!-- fna well end  -->
</div><!-- contend -->
        <br/>	<br/>	<br/>

	<!-- qna container start -->
	<h3>문의 내용</h3>
	<div class="well">
	<form action="/reset/qna/" method="post" id="form">
	<!-- TODO reset -->
		<div class="form-group row">
			<label for="qa_type" id="qa_type" class="col-sm-2 col-form-label">문의분류</label>
			<div class="col-sm-10">
				<select class="custom-select" name="qa_type">
					<option value="0" selected>분류를 선택하세요</option>
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
				<label for="con" class="col-sm-2 col-form-label">문의내용</label>
				<div class="col-sm-10">
					<textarea type="text" class="form-control" id="con"
						name="con" placeholder="내용을 입력하세요"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="emailContatiner">
					<label for="email" class="col-sm-2 col-form-label">답변 이메일</label> 
					<div class="col-sm-10">
				<input type="text" class="form-control" name="email" id="email" placeholder="이메일 ( email@example.com )"> 
					</div>
				</div>
			</div>
			
			<div>
				<!-- <button class="submitbtn" type="submit" onclick="verifyEmail();">전송</button> -->
				<button type="submit" id="qnaSave" class="submitbtn">전송</button>
				<button class="cancelbtn" type="reset">취소</button>
			</div>
	</form>
	</div> <!-- well end  -->
	<br/>	<br/>	<br/>
	<!-- qna container end -->



	<!--footer-->
	<div class="footer">
		<div class="wrap">
			<div class="container">
				<div class="row">
					<div class="footer_L">
						<div class="foot_logo">
							<a href="index.html"><img src="../imgs/footer_logo.png" alt="" /></a>
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
