<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<div class="list-group">
	<c:forEach items="${log_list }" var="line">
		<c:if test="${mode ne 'detail' }">
		<a href="#" class="list-group-item" style="width:100%; text-overflow: ellipsis;">
			<p><span class="badge">${line.nalja}</span>${line.msg}</p>
		</a>	
		</c:if>
		<c:if test="${mode eq 'detail' }">
		<a href="#" class="list-group-item" style="width:100%;">
			<span>[${line.logCate}]</span>		
			<p><span class="badge">${line.nalja}</span>@${line.cate}@-${line.msg}</p>
		</a>	
		</c:if>
	</c:forEach>
</div>
<c:if test="${more_Log}">
   <div class="text-right">
   		<a href="${goRoot}">더보기</a>
   </div>
</c:if>

