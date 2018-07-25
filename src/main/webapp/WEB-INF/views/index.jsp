<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/template/head.jsp"%>
	<title>Home</title>
	<script type="text/javascript">
	  $(function(){
		rankingLlist();
      });
	  function rankingLlist(){
		  $.ajax({
				type: 'get',
				url:'/reset/ranking/ajax?id=1',
				dataType:'text',
				success:function(result){
					$("#rankingList1").html(result);
				}
			});
    	$.ajax({
				type: 'get',
				url:'/reset/ranking/ajax?id=2',
				dataType:'text',
				success:function(result){
					$("#rankingList2").html(result);
				}
			});
    	$.ajax({
				type: 'get',
				url:'/reset/ranking/ajax?id=3',
				dataType:'text',
				success:function(result){
					$("#rankingList3").html(result);
				}
			});
	  }
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/template/menu.jsp"></jsp:include>
    
    <!-- main contents -->
    <div class="page_container">
		
		<h1>스킨</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
    	<div id="rankingList1"></div>
    	<h1>로션</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
   		<div id="rankingList2"></div>
    	<h1>에센스</h1>
    	<div class="welcome_line"><img src="${goRoot }imgs/welcome_bg.png"></div>
    	<div id="rankingList3"></div>
       
    </div>
    <!-- //main contents -->
    
    
<%@include file="/WEB-INF/views/template/footer.jsp"%>
</body>
</html>
