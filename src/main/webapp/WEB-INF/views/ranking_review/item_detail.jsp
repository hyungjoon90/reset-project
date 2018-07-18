<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
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
        border: 1px solid rgb(217, 222, 232);
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
    
    .ImgBox>img{
		max-height: 400px;
		margin: 0px auto;
    }
    .avgBox{
    	width: 95%;
    	margin: 0px auto;
   		border: 1px solid #e5e5e5;
    }
    .avgBox>table>tbody>tr>td:first-child{
    	width: 10%;
    	text-align: center;
    }
    .bar1{
    	background-image: -webkit-linear-gradient(top,#FDEB71 0,#F8D800 100%);
    }
    .bar2{
    	background-image: -webkit-linear-gradient(top,#ABDCFF 0,#0396FF 100%);
    }
    .bar3{
    	background-image: -webkit-linear-gradient(top,#FEB692 0,#EA5455 100%);
    }
    .bar4{
    	background-image: -webkit-linear-gradient(top,#CE9FFC 0,#7367F0 100%);
    }
    .bar5{
    	background-image: -webkit-linear-gradient(top,#90F7EC 0,#32CCBC 100%);
    }
    .reviewBox{
    	width: 95%;
    	border: 1px solid #e5e5e5;
    	margin: 0px auto;
    }
    .icon{
   	    text-align: center;
   	    margin: 5px 0px;
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
</style>
<script type="text/javascript">

var page=10;
var	pageTot=${tot};
$(document).ready(function(){
	$("#listAdd").click(function(){
		reviewListadd();
		if(page>pageTot){
			$("#listAdd").hide();
		}
	});
	$("#cart").click(function(){
	});
	
	$('#review_write').on('shown.bs.modal', function () {
	})	
	
	
	$("#reivewAdd").on("click",function(){
		    var item=${item_bean.item};
            var formData = new FormData($('#review')[0]);
		    console.log(formData);
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
		
		$('.reviewBox img').css("src");
	
});
	
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
function cart(){
	var item=${item_bean.item};
	/* var nick=${login_email}}; */
	var email="cus1@naver.com";
	$.ajax({
	        type: 'GET', // get 방식으로 요청
			dataType: 'json', // json 타입
			url: "cartAdd?item="+item+"&email="+email, // 데이터를 불러오는 json-server 주소입니다 .
	})
	.done(function(data){
		if(data==3){
			window.alert("이미 찜하셨습니다.");	
		}else{
 			window.alert("찜하셨습니다.");
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
    <!--//header-->    
     
    <!-- main contents -->
   <div class="page_container">
        <div class="contentsBox">
            <div class="ImgBox">
                <img src="../${item_bean.img }" class="img-responsive" alt="Responsive image">
            </div>
            <div class="InfoBox">
                <h4>${item_bean.name }</h4>
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
        	
            <p>점수 총 <span>${map.total }</span>명 <span>${item_bean.tot }</span>점</p>
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
			<button type="button" class="btn btn-lg btn-color" data-toggle="modal" data-target="#review_write">
			  글쓰기
			</button>
			<button type="button" class="btn btn-lg btn-color" id="cart" >
			  찜하기
			</button>
		</div>
        <c:forEach items="${review_bean }" var="review">
        <a href="./${item_bean.item }/review/${review.rev_no}">
        <div class="reviewBox">
	    	<c:choose>
				<c:when test="${review.img != ''}">
					<img src="${goRoot}${review.img }"/>
				</c:when>
			</c:choose>
            <label>${review.writer }</label>
            <label>${review.age }</label>/<label>${review.skin }</label>/<label>${review.gender }</label>/
            <label>${review.star }점</label>/<label>${review.nalja }</label>
            <p>${review.good }</p>
            <p>${review.bad }</p>
            <p>${review.tip }</p>
            <p>${review.pop }</p>
        </div>
        </a>
        </c:forEach>
        <div id="listAdd" class="icon">
	        <button type="button" class="btn btn-default btn-lg">
	        	<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
	        </button>
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
    <div class="footer">
        <div class="wrap">
            <div class="container">
                <div class="row">
                    <div class="footer_L">
                        <div class="foot_logo"><a href="index.html"><img src="${goRoot }imgs/footer_logo.png" alt="" /></a></div>
                        <div class="copyright">&copy; 2020 Jessica White. Professional Fashion Photography. All Rights Reserved.</div>                        
                    </div>
                    <div class="footer_R">
                        <div class="fright">
                            <form action="#" method="post">
                                <input class="inp_search" name="name" type="text" value="   Search the Site" onfocus="if (this.value == 'Search the Site') this.value = '';" onblur="if (this.value == '') this.value = 'Search the Site';" />
                            </form>
                        </div>
                        <div class="footer_menu">
                            <ul class="nav">
                                <li><a href="index.html" class="current">홈</a></li>
                                <li><a href="about.html">랭킹</a></li>
                                <li><a href="scaffolding.html">화플</a></li>
                                <li><a href="portfolio_2columns.html">이벤트</a></li>
                                <li><a href="blog.html">리뷰</a></li>
                                <li><a href="contacts.html">문의</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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