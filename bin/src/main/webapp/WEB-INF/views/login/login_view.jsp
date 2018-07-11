<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/login.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
	<title>Normol LoginView</title>
</head>
<script>

$(function(){
	$('#findPw').on("click",function(){
	    $('#myModal').modal({
		      show: true
		    })
	});
	
	$("input").each(function(){
		$(this).on("focus",function(){
	        $(this).val('');
	        $(this).css("color","black");
	        $(this).parent().find(".errM").remove();
	    });
	});
	
	
	
	function checkEmail(ele) {
	    var $errM = $("<div/>",{"class":"errM"});
	     var $target = $(ele);
	     if (validateEmail($target.val())) {
	    	 
			return true;	
	     }else {
	         inputFail($target,$errM,"올바른 이메일을 입력해주세요.")
	         return false;
	     }
	}// fucntion checkPW()

	
	$(".check-email").each(function(){
		console.log(this);
		$(this).on('blur',checkEmail(this));
	});
	$(".only-num").on('keyup',onlyNumber);
	$(".only-num").on('keydown',onlyNumber);
})



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
  }, '.modal');
  
  
  
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
  					<input type="email" class="form-control check-email" id="email" placeholder="email">
				</div>    		
  				<div class="form-group">
  					<label for="password">password</label>
  					<input type="password" class="form-control" id="password" placeholder="비밀번호">
				</div>
    			<div>
    				<button type="button" class="btn btn-default">로그인하기</button>
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
			  				<div class="form-group">
			  					<label for="emailFind">Email</label>
			  					<input type="email" class="form-control check-email" id="emailFind" placeholder="email">
							</div>    		
			  				<div class="form-group">
			  					<label for="phoneFind">연락처</label>
			  					<input type="text" class="form-control only-num" id="phoneFind" placeholder="-제외한 숫자만 입력">
							</div>
							<div class="form-group" id="for_company_info">
			  					<label for="bisnumFind">연락처</label>
			  					<input type="text" class="form-control only-num" id="bisnumFind" placeholder="-제외한 숫자만 입력" disabled="disabled">
							</div>	
			    			<div>
			    				<button type="button" class="btn btn-default" id="checkInfo">확인하기</button>
			    				<button type="button" class="btn btn-default" id="forCompany">기업회원 비밀번호</button>
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
