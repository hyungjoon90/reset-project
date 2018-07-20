<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<!-- TODO [kss]경로 넣어줘야됨 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../../js/jquery-1.12.4.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/login.js"></script>
<script src="../../js/ser.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../../css/main.css" rel="stylesheet">
	<title>Normol LoginView</title>
</head>
<script>

	var forCompanySW = false;
$(function(){
	// 이벤트 달기
	$('#findPw').on("click",function(){
	    $('#myModal').modal({
		      show: true
		    });
	});
	$( "#forCompany" ).click(function() {
		$( "#for_company_info" ).toggle( "fast", function() {
			$("#bisnumFind").prop("disabled",forCompanySW);
			forCompanySW = !forCompanySW;
			if(forCompanySW){
				$("#forCompany").text("일반회원으로 찾기");
			}else{
				$("#forCompany").text("기업회원으로 찾기");
			}
		});
	});
	$("input").each(function(){
		$(this).on("focus",function(e){
	        $(e.target).val('');
	        $(this).css("color","black");
	        $(this).parent().find(".errM").remove();
	    });
	});
	
	$(".check-email").each(function(){
		$(this).on('blur',function(e){
			checkEmail(e.target);
		});
	});
	$(".only-num").on('keyup',onlyNumber);
	$(".only-num").on('keydown',onlyNumber);

	$("#goLogin").on('click',function(){
		if(submitCheck(document.getElementById("login_form"))){
			var tmpPW = $("#password").val();
			$("#password").val(SHA256(tmpPW));
			formData = $("#login_form").serialize();
			$.post(".",formData)
				.done(function(data) {
					if(data.result>=200 && data.result<400){
						alert(data.msg);
						window.location.href=data.redirect;
					}else{
						alert(data.msg);
					}
			  	})
			  	.fail(function() {
			    	alert( "알수 없는 오류" );
			  	});
		}	
	});// goLogin 클릭이벤트 끝
	
	$("#checkInfo").on('click',function(){
		var $bisnum = $("#bisnumFind");
		if($bisnum.val()=="") $("#bisnumFind").val(0);
		if(submitCheck(document.getElementById("findForm"))){
			var abc = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			var newPw = Math.random().toString(22).slice(5) 
					+ abc.charAt(Math.floor(Math.random() * abc.length));
			$("#tmp1").val(newPw);
			$("#tmp2").val(SHA256(newPw));
			formData = $("#findForm").serialize();
			$.post("../find/",formData)
			.done(function(data) {
				if(data.result>=200 && data.result<400){
					alert(data.msg);
				}else{
					alert(data.msg);
				}
		  	})
		  	.fail(function() {
		    	alert( "알수 없는 오류" );
		  	});
		}
	});// #checkInfo
		
});


/*
$(document).on({
    'show.bs.modal': function() {
      var zIndex = 1040 + (10 * $('.modal:visible').length);
      $(this).css('z-index', zIndex);
      setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
      }, 0);
    },
    'hidden.bs.modal': function() {
      if ($('.modal:visible').length > 0) {
        setTimeout(function() {
          $(document.body).addClass('modal-open');
        }, 0);
      }
    }
  }, '.modal');*/
</script>

