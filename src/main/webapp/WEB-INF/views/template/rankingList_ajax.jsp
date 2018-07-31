<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
    .contentsbox{
        width: 85%;
        margin: 0px auto;
        display: flex;
        padding: 5px 0px;
    }   
    .numbox{
        width: 30%;
	    margin: auto 0px;
	    font-size: 30pt;
	    text-align: right;
	    padding-right: 5%;
    }
    .imgbox{
        width: 30%;
        text-align: center;
        margin: auto 0px;
    }
    .imgbox>img{
   	    max-height: 160px;
  		max-width: 100%;
    }
    .conbox{
	    width: 40%;
	    margin: auto 0px;
	    padding-left: 5%;
	}
    }
    .conbox>p{
        margin: 6px 0px;
    }
    .conbox>p:first-child,.conbox>p:last-child{
        color: #84868e;
    }
    .rankingImg{
    	width: 60px;
    }
@media (max-width: 360px) {
	.contentsbox {
	    width: 100%;
	}
	.rankingImg {
	    width: 45px;
	}
	.numbox {
   		width: 20%;
	}
	.imgbox {
	    width: 25%;
	    height: inherit;
	    margin: auto 0px;
	}
	.imgbox>img {
	    width: 68px;
	    height: 68px;
	}
	.conbox {
 	   width: 55%;
	}
}

</style>
</style>
<c:set var="num" value="1" />
	<c:forEach items="${alist }" var="bean" end="2">
	<a href="${goRoot }item/${bean.item }">
		<div class="contentsbox">
			<div class="numbox box">
				<img alt="rankingImg" src="${goRoot }imgs/icon/crown_${num}.png" class="rankingImg"><c:set var="num" value="${num+1}"  /> 
			</div>
			<div class="imgbox box">
				<img src="${bean.img }">
			</div>
			<div class="conbox box">
				<p>${bean.brand }</p>
				<p>${bean.name }</p>
				<p>${bean.vol }&nbsp;${bean.price }원</p>
			</div>
		</div>
	</a>
	</c:forEach>