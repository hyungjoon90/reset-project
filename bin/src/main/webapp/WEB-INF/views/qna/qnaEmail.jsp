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
	
	var con = $('#con')

  function validateEmail(email) {
  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	   return re.test(email);
	}// function validateEmail(email)

	function checkEmail() {
	    var $errM = $("<div/>",{"class":"errM"});
	     var $target = $("#email");
	     if (validateEmail($target.val())) {
	          var $postM = $.post( "check_mail", "email="+$target.val() );
	          $postM.done(function( data ) {
	               if(data.result==0){
	                  inputSucces($target);
	            	  
	               }else{
	                 inputFail($target,$errM,"이미 사용중인 이메일입니다.")
	                 
	               }
	          });
	     }else {
	         inputFail($target,$errM,"올바른 이메일을 입력해주세요.")

	     }
	} 


</script>
​
<body>
	<form action="qna" method="post">
		<div>
			<h3>문의 내용</h3>

			<div>
				<h3>문의 분류</h3>
				<select name="qa_type">
					<option value="0">분류를 선택하세요</option>
					<c:choose>
						<c:when test="">

						</c:when>
					</c:choose>
					<option value="1">1. 쇼핑문의</option>
					<option value="2">2. 이벤트 문의</option>
					<option value="3">3. 서비스 불편, 오류 제의</option>
					<option value="4">4. 사용 방법, 기타 문의</option>
					<option value="5">5. 아이디어 제안,칭찬</option>
					<option value="6">6. 제휴문의</option>
				</select>
			</div>

			<div>
				<label for="con">내용</label> <input class="con" name="con" id="con"
					size="100" style="width: 100%" />
			</div>
			<div class="emailContatiner">
				<label for="email">답변 이메일</label> <input type="text" name="email"
					id="email" placeholder="이메일 ( email@example.com )">
			
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
				<button type="submit" onclick=verifyEmail()>전송</button>
				<button type="reset">취소</button>
			</div>
		</div>
	</form>
</body>

</html>






</body>
</html>