<body>
	<!--header-->
    <div class="header">
    	<div class="wrap">
            <nav class="main_menu container">
                <div class="menu_img">
                    <img src="../imgs/header_logo.png">
                </div>
                <div class="menu_login">
                    <form class="form-inline">
                        <div class="form-group">
                            <label class="sr-only" for="search">검색</label>
                            <input type="text" class="form-control input_box" placeholder="검색">
                        </div>
                        <button type="submit" class="btn send_btn"><span class="main_font">검색</span></button>
                        <a href="../login/" class="btn send_btn"><span class="main_font">로그인</span></a>
                        <a href="../sign/" class="btn send_btn"><span class="main_font">회원가입</span></a>
                    </form>
                </div>
                <div class="menu_bar">
                    <ul class="nav">
                      <li class="current"><a href="index.html">홈</a></li>
                      <li><a href="../about.html">랭킹</a></li>
                      <li class="top-menu"><a href="javascript:{}">화플</a>
                          <ul class="sub-menu">
                              <li><a href="../scaffolding.html">Scaffolding</a></li>
                              <li><a href="../typography.html">Typography</a></li>
                              <li><a href="../shortcodes.html">Shortcodes</a></li>
                              <li><a href="../tables.html">Tables</a></li>
                          </ul>
                      </li>
                      <li class="top-menu"><a href="javascript:{}">이벤트</a>
                           <ul class="sub-menu">
                              <li><a href="../portfolio_2columns.html">2 Columns</a></li>
                              <li><a href="../portfolio_3columns.html">3 Columns</a></li>
                              <li><a href="../portfolio_4columns.html">4 Columns</a></li>
                          </ul>
                      </li>                                  
                      <li class="top-menu"><a href="javascript:{}">리뷰</a>
                           <ul class="sub-menu">
                              <li><a href="../blog.html">Blog with right sidebar</a></li>
                              <li><a href="../blog_post.html">Blog post</a></li>
                          </ul>
                      </li>
                      <li><a href="../contacts.html">문의</a></li>
                    </ul>
                </div>
             </nav>                
             
        </div>    
    </div>
    <!--//header-->    
     
    <!-- main contents -->
    <div class="page_container">
    
    	<div>
    		<form id="login_form" action="post">
  				<div class="form-group">
  					<label for="email">Email</label>
  					<input type="email" name="email" class="form-control check-email" id="email" placeholder="email">
				</div>    		
  				<div class="form-group">
  					<label for="password">password</label>
  					<input type="password" name="password" class="form-control" id="password" placeholder="비밀번호">
				</div>
    			<div>
    				<button type="button" class="btn btn-default" id="goLogin">로그인하기</button>
    				<button type="button" class="btn btn-default" id="findPw">비밀번호 찾기</button>
    			</div>
    		</form>
    	</div>
		<!-- login Modal -->
		<div class="modal" id="myModal" aria-hidden="true" style="display: none; z-index: 1050;">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h4 class="modal-title">비밀번호 찾기</h4>
					</div>
					<div class="container"></div>
					<div class="modal-body">
						비밀번호를 찾을려면 로그인 개인정보를 입력
						<form id="findForm">
			    			<button type="button" class="btn btn-default" id="forCompany">기업회원 찾기</button>
			  				<div class="form-group">
			  					<label for="emailFind">Email</label>
			  					<input type="email" name="emailFind" class="form-control check-email" id="emailFind" placeholder="email">
							</div>
			  				<div class="form-group">
			  					<label for="phoneFind">연락처</label>
			  					<input type="text" name="phoneFind" class="form-control only-num" id="phoneFind" placeholder="-제외한 숫자만 입력">
							</div>
							<div class="form-group" id="for_company_info" style="display:none">
			  					<label for="bisnumFind">사업자번호</label>
			  					<input type="text" name="bisnumFind" class="form-control only-num" id="bisnumFind" placeholder="-제외한 숫자만 입력" disabled="disabled">
							</div>
							<input type="hidden" name="tmp1" id="tmp1" value="0"/>
							<input type="hidden" name="tmp2" id="tmp2" value="0"/>
			    			<div>
			    				<button type="button" class="btn btn-default" id="checkInfo">확인하기</button>
			    			</div>
						</form>
						<div id="result"></div>						
					</div>
				</div>
			</div>
		</div>
		<!-- login Modal end -->
		
       
    </div><!-- </div class="page_container"> -->
    <!-- //main contents -->

    <!--footer-->
    <div class="footer">
        <div class="wrap">
            <div class="container">
                <div class="row">
                    <div class="footer_L">
                        <div class="foot_logo"><a href="index.html"><img src="imgs/footer_logo.png" alt="" /></a></div>
                        <div class="copyright">&copy; 2020 Jessica White. Professional Fashion Photography. All Rights Reserved.</div>                        
                    </div>
                    <div class="footer_R">
                        <div class="fright">
                            <form action="#" method="post">
                                <input class="inp_search" name="name" type="text" value="   Search the Site" onfocus="if (this.value == 'Search the Site') this.value = '';" onblur="if (this.value == '') this.value = 'Search the Site';" />
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
