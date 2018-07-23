<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	<title>Home</title>
<style type="text/css">
    /* 컨텐츠 contatiner */
	.page_container{
		width: 80%;
        border: 0.5px solid rgb(217, 222, 232);
	}
    .page_container>a{
        text-decoration: none;
        color: black;
    }
    .page_container>a:hover{
    	text-decoration: none;
    	color: black;
    }
    .contentsbox{
        width: 85%;
        margin: 0px auto;
        display: flex;
        border-bottom: 0.5px solid rgb(217, 222, 232);
    }   
    .numbox{
        width: 20%;
        margin: auto 0px;
        font-size: 30pt;
        text-align: center;
    }
    .imgbox{
        width: 30%;
        text-align: center;
        height: 160.5px;
    }
    .imgbox>img{
    	width: 160px;
    	height: 160px;
    }
    .conbox{
        width: 50%;
        margin: auto 0px;
    }
    .conbox>p{
        margin: 6px 0px;
    }
    .conbox>p:first-child,.conbox>p:last-child{
        color: #84868e;
    }
</style>
<script type="text/javascript">

$(document).ready(function(){
	$("#search").on("click",function(){
		$('.brand').empty();
		$('.name').empty();
		search_brand();
		search_name();
	})
})

function search_brand(){
	var search=$('#search_input').val();
	var type="brand";
	$.ajax({
	        type: 'GET', // get 방식으로 요청
			dataType: 'json', // json 타입
			url: "/reset/itemSearch?search="+search+"&type="+type, // 데이터를 불러오는 json-server 주소입니다 .
	})
	.done(function(data){
 		data.forEach(function (data) { // 데이터의 갯수에 따라서 div를 추가해줬습니다
 			console.log(data.img);
  			$('.brand').append(
  					"<a href='./item/"+data.item+"'>"+
  					"<div class='contentsbox'>"+
  					"<div class='numbox box'>"+
  					"<label>○</label></div>"+
  					"<div class='imgbox box'>"+
  					"<img src='${goRoot }"+data.img+"'>"+
  					"</div>"+
  					"<div class='conbox box'>"+
  					"<p>"+data.brand+"</p>"+
  					"<p>"+data.name+"</p>"+
  					"<p>"+data.vol+"&nbsp;"+data.price+"원</p>"+
					"</div></div></a>");
		})
	})
	.fail(function () { // 실패했을때 불러질 함수
		console.error('데이터 불러오기 실패');
	})
}
function search_name(){
	var search=$('#search_input').val();
	var type="name";
	$.ajax({
	        type: 'GET', // get 방식으로 요청
			dataType: 'json', // json 타입
			url: "/reset/itemSearch?search="+search+"&type="+type, // 데이터를 불러오는 json-server 주소입니다 .
	})
	.done(function(data){
 		data.forEach(function (data) { // 데이터의 갯수에 따라서 div를 추가해줬습니다
  			$('.name').append(
  					"<a href='./item/"+data.item+"'>"+
  					"<div class='contentsbox'>"+
  					"<div class='numbox box'>"+
  					"<label>○</label></div>"+
  					"<div class='imgbox box'>"+
  					"<img src='${goRoot }"+data.img+"'>"+
  					"</div>"+
  					"<div class='conbox box'>"+
  					"<p>"+data.brand+"</p>"+
  					"<p>"+data.name+"</p>"+
  					"<p>"+data.vol+"&nbsp;"+data.price+"원</p>"+
					"</div></div></a>");
		})
	})
	.fail(function () { // 실패했을때 불러질 함수
		console.error('데이터 불러오기 실패');
	})
}
    	    	
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
						      <li><a href="./ranking?id=1">스킨</a></li>
							  <li><a href="./ranking?id=2">로션</a></li>
							  <li><a href="./ranking?id=3">에센스</a></li>
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
    <form class="form-inline">
        <div class="form-group">
            <label class="sr-only" for="search">검색</label>
            <input id="search_input"type="text" class="form-control input_box" placeholder="검색">
        </div>
        <button id="search" type="button" class="btn send_btn"><span class="main_font">검색</span></button>
    </form>
    <a href="./itemAdd">아이템 추가</a>
    	<h1>브랜드</h1>
    	<div class="brand">
    	</div>
    	<br>
    	<h1>이름</h1>
    	<div class="name">
    	</div>
    	<br>
    	<h1>모든 제품</h1>
    	<div>
    	<c:forEach items="${alist }" var="bean">
	    	<a href="./item/${bean.item }">
				<div class="contentsbox">
					<div class="numbox box">
				         <label>○</label>
					</div>
					<div class="imgbox box">
					     <img src="${goRoot}${bean.img }">
					</div>
					<div class="conbox box">
		                <p>${bean.brand }</p>
					    <p>${bean.name }</p>
					    <p>${bean.vol }&nbsp;${bean.price }원</p>
					</div>
				</div>
       		</a>
     	</c:forEach>
    	</div>
    </div>
    <!-- //main contents -->

    <!--footer-->
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    <!--//footer-->    

</body>
</html>
