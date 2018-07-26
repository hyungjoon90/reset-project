<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${goRoot }js/jquery-1.12.4.js"></script>
<script src="${goRoot }js/bootstrap.min.js"></script>
<link href="${goRoot }css/bootstrap.min.css" rel="stylesheet">
<link href="${goRoot }css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${goRoot }css/main.css" rel="stylesheet">
	<title>Home</title>
<style type="text/css">
    /* 전체 container */
    .page_container{
    	width: 80%;
    }
    .page_container a{
    	color: black;
    }
    .page_container a:hover{
    	text-decoration: none;
    }
    .contentsBox{
        width: 100%;
        height: 500px;
    }
    .ImgBox{
        width: 50%;
        float: left;
    }
    .ImgBox>img{
    	max-width: 100%;
    }
    .InfoBox{
        width: 50%;
        margin: 100px 0px;
        float: left;
    }
    .table{
    	border-top: 1px solid #e5e5e5;
    }
    .InfoBoxtable>tbody>tr>td{
    	border: 0px;
    }
    .ImgBox>img{
		max-height: 400px;
		margin: 0px auto;
    }
    .avgBox{
    	width: 95%;
    	margin: 0px auto;
   		border: 1px solid #e5e5e5;
    }
    .avgBox>p{
    	margin-left: 20px;
    }
    .avgBox>p:first-child{
    	font-size: 20px;
    }
   
    .avgBox>table>tbody>tr>td:first-child{
    	width: 10%;
    	text-align: center;
    	font-size: 20px;
    }
    .bar1{
    	background-image: -webkit-linear-gradient(top,#bd0026 0,#bd0026 100%);
    }
    .bar2{
    	background-image: -webkit-linear-gradient(top,#f03b20 0,#f03b20 100%);
    }
    .bar3{
    	background-image: -webkit-linear-gradient(top,#fd8d3c 0,#fd8d3c 100%);
    }
    .bar4{
    	background-image: -webkit-linear-gradient(top,#fecc5c 0,#fecc5c 100%);
    }
    .bar5{
    	background-image: -webkit-linear-gradient(top,#fee0d2 0,#fee0d2 100%); 
    }
    .reviewBox{
    	width: 95%;
    	border: 1px solid #e5e5e5;
    	margin: 0px auto;
    	clear: both;
    }
    .icon{
   	    text-align: center;
   	    margin: 5px 0px;
 	    clear: both;
    }
    .btn-color{
   		color: white;
   		background-image: -webkit-gradient(linear,left top,left bottom,from(#F5515F),to(#A1051D));
   	} 
   	.btn-position{
   	    text-align: center;
   	    margin: 5px 0px;
   	}
   	.btn-file {
	    position: relative;
	    overflow: hidden;
	}
	.btn-file input[type=file] {
	    position: absolute;
	    top: 0;
	    right: 0;
	    min-width: 100%;
	    min-height: 100%;
	    font-size: 100px;
	    text-align: right;
	    filter: alpha(opacity=0);
	    opacity: 0;
	    outline: none;
	    background: white;
	    cursor: inherit;
	    display: block;
	}
	#img_preview {
   		display:none;
	}
	.img_preview img{
		width: 400px;
	}
	
	#cart{
		margin-left:10px;
	}
	.listAddBtn{
		width:7%;
	}
	.myRedBtn {
		background-color:#dd2d25;
		-moz-border-radius:3px;
		-webkit-border-radius:3px;
		border-radius:3px;
		border:1px solid #dd2d25;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size: 15px;
	    font-weight: bold;
	    padding: 5px 8px;
		text-decoration:none;
	}
	.myRedBtn:hover {
		color:#fff;
		background-color:#d00b01; 
		
	}
	.myRedBtn:active {
		position:relative;
		top:1px;
	}
	
	/* reviewBox 위치 */
	.left_img_box{
		width: 25%;
	    display: inline-block;
	    float: left;
	    text-align: center;
	    margin: 6px 0px;
	}    
	.right_content_box{
		width: 75%;
		float: right;
	}
	.right_content_box p{
		margin: 0px;
		display: inline-block;
	}
	.rightBox>label>img{
		width: 15px;
	}
	.emptyImg{
	    width: 133px;
    	margin: 24px 0px;
	}
	.right_content_top{
		float: right;
	}
	.right_content_bottom{
		margin-top: 5px;
	}
	.sub-title{
		color: #84868e;
	}
	.star{
		width: 80px;
	}
	.starRating1{
		display: inline-block;
		overflow: hidden;
		width: 16px;
		margin: 0px 0px -3px 0px;    
	}
	.starRating2{
		display: inline-block;
		overflow: hidden;
		width: 32px;
		margin: 0px 0px -3px 0px;  
	}
	.starRating3{
		display: inline-block;
		overflow: hidden;
		width: 48x;
		margin: 0px 0px -3px 0px;  
	}
	.starRating4{
		display: inline-block;
		overflow: hidden;
		width: 64px;
		margin: 0px 0px -3px 0px;  
	}
	.starRating5{
		display: inline-block;
		overflow: hidden;
		width: 80px;
		margin: 0px 0px -3px 0px;  
	}
    /* reviewBox 위치 */
</style>
<script type="text/javascript">
<!-- TODO:[sch] 1.ajax로 리스트 크롤링 -->
var page=10;/* 해당 페이지 리스트 갯수 */
var	pageTot=${tot};/* 리스트 총 갯수 */
$(document).ready(function(){
	cartCheck(); 
	
	$("#listAdd").click(function(){
		reviewListadd();
		if(page>pageTot){
			$("#listAdd").hide();
		}
	});
	$("#cartAdd").click(function(){
		cartAdd();
	});
	$("#cartDel").click(function(){
		cartDel();
	});
	
	$('#review_write').on('shown.bs.modal', function () {
	})	 
	
	
	$("#reivewAdd").on("click",function(){
		var item=${item_bean.item};
		var formData = new FormData($('#review')[0]);
		    $.ajax({
				type:"post",
				enctype: 'multipart/form-data',
				data : formData,
				url: "/reset/item/"+item,
				contentType: false,
				processData: false,
				dataType: "text"
			}) 
			.done(function(data){
				console.log(data);
				if(data=="1"){
					window.location.href=item;
				} else if(data=="0"){
					alert("글쓰기에 실패하였습니다.");
				}
		 	})
			.fail(function () { // 실패했을때 불러질 함수
				console.error('데이터 입력 실패');
			})    
		})
		
	
});

/* 리스트 추가 버튼 클릭시 실행 */
function reviewListadd(){
	page+=5;
	var item=${item_bean.item};
	var Data= { "page": page};
	$.ajax({
	        type: 'GET', // get 방식으로 요청
			dataType: 'json', // json 타입
			url: "reviewadd?item="+item, // 데이터를 불러오는 json-server 주소입니다 .
			data: Data
	})
	.done(function(data){
 		data.forEach(function (data) { // 데이터의 갯수에 따라서 div를 추가해줬습니다
 			$('.icon').prev().after(
 					"<a href=./"+data.item+"/review/"+data.rev_no+">"+
					"<div class='reviewBox'>"+
					"<img src='${goRoot}"+data.img+"'/>"+
					"<label>"+data.writer+"&nbsp;</label>"+
					"<label>"+data.age+"</label>/"+
					"<label>"+data.skin+"</label>/"+
					"<label>"+data.gender+"</label>"+
					"<label>"+data.star+"</label>/"+
					"<label>"+data.nalja+"</label>"+
					"<p>"+data.good+"</p>"+
					"<p>"+data.bad+"</p>"+
					"<p>"+data.tip+"</p></div></a>");
		})
	})
	.fail(function () { // 실패했을때 불러질 함수
		console.error('데이터 불러오기 실패');
	})
} 
function cartCheck(){
	var item=${item_bean.item};
	//var nick=${login_email}; // TODO:[sch] 찜목록저장시 아이디 수정
	var email="cus1@naver.com";
	$.ajax({
	        type: 'GET', // get 방식으로 요청
			dataType: 'json', // json 타입
			url: "cart?item="+item+"&email="+email // 데이터를 불러오는 json-server 주소입니다 .
	})
	.done(function(data){
		if(data==1){//이미 찜하기 하였음
			console.log("1");
			$('#cartAdd').hide();
		}else if(data==0){//찜하기 안함.
			console.log("0");
			$('#cartDel').hide();	
		}
	})
	.fail(function () { // 실패했을때 불러질 함수
		console.log('실패');
	}) 
} 

function cartAdd(){
	var item=${item_bean.item};
	//var nick=${login_email};// TODO:[sch] 찜목록저장시 아이디 수정 
 	var email="cus1@naver.com";
	$.ajax({
	        type: 'GET', // get 방식으로 요청
			dataType: 'json', // json 타입
			url: "cartAdd?item="+item+"&email="+email // 데이터를 불러오는 json-server 주소입니다 .
	})
	.done(function(data){
		if(data==1){
			window.alert("찜하셨습니다.");	
			$('#cartAdd').hide();
			$('#cartDel').show();
		}else{
 			window.alert("실패하셨습니다.");
		}
	})
	.fail(function () { // 실패했을때 불러질 함수
		console.error('실패');
	})
}
function cartDel(){
	var item=${item_bean.item}; 
	//var nick=${login_email}; // TODO:[sch] 찜목록저장시 아이디 수정 
	var email="cus1@naver.com";
	$.ajax({
	        type: 'GET', // get 방식으로 요청
			dataType: 'json', // json 타입
			url: "cartDel?item="+item+"&email="+email // 데이터를 불러오는 json-server 주소입니다 .
	})
	.done(function(data){
		if(data==1){
			$('#cartAdd').show();
			$('#cartDel').hide();
			window.alert("찜하기를 취소하셨습니다.");
		}else{
 			window.alert("실패하셨습니다.");
		}
	})
	.fail(function () { // 실패했을때 불러질 함수
		console.error('실패');
	})
}

</script>
</head>
<body>
	<!--header-->
    <div class="header">
    	<div class="wrap">
            <nav class="main_menu container">
                <div class="menu_img">
                <a href="/reset/">
                    <img src="${goRoot }imgs/header_logo.png">
                    </a>
                </div>
                <div class="menu_login">
                    <form class="form-inline">
                        <div class="form-group">
                            <label class="sr-only" for="search">검색</label>
                            <input type="text" class="form-control input_box" placeholder="검색">
                        </div>
                        <button type="submit" class="btn send_btn"><span class="main_font">검색</span></button>
                        <button type="submit" class="btn send_btn"><span class="main_font">로그인</span></button>
                        <button type="submit" class="btn send_btn"><span class="main_font">회원가입</span></button>
                    </form>
                </div>
                <div class="menu_bar">
                    <ul class="nav">
                      <li class="current"><a href="/reset/">홈</a></li>
                      <li class="top-menu"><a href="/reset/">랭킹</a>
                      	<div class="space">
						  <ul class="sub-menu">
						      <li><a href="../ranking?id=1">스킨</a></li>
							  <li><a href="../ranking?id=2">로션</a></li>
							  <li><a href="../ranking?id=3">에센스</a></li>
						  </ul>
						</div>
					  </li>
                      <li><a href="#">화플</a></li>
                      <li><a href="#">이벤트</a>
                      </li>                                  
                      <li><a href="contacts.html">문의</a></li>
                    </ul>
                </div>
             </nav>                
        </div>    
    </div>
    <div class="breadcrumb">
    	<div>
   		<a href="/reset/">HOME</a>
   		<span class="slash">/</span>
   		로션
   		</div>
    </div>
    <!--//header-->    
     
    <!-- main contents -->
   <div class="page_container">
        <div class="contentsBox">
            <div class="ImgBox">
                <img src="../${item_bean.img }" class="img-responsive" alt="Responsive image">
            </div>
            <div class="InfoBox">
                <h2>${item_bean.name }</h2>
                <table class="table">
                    <tr>
                    	<td>브랜드</td>
                        <td>${item_bean.brand }</td>
                    </tr>
                    <tr>
                        <td>용량</td>
                        <td>${item_bean.vol }</td>
                    </tr>
                    <tr>
                        <td>판매가격</td>
                        <td>${item_bean.price }원</td>
                    </tr>
                    <tr>
                        <td>평점</td>
                        <td>${item_bean.tot }</td>
                    </tr>
                    <tr>
                        <td>기능성 성분</td>
                        <td>${item_bean.comp }</td>
                    </tr>
                    <tr>
                    	<td>네이버 가격정보</td>
                        <td><a href="https://search.shopping.naver.com/search/all.nhn?query=${item_bean.name}">바로가기</a></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="avgBox">
        	
            <p><span>총 ${map.total }</span>명 <span>${item_bean.tot }</span></p>
            <table class="table">
            	<tr>
         			<td>
         				<span>5점</span>
            		</td>
         			<td>
         				<div class="progress">
							<div class="progress-bar progress-bar bar1" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: ${map.five }%">
						    	${map.five }%
							</div>
						</div>
            		</td>
            	</tr>
            	<tr>
         			<td>
         				<span>4점</span>
            		</td>
         			<td>
         				<div class="progress">
						  <div class="progress-bar progress-bar bar2" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: ${map.four }%">
						    ${map.four }%
						  </div>
						</div>
            		</td>
            	</tr>
            	<tr>
         			<td>
         				<span>3점</span>
            		</td>
         			<td>
         				<div class="progress">
						  <div class="progress-bar progress-bar bar3" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: ${map.three }%">
						    ${map.three }%
						  </div>
						</div>
            		</td>
            	</tr>
            	<tr>
         			<td>
         				<span>2점</span>
            		</td>
         			<td>
						<div class="progress">
							<div class="progress-bar progress-bar bar4" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: ${map.two }%">
						    	${map.two }%
					    	</div>
						</div>
            		</td>
            	</tr>
            	<tr>
         			<td>
         				<span>1점</span>
            		</td>
         			<td>
						<div class="progress">
						  <div class="progress-bar progress-bar bar5" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: ${map.one }%">
						    ${map.one }%
						  </div>
						</div>
            		</td>
            	</tr>
            </table>
			
        </div>
        
        <div class="btn-position">
	        <!-- Button trigger modal -->
			<button type="button" class="btn btn-lg myRedBtn" data-toggle="modal" data-target="#review_write">
			  글쓰기
			</button>
			<button type="button" class="btn btn-lg myRedBtn" id="cartAdd" >
			  찜하기
			</button>
			<button type="button" class="btn btn-lg myRedBtn" id="cartDel" >
			  찜취소
			</button>
		</div>
        <c:forEach items="${review_bean }" var="review">
        <a href="./${item_bean.item }/review/${review.rev_no}">
       	<div class="reviewBox">
       		<div class="left_img_box">
       			<c:choose>
					<c:when test="${review.img != ''}">
						<img src="${goRoot}${review.img}"/>
					</c:when>
					<c:when test="${review.img == ''}">
						<img class="emptyImg" src="${goRoot}imgs/thany.png"/>
					</c:when>
				</c:choose>
       		</div>
       		<div class="right_content_box">
       			<div class="right_content_top">
       				<span class="rightBox">
		                <label><img src="${goRoot}imgs/icon/like.png"> ${review.pop }</label>
		                <label>/ ${review.nalja }</label>
		            </span>
       			</div>
       			<div class="right_content_bottom">
       				<p>${review.writer }<br>
       				<span class="sub-title">${review.age }세 / ${review.skin } / ${review.gender } / </span></p>
       				<c:choose>
       					<c:when test="${review.star == 1}">
       						<div class="starRating1">
       						<img class="star" src="${goRoot}imgs/icon/grade_img.png">
       						</div>
       					</c:when>
       					<c:when test="${review.star == 2}">
       						<div class="starRating2">
       						<img class="star" src="${goRoot}imgs/icon/grade_img.png">
       						</div>
       					</c:when>
       					<c:when test="${review.star == 3}">
       						<div class="starRating3">
       						<img class="star" src="${goRoot}imgs/icon/grade_img.png">
       						</div>
       					</c:when>
       					<c:when test="${review.star == 4}">
       						<div class="starRating4">
       						<img class="star" src="${goRoot}imgs/icon/grade_img.png">
       						</div>
       					</c:when>
       					<c:when test="${review.star == 5}">
       						<div class="starRating5">
       						<img class="star" src="${goRoot}imgs/icon/grade_img.png">
       						</div>
       					</c:when>
       				</c:choose>
       				<br><br>
		           	<p>${review.good }</p><br>
		           	<p>${review.bad }</p>
       			</div>
       		</div>
        </div>
        </a>
        </c:forEach>
        <div id="listAdd" class="icon">
			<img class="listAddBtn" src="${goRoot}imgs/icon/grey-bottom.png" onmouseover="this.src='${goRoot}imgs/icon/red-bottom.png'" onmouseout="this.src='${goRoot}imgs/icon/grey-bottom.png'">
        </div>
	</div>
    <!-- //main contents -->
    
		<!-- Modal -->
		<div class="modal fade" id="review_write" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">리뷰 쓰기</h4>
		      </div>
		      <div class="modal-body">
		      <form id="review" action="/reset/item/${item_bean.item}" name="review" method="post" enctype="multipart/form-data">
			    <input type="hidden" name="writer" value="닉넴1"/>
		      	<label>좋은점</label>
		        <textarea class="form-control" rows="3" name="good" id="good"></textarea>
		      	<label>나쁜점</label>
		        <textarea class="form-control" rows="3" name="bad" id="bad"></textarea>
		      	<label>꿀팁</label>
		        <textarea class="form-control" rows="3" name="tip" id="tip"></textarea>
		        
		       
				<label class="radio-inline" for="star">1</label>점
   				<input type="radio" name="star" value="1"/> 
				<label class="radio-inline" for="star">2</label>점
				<input type="radio" name="star" value="2"/> 
				<label class="radio-inline" for="star">3</label>점
				<input type="radio" name="star" value="3"/>
				<label class="radio-inline" for="star">4</label>점
				<input type="radio" name="star" value="4"/>
				<label class="radio-inline" for="star">5</label>점
				<input type="radio" name="star" value="5"/><br>
			   
				<label for="img">이미지 업로드</label>
		        <input type="file" name="img" id="img" />
			    </form>
			    
			    <div id="img_preview">
			        <img src="#" />
			        <br />
			        <a href="#">Remove</a>
			    </div>
			  
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="close" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button type="button" id="reivewAdd" class="btn btn-primary">글쓰기</button>
		      </div>
		    </div>
		  </div>
		</div>
    <!-- //modal -->

    <!--footer-->
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    <%@include file="/WEB-INF/views/template/ajax_loading.jsp"%>
    <!--//footer-->   
    
    <script type="text/javascript">

    $('#img').on('change', function() {
        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
        
        //배열에 추출한 확장자가 존재하는지 체크
        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
            resetFormElement($(this)); //폼 초기화
            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
        } else {
            file = $('#img').prop("files")[0];
            blobURL = window.URL.createObjectURL(file);
            $('#img_preview img').attr('src', blobURL);
            $('#img_preview img').css('width', '400px');
            $('#img_preview').slideDown(); //업로드한 이미지 미리보기 
            $(this).slideUp(); //파일 양식 감춤
        }
    });

    $('#img_preview a').bind('click', function() {
        resetFormElement($('#img')); //전달한 양식 초기화
        $('#img').slideDown(); //파일 양식 보여줌
        $(this).parent().slideUp(); //미리 보기 영역 감춤
        return false; //기본 이벤트 막음
    });
    $('#close').bind('click', function() {
        resetFormElement($('#img')); //전달한 양식 초기화
        resetFormElement($('#review')); //전달한 양식 초기화
        $('#img').slideDown(); //파일 양식 보여줌
        $('#img_preview').slideUp(); //미리 보기 영역 감춤
    });

    /** 
    * 폼요소 초기화 
    */
    function resetFormElement(e) {
        e.wrap('<form>').closest('form').get(0).reset(); 
        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
        //DOM에서 제공하는 초기화 메서드 reset()을 호출
        e.unwrap(); //감싼 <form> 태그를 제거
    }
        	
    </script> 
</body>
</html>