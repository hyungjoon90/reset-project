<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/WEB-INF/views/template/admin_header.jsp" %>
<link href="${goRoot }css/main.css" rel="stylesheet">

<style type="text/css">
    /* 컨텐츠 contatiner */
    h1{
		font-family: NanumSquareEB;
	    font-size: 32px;
	    color: #2e2e2e;
	}
	.page_container{
		width: 80%;
		font-family: NanumSquareR;
		margin-bottom: 15px;
	}
    .page_container>a{
        text-decoration: none;
        color: black;
    }
    .page_container>a:hover{
    	text-decoration: none;
    	color: black;
    }
    .search{
    	text-align: center;
    }
    .contentsbox{
        width: 85%;
        margin: 0px auto;
        display: flex;
        border-bottom: 0.5px solid rgb(217, 222, 232);
        padding: 5px 0px;
    }   
    .numbox{
        width: 0%;
	    margin: auto 0px;
	    font-size: 30pt;
	    text-align: right;
	    padding-right: 5%;
    }
    .labelNum{
    	padding-right: 19px;
    	color: #2e2e2e;
    }
    .imgbox{
        width: 40%;
        text-align: center;
        margin: auto 0px;
    }
    .imgbox>img{
   	    max-height: 160px;
  		max-width: 100%;
    }
	.conbox {
	    width: 60%;
	    margin: auto 0px;
	    padding-left: 5%;
	}
    .conbox>p{
        margin: 6px 0px;
    }
    .rankingBrand{
    	font-family: NanumSquareEB;
    	font-size: 23px;
    	color: #2e2e2e;
    }
    .rankingvol,.rankingPrice{
    	font-family: NanumSquareB;
    	font-size: 18px;
    	margin-right: 20px;
    	color: #2e2e2e;
    }
    .rankingImg{
    	width: 60px;
    }
    .RedBtn {
		background-color: #dd2d25;
		-moz-border-radius: 3px;
		-webkit-border-radius: 3px;
		border-radius: 3px;
		border: 1px solid #dd2d25;
	    display: inline-block;
	    cursor: pointer;
	    color: #ffffff;
	    font-family: Arial;
	    font-size: 15px;
	    font-weight: bold;
	    padding: 5px 15px;
	    margin: 5px 5px;
	    text-decoration: none;
	    color: white !important;
	    float: right;
	}
	
	.RedBtn:hover {
		color: #fff;
		background-color: #d00b01;
	}
	
	.RedBtn:active {
		position: relative;
		top: 1px;
	}
	.searchBox{
    	display: inline-block;
    }
@media (max-width: 768px) {
	.input_box {
	    float:none
	}
	.input_box{
		display: inline-block;
	}
}
@media (max-width: 610px) {
	.rankingvol{
    	display: block;
    }
}
@media (max-width: 360px) {
	.page_container{
		width: 100%;
	}
	
	.numbox{
		width: 0%;
	    text-align: center;
	    padding-right: 0;
	    font-size: 20pt;
    }
    .imgbox{
    	width: 30%;
    }
    .conbox {
	    width: 50%;
	    padding-left: 0;
	}
    .labelNum{
    	padding-right: 0px;
    }
    .form-control {
	    width: 79%;
	}
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
			url: "/itemSearch?search="+search+"&type="+type, // 데이터를 불러오는 json-server 주소입니다 .
	})
	.done(function(data){
 		data.forEach(function (data) { // 데이터의 갯수에 따라서 div를 추가해줬습니다
 			console.log(data.img);
  			$('.brand').append(
  					"<a href='item/"+data.item+"'>"+
  					"<div class='contentsbox'>"+
  					"<div class='numbox box'>"+
  					"<label></label>"+
  					"</div>"+
  					"<div class='imgbox box'>"+
  					"<img src='${goRoot}"+data.img+"'>"+
  					"</div>"+
  					"<div class='conbox box'>"+
  					"<p class='rankingBrand rankingP'>"+data.brand+"</p>"+
					"<p class='rankingName rankingP'>"+data.name+"</p>"+
					"<p><span class='rankingvol rankingP'>"+data.vol+"</span>"+
					"<span class='rankingPrice rankingP'>"+data.price+"원</span></p>"+
  					"</div>"+
  					"</div>"+
  					"</a>");
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
			url: "/itemSearch?search="+search+"&type="+type, // 데이터를 불러오는 json-server 주소입니다 .
	})
	.done(function(data){
 		data.forEach(function (data) { // 데이터의 갯수에 따라서 div를 추가해줬습니다
  			$('.name').append(
  					"<a href='item/"+data.item+"'>"+
  					"<div class='contentsbox'>"+
  					"<div class='numbox box'>"+
  					"<label></label>"+
  					"</div>"+
  					"<div class='imgbox box'>"+
  					"<img src='${goRoot}"+data.img+"'>"+
  					"</div>"+
  					"<div class='conbox box'>"+
  					"<p class='rankingBrand rankingP'>"+data.brand+"</p>"+
					"<p class='rankingName rankingP'>"+data.name+"</p>"+
					"<p><span class='rankingvol rankingP'>"+data.vol+"</span>"+
					"<span class='rankingPrice rankingP'>"+data.price+"원</span></p>"+
  					"</div>"+
  					"</div>"+
  					"</a>");
		})
	})
	.fail(function () { // 실패했을때 불러질 함수
		console.error('데이터 불러오기 실패');
	})
}
function searchCheck(){
	 var search_input = $("#search_input");
	 if(search_input.val() == ""){
		 alert("검색어를 입력해 주세요.");
		 $("#search_input").focus();
		 return false;
	 }
	 
}; 	
</script>
</head>
<body>
    <div id="wrapper">
	<%@include file="/WEB-INF/views/template/admin_side_menu.jsp" %>
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->  
     
    <!-- main contents -->
    <div class="page_container">
    <form class="form-inline searchBox">
        <div class="form-group">
            <label class="sr-only" for="search">검색</label>
            <input id="search_input"type="text" class="form-control input_box" placeholder="검색">
        </div>
        <button id="search" type="button" class="btn send_btn"><span class="main_font">검색</span></button>
    </form>
    <a class="btn-lg RedBtn" href="./itemAdd">아이템 추가</a>
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
				         <label></label>
					</div>
					<div class="imgbox box">
					     <img src="${goRoot}${bean.img }">
					</div>
					<div class="conbox box">
	                <p class="rankingBrand rankingP">${bean.brand }</p>
					<p class="rankingName rankingP">${bean.name }</p>
					<p><span class="rankingvol rankingP">${bean.vol }</span><span class="rankingPrice rankingP">${bean.price }원</span></p>
				</div>
				</div>
       		</a>
     	</c:forEach>
    	</div>
    </div>
    <!-- //main contents -->

    <!--footer-->
                </div><!-- /.container-fluid -->
        </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->
    <!--//footer-->    

</body>
</html>
