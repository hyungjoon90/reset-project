<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<title>메일보내기 테스트입니다</title>
<body>
	<form action="qnaResult.jsp" method="GET">
		 <h3>문의 내용</h3>
            <div>
                <label for="title">제목</label>
                <input type="text" name="title" id="title" />
            </div>
            <div>
                <label for="contents">내용</label>
                <input class="contents" name="contents" id="contents"  size="100" style="width:100%"/>
            </div>
        <div>
            <label for="toemail">답변 이메일</label>
            <input type="email" name="toemail" id="toemail" placeholder="이메일 ( email@example.com )">
        </div>
        <div>
            <button type="submit">전송</button>
            <button type="reset">취소</button>
        </div>
		
	</form>	
</body>
</html>