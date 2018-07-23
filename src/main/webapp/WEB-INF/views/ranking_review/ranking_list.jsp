<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
        padding: 5px 0px;
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

$(function(){
	var su=0;
        $(window).scroll(function(){
       	var maxHeight = $(document).height();
    	    var currentScroll = $(window).scrollTop() + $(window).height();
    	    if(maxHeight <= currentScroll + 600) {
    	    	if(su==0){add()}
    	    	su=1;
    	    }
	})
})

function add(){
	var num=11;
	var cate=${cate};
	$.ajax({
	        type: 'GET', // get 방식으로 요청
			dataType: 'json', // json 타입
			url: "rankingadd?id="+cate, // 데이터를 불러오는 json-server 주소입니다 .
	})
	.done(function(data){
 		data.forEach(function (data) { // 데이터의 갯수에 따라서 div를 추가해줬습니다
  			$('.page_container').append("<a href='./item/"+data.item+"'><div class='contentsbox'><div class='numbox box'><label>"+num+"</label></div><div class='imgbox box'><img src='"+data.img+"'></div><div class='conbox box'><p>"+data.brand+"</p><p>"+data.name+"</p><p>"+data.vol+"&nbsp;"+data.price+"원</p></div></div></a>");
  			num=num+1;
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
    <jsp:include page="/WEB-INF/views/template/menu.jsp"></jsp:include>
    <div class="breadcrumb">
    	<div>
   		<a href="/reset/">HOME</a>
   		<span class="slash">/</span>
   		랭킹
   		</div>
    </div>
    <!--//header-->    
     
    <!-- main contents -->
    <div class="page_container">
    	<c:set var="num" value="1" />
    	<c:forEach items="${alist }" var="bean" end="9">
	    	<a href="./item/${bean.item }">
			<div class="contentsbox">
				<div class="numbox box">
			         <label>${num}</label><c:set var="num" value="${num+1}"  /> 
				</div>
				<div class="imgbox box">
				     <img src="${bean.img }">
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
    <!-- //main contents -->

    <!--footer-->
    <%@include file="/WEB-INF/views/template/footer.jsp"%>
    <%@include file="/WEB-INF/views/template/ajax_loading.jsp"%>
    <!--//footer-->    

</body>
</html>
