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
	<h1>관리자의 Qna리스트입니다</h1>
	<table>
		<thead>
			<th>글번호</th>
			<th>날짜</th>
			<th>질문유형</th>
			<th>내용</th>
		</thead>
		<c:forEach items="${alist }" var="bean">
		<tbody>
			<td>${bean.qa_no}</td>
			<td>${bean.nalja }</td>
			<td>${bean.qa_type }</td>
			<td>${bean.con }</td>
		</tbody>
		</c:forEach>
	</table>
</body>
</html>