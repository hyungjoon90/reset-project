<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${goRoot}js/jquery-1.12.4.js"></script>
<script src="${goRoot}js/bootstrap.min.js"></script>
<link href="${goRoot}css/bootstrap.min.css" rel="stylesheet">
<link href="${goRoot}css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${goRoot}css/main.css" rel="stylesheet">
</head>
<title>문의하기</title>
<script type="text/javascript">
function validateEmail(sEmail) {
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
	​
</script>

<body>
	<form action="qna" method="post" id="form">
		<div>
			<h3>문의 내용</h3>

			<div>
				<h3>문의 분류</h3>
				<select name="qa_type">
					<option value="0">분류를 선택하세요</option>
					<option value="1">1. 쇼핑문의</option>
					<option value="2">2. 이벤트 문의</option>
					<option value="3">3. 서비스 불편, 오류 제의</option>
					<option value="4">4. 사용 방법, 기타 문의</option>
					<option value="5">5. 아이디어 제안,칭찬</option>
					<option value="6">6. 제휴문의</option>
				</select><span>분류를 선택하세요</span>
			</div>

			<div>
				<label for="con">내용</label> <input class="con" name="con" id="con"
					size="100" style="width: 100%" /><span>내용을 입력하세요</span>
			</div>
			<div class="emailContatiner">
				<label for="email">답변 이메일</label> 
				<input type="text" name="email" id="email" placeholder="이메일 ( email@example.com )">
					<span>이메일 입력하세요</span>

				<!--<select>
            <option selected="selected">직접입력</option>
            <option value="">naver.com</option>
            <option value="">gmail.com</option>
            <option value="">daum.net</option>
            <option value="">hanmail.net</option>
            <option value="">nate.com</option>
            <option value="">hotmail.com</option>  
        </select>-->
			</div>
			<div>
				<button type="submit" id="qnaSave">전송</button>
				<button type="reset">취소</button>
			</div>
		</div>
	</form>
</body>

</html>






</body>
</html>