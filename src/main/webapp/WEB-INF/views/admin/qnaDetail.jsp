<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script type="text/javascript">

</script>

</head>
<body>
		        <h4>글번호 ${bean.qa_no} 상세페이지</h4>	
		      		<div>
		      			<label for="qa_no">글번호</label>
				        <div>${bean.qa_no }</div>
		      			<input type="hidden" value="${bean.qa_no }" class="form-control" name="qa_no" id="qa_no" placeholder="사번" />
		      		</div>
                    <div>
		      			<label>날짜</label>
				        <div>${bean.nalja }</div>
		      		</div>
		      		<div>
		      			<label>질문유형</label>
				        <div>${bean.qa_type }</div>
		      		</div>
		      		<div>
		      			<label>내용</label>
				        <div>${bean.con }</div>
		      		</div>
		      		<div>
		      			<label>답변</label>
				        <div>${bean.answer }</div>
				        <form action="answer" method="post">
				        <input type="text" name="answer" id="answer" class="answer-input" palceholder="답변을 작성하세요"/>
		      			</form>
		      		</div>
		 
	<form action="/qnaDetail/${bean.qna }">     
	 <input type="hidden" name="_method" value="delete">
	<button type="button">목록</button>
	<button type="button">답변작성</button> 
	<button type="submit">삭제</button> 
	</form>
</body>
</html>