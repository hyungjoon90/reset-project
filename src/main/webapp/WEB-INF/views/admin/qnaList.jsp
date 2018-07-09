<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="qnaList" method="GET">
	<h1>관리자의 Qna리스트입니다</h1>
	<table>
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
		<td><a href="./qnaDetail/${bean.qa_no }">${bean.qa_no }</a></td>
		<td><a href="./qnaDetail/${bean.qa_no }">${bean.nalja }</a></td>
		<td><a href="./qnaDetail/${bean.qa_no }">${bean.qa_type }</a></td>
		<td><a href="./qnaDetail/${bean.qa_no }">${bean.con }</a></td>
		<td><a href="./qnaDetail/${bean.qa_no }">
			<c:choose> 
				<c:when test="${bean.answer == null}">미답변</c:when>  
				<c:otherwise>답변완료</c:otherwise>
			</c:choose>
			</a></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
<!-- 	<div>
		<button type="button">목록</button>
		<button type="button">수정</button>
		<button type="button">삭제</button>
	</div>
	 -->
	 </form>
</body>
</html>