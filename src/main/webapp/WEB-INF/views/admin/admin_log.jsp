<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<div class="list-group">
	<c:forEach items="${log_list }" var="line">
		<a href="#" class="list-group-item" style="width:100%; text-overflow: ellipsis;">
			<span class="badge">${line.nalja}</span>${line.msg}
		</a>
	</c:forEach>
</div>
<c:if test="${more_Log}">
   <div class="text-right">
   		<a href="${goRoot}">더보기</a>
   </div>
</c:if>

