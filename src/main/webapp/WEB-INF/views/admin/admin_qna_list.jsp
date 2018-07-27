<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/WEB-INF/views/template/admin_header.jsp" %>
	<title>문의사항</title>
</head>
<style>
a{
color: black;
text-decoration: none;
}

</style>
<body>
    <div id="wrapper">
	<%@include file="/WEB-INF/views/template/admin_side_menu.jsp" %>
        <div id="page-wrapper">
            <div class="container-fluid">
            <!-- 컨탠츠 시작 -->


<div class="container">
       <form action="qna/${qa_no}" method="GET">
	<h1>문의하기</h1>
	<table class="table">
	<thead>
	<tr>
		<th>글번호</th>
		<th>날짜</th>
		<th>질문유형</th>
		<th>내용</th>
		<th>답변</th>
		</tr>
	<tbody>
	<c:forEach items="${alist }" var="bean">
	<tr>
		<td><a href="./qna/${bean.qa_no }">${bean.qa_no }</a></td>
		<td><a href="./qna/${bean.qa_no }">${bean.nalja }</a></td>
		<td><a href="./qna/${bean.qa_no }">
		
			<c:choose>
	<c:when test="${bean.qa_type == '1' }">쇼핑문의
	</c:when>
	<c:when test="${bean.qa_type == '2' }">이벤트 문의
	</c:when>
	<c:when test="${bean.qa_type == '3' }">서비스 불편, 오류 제의
	</c:when>
	<c:when test="${bean.qa_type == '4' }">사용방법, 기타 문의
	</c:when>
	<c:when test="${bean.qa_type == '5' }">아이디어 제안, 칭찬
	</c:when>
	<c:when test="${bean.qa_type == '6' }">제휴문의
	</c:when>
	</c:choose>

		</a></td>
		<td><a href="./qna/${bean.qa_no }">${bean.con }</a></td>
		<td><a href="./qna/${bean.qa_no }">
			<c:choose> 
				<c:when test="${empty bean.answer}">미답변</c:when>  
				<c:otherwise>답변완료</c:otherwise>
			</c:choose>
			</a></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
       </form>     
</div><!-- 컨테이너 끝 -->
            <!-- 컨탠츠 끝 -->
            </div><!-- /.container-fluid -->
        </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->
</body>
</html>

