<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css" >
#fix_div {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
}

.alert{
	padding: 0px;
}
.danger{
    background-color: #D00B01 !important;
    opacity: 0.5;
}
.danger-text{
	font-family: NanumSquareB;
	font-size: 15px;
	color: white;
	text-align: center;
	display: block;
}
.close{
	color: white;
    opacity: 1;
}
</style>
<div id="fix_div">
	<div class="alert danger" role="alert">
	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  	<span aria-hidden="true">&times;</span>
	</button><span class="danger-text">본사이트는 교육용으로 제작되었습니다.</span></div>

</div>
