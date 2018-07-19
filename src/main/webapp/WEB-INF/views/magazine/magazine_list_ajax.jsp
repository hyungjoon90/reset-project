<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:forEach items="${alist }" var="bean">
<script src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
$(function() {
	  $(".strong").each(function(){
		  var target = $(this).text();
	  		if(target==1){
	  			$(this).text("신상&트렌드");
	  		} else if(target==2){
	  			$(this).text("화장품 펙트체크");
	  		}else if(target==3){
	  			$(this).text("인기템 리뷰");
	  		}else if(target==4){
	  			$(this).text("다이어트&운동");
	  		}
	  });  
	});

</script>
<div class="contentsBox" class="span6 element category01" data-category="category01">
    <div class="hover_img">
        <a href="magazine/${bean.mag_no}"><img src="/reset/${bean.img}" alt="main_img"></a>
    </div> 
    <div class="item_description">
        <h6><a href="magazine/${bean.mag_no}">${bean.title}</a></h6>
        <div><strong class="strong">${bean.cate}</strong></div>
        <div>
        	<span class="pop">
        		<img src="imgs/icon/like.png" alt="좋아요" class="icon"/>&emsp;${bean.pop }
        	</span>
        	&emsp;&emsp;&emsp;&emsp;
        	<span class="view">
         	<img src="imgs/icon/view.png" alt="조회수" class="icon"/>&emsp;${bean.view }
        	</span>
        </div>
    </div>                                    
</div>
</c:forEach>