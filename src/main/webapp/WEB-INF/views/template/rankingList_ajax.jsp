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
        width: 20%;
        margin: auto 0px;
        font-size: 30pt;
        text-align: center;
    }
    .imgbox{
        width: 30%;
        text-align: center;
        height: 160.5px;
    }
    .imgbox>img{
    	width: 160px;
    	height: 160px;
    }
    .conbox{
        width: 50%;
        margin: auto 0px;
    }
    .conbox>p{
        margin: 6px 0px;
    }
    .conbox>p:first-child,.conbox>p:last-child{
        /* color: #84868e; */
    }
    .rankingImg{
    	width: 60px;
    }
    .rankingBrand{
    	font-family: NanumSquareEB;
    	font-size: 23px;
    	color: #2e2e2e;
    }
    .rankingvol,.rankingPrice{
    	font-family: NanumSquareB;
    	font-size: 18px;
    	margin-right: 20px;
    	color: #2e2e2e;
    }
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
				<p class="rankingBrand rankingP">${bean.brand }</p>
				<p class="rankingName rankingP">${bean.name }</p>
				<p><span class="rankingvol rankingP">${bean.vol }</span>&nbsp;<span class="rankingPrice rankingP">${bean.price }원</span></p>
			</div>
		</div>
	</a>
	</c:forEach>