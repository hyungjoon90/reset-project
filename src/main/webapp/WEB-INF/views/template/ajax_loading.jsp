<script>
$(function(){
	$(document).ajaxStart(function() {$('.wrap-loading').removeClass('display-none');});
	$(document).ajaxStop(function() {$('.wrap-loading').addClass('display-none'););
});
</script>
<style type="text/css" >
.wrap-loading{
    position: fixed;
    left:0;	right:0; top:0; bottom:0;
    background: rgba(0,0,0,0.2); 
    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');
}
.wrap-loading div{ 
	position: fixed;
	top:50%; left:50%;
	margin-left: -21px;
	margin-top: -21px;
}
.display-none{
	display:none;
}
</style>
<div class="wrap-loading display-none">
	<div><img src="${goRoot }img/loading1.gif" /></div>
</div>  
