<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${goRoot }js/jquery-1.12.4.js"></script>
<script src="${goRoot }js/bootstrap.min.js"></script>
<link href="${goRoot }css/bootstrap.min.css" rel="stylesheet">
<link href="${goRoot }css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${goRoot }css/main.css" rel="stylesheet">
	<title>Home</title>
<script type="text/javascript">

$(document).ready(function(){
	var email=$("#email").val();
    /* var email=${email}; */
    var p_no=$("#p_no").val();
    /* var p_no=${p_no}; */
	var type=$("#type").val();	    
	/* var type=${type}; */		    
    $.ajax({
    	type:'post',
		url: '/reset/like/'+type+'/'+p_no,
		data : JSON.stringify({
			email : email,
			type : type,
			p_no : p_no
		}),
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType: "text"
	}) 
	.done(function(data){
		$("#result").val(data);
 	})
	.fail(function () { // 실패했을때 불러질 함수
		console.error('데이터 수정 실패');
	})     
	
	$("#Likes").on("click",function(){
		    var email=$("#email").val();
		    /* var email=${email}; */
		    var p_no=$("#p_no").val();
		    /* var p_no=${p_no}; */
			var type=$("#type").val();	    
			/* var type=${type}; */		    
		    $.ajax({
		    	type:'PUT',
				url: '/reset/likes/'+encodeURI(type)+'/'+encodeURI(p_no),
				data : JSON.stringify({
					email : email,
					type : type,
					p_no : p_no
				}),
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PUT"
				},
				dataType: "text"
			}) 
			.done(function(data){
				console.log(data);
				if(data=="1"){
					console.log("성공");
					$("#result").val("like");
				} else if(data=="0"){
					alert("실패하였습니다.");
				}
		 	})
			.fail(function () { // 실패했을때 불러질 함수
				console.error('데이터 수정 실패');
			})     
		})
		
	$("#unLikes").on("click",function(){
		    var email=$("#email").val();
		    /* var email=${email}; */
		    var p_no=$("#p_no").val();
		    /* var p_no=${p_no}; */
			var type=$("#type").val();	    
			/* var type=${type}; */		    
		    $.ajax({
		    	type:'DELETE',
				url: '/reset/likes/'+encodeURI(type)+'/'+encodeURI(p_no),
				data : JSON.stringify({
					email : email,
					type : type,
					p_no : p_no
				}),
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType: "text"
			}) 
			.done(function(data){
				console.log(data);
				if(data=="1"){
					console.log("성공");
					$("#result").val("unlike");
				} else if(data=="0"){
					alert("실패하였습니다.");
				}
		 	})
			.fail(function () { // 실패했을때 불러질 함수
				console.error('데이터 수정 실패');
			})     
		})
		
});
	
</script>
</head>
<body>
	<!--header-->
    <div class="header">
    	<div class="wrap">
            <nav class="main_menu container">
                <div class="menu_img">
                <a href="/reset/">
                    <img src="${goRoot }imgs/header_logo.png">
                    </a>
                </div>
                <div class="menu_login">
                    <form class="form-inline">
                        <div class="form-group">
                            <label class="sr-only" for="search">검색</label>
                            <input type="text" class="form-control input_box" placeholder="검색">
                        </div>
                        <button type="submit" class="btn send_btn"><span class="main_font">검색</span></button>
                        <button type="submit" class="btn send_btn"><span class="main_font">로그인</span></button>
                        <button type="submit" class="btn send_btn"><span class="main_font">회원가입</span></button>
                    </form>
                </div>
                <div class="menu_bar">
                    <ul class="nav">
                      <li class="current"><a href="/reset/">홈</a></li>
                      <li class="top-menu"><a href="/reset/">랭킹</a>
                      	<div class="space">
						  <ul class="sub-menu">
						      <li><a href="${goRoot}ranking?id=1">스킨</a></li>
							  <li><a href="${goRoot}ranking?id=2">로션</a></li>
							  <li><a href="${goRoot}ranking?id=3">에센스</a></li>
						  </ul>
						</div>
					  </li>
                      <li><a href="#">화플</a></li>
                      <li><a href="#">이벤트</a>
                      </li>                                  
                      <li><a href="contacts.html">문의</a></li>
                    </ul>
                </div>
             </nav>                
        </div>    
    </div>
    <!--//header-->    
     
    <!-- main contents -->
   <div class="page_container">    
			<input id="email" type="text" value="cus1@naver.com" />
			<input id="p_no" type="text" value="1" />
			<input id="type" type="text" value="review" />
			<button id="Likes" type="button" class="btn btn-lg btn-primary" >
			  좋아요
			</button>
			<button id="unLikes" type="button" class="btn btn-lg btn-primary" >
			  좋아요 취소
			</button>
			<input id="result" type="text" value="" />
			
	</div>
    <!-- //main contents -->
    
    <!--footer-->
    <div class="footer">
        <div class="wrap">
            <div class="container">
                <div class="row">
                    <div class="footer_L">
                        <div class="foot_logo"><a href="index.html"><img src="${goRoot }imgs/footer_logo.png" alt="" /></a></div>
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