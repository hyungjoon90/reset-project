<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:forEach items="${alist }" var="bean">
           <div class="list-group">
        	<div class="row">
			  <div class="col-sm-6 col-md-4">
			    <div class="thumbnail">
			      <a href="magazine/${bean.mag_no}"><img src="${bean.img}" alt="main_img"></a>
			      <div class="caption">
			        <a href="magazine/${bean.mag_no}"><h3>${bean.title}</h3></a>
			        <p><img src="#" alt="카테고리" class="cate"/>${bean.cate }</p>
			        <p><img src="#" alt="좋아요" class="pop"/>${bean.pop }<img src="#" alt="조회수" class="view"/>${bean.view }</p>
			      </div>
			    </div>
			  </div>
			</div>
           </div>
</c:forEach>