<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" charset="utf-8"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous" charset="utf-8"></script>
	
	
<script type="text/javascript">
	function detail() {
		$('.detailForm input').hide();
		$('.modal-title').html('상세페이지');
		$('.well-input').show();
		$('.modal-footer').show();
	}
	function edit(){
		$('.detailForm input').show();
		$('.modal-title').html('수정페이지');
		$('.modal-footer').hide();
	}

	
	$(function(){
		
		detail();
		$('.edit').click(function(){ edit(); });
	});
	
</script>
</head>
<body>
<nav class="navbar navbar-default">		<!-- 메뉴 nav -->
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
        <p>비트교육센터</p>
      </a>
    </div>
    <ul class="nav navbar-nav">					<!-- 메뉴 ul -->
    	<li><a href="#">Home</a></li>
    	<li><a href="#">List</a></li>
    	<li><a href="#" data-toggle="modal" data-target=".bs-example-modal-lg">새 공지사항입력하기</a></li>
    	
    		<!-- 입력하기 -->
		<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		      	<h4>입력페이지</h4>
		      </div>
		      <div class="modal-body">
		      	<form method="post">
		      <!-- 		<div class="form-group">
		      			<label for="no_no">no_no</label>
		      			<input type="text" class="form-control" name="no_no" id="no_no" placeholder="사번" />
		      		</div> -->
		      		<div class="form-group">
		      			<label for="name">제목</label>
		      			<input type="text" class="form-control" name="title" id="title"" placeholder="제목" />
		      		</div>
		      		<div class="form-group">
		      			<label for="content">내용</label>
		      			<input type="text" class="form-control" name="content" id="content" placeholder="공지사항 내용" />
		      		</div>
			        <button type="submit" class="btn btn-primary">입력</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      	</form>
		      </div>
		      
		    </div>
		  </div>
		</div> <!-- 입력페이지 끝-->
    </ul>	<!-- 메뉴 ul -->
  </div>
</nav>	<!-- 메뉴 nav -->

<div class="list-group"> <!-- list 시작 -->
	<c:forEach items="${alist }" var="bean">
	  <button type="button" class="list-group-item btn btn-default btn-lg" data-toggle="modal" data-target="#myModal-${bean.no_no }">

<!-- 배너 새 글 작성시에만 뜨도록 choose문 작성할 것 -->
		<span class="badge">New</span>
	  	<h4 class="list-group-item-heading">${bean.no_no }</h4>
	    <p class="list-group-item-text">[${bean.nalja }]${bean.content }</p>
	  </button> <!-- list 끝 -->
	  
<!-- Modal -->
		<div class="modal fade yourModal" id="myModal-${bean.no_no }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel-${bean.no_no }">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel-${bean.no_no }">${bean.no_no }번 공지사항</h4>
		      </div>
		      <div class="modal-body">
		        <form action="notice/${bean.no_no }" method="post" class="detailForm"  accept-charset="UTF-8">
		        	<input type="hidden" name="_method" value="put">
		      		<div class="form-group">
		      			<label for="no_no">글번호</label>
				        <div class="well well-sm">${bean.no_no }</div>
		      			<input type="hidden" value="${bean.no_no }" class="form-control" name="no_no" id="no_no" placeholder="사번" />
		      		</div>
		      		<div class="form-group">
		      			<label>작성일</label>
				        <div class="well well-sm">${bean.nalja }</div>
		      		</div>
		      		<div class="form-group">
		      			<label for="title">제목</label>
				        <div class="well well-sm well-input">${bean.title }</div>
		      			<input type="text" value="${bean.title }" class="form-control" name="title"" id="title" placeholder="제목" />
		      		</div>
		      		<div class="form-group">
		      			<label for="content">내용</label>
				        <div class="well well-sm well-input">${bean.content }</div>
		      			<input type="text" value="${bean.content }" class="form-control" name="content" id="content" placeholder="내용" />
		      		</div>
			        <input type="submit" class="btn btn-danger" value="수정"/>
			        <input type="button" class="btn btn-default" data-dismiss="modal" value="Close"/>
		      	</form>
		      </div>
		      <div class="modal-footer">
		        <form action="notice/${bean.no_no }" method="POST">
		        <input type="hidden" name="_method" value="delete">
		        <button type="button" class="btn btn-default" data-dismiss="modal">목록보기</button>
		        <button type="button" class="btn btn-primary edit">수정</button>
		        <button type="submit" class="btn btn-danger delete">삭제</button>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
	</c:forEach>
</div>

</body>
</html>