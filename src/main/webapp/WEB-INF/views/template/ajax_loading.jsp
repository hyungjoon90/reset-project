<script>
$(function(){
	$(document).ajaxStart(function() {$('.wrap-loading').removeClass('display-none');});
	$(document).ajaxStop(function() {$('.wrap-loading').addClass('display-none'););
});
</script>
<style type="text/css" >
.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
    position: fixed;
    left:0;	right:0; top:0; bottom:0;
    background: rgba(0,0,0,0.2); /*not in ie */
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
}
.wrap-loading div{ /*로딩 이미지*/
	position: fixed;
	top:50%; left:50%;
	margin-left: -21px;
	margin-top: -21px;
}
.display-none{ /*감추기*/
	display:none;
}
</style>
<div class="wrap-loading display-none">
	<div><img src="${goRoot }img/loading1.gif" /></div>
</div>  
