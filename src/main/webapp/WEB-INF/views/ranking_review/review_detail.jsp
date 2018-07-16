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
    .reviewBox img{
    	width: 100%;
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
	#img_preview img{
		width: 100%;
	}
</style>
<script type="text/javascript">

$(document).ready(function(){
	var option=1;
	$('#review_update').on('shown.bs.modal', function () {
	})	
	 
	$("#reivewUpdate").on("click",function(){
		    var item=${review_bean.item};
		    var rev_no=${review_bean.rev_no };
		    var preview_img=$('#img_preview img').first().attr("src");
		    if(preview_img==""){
		    	console.log("null");
		    	$('#option').attr("value","3");
		    }else{
		    	console.log("null아님");
		    }
            var formData = new FormData($('#review')[0]);
		    console.log(formData);
		    $.ajax({
				type:"post",
				enctype: 'multipart/form-data',
				data : formData,
				url: "/reset/item/"+item+"/review/"+rev_no,
				contentType: false,
				processData: false,
				dataType: "text"
			}) 
			.done(function(data){
				console.log(data);
				if(data=="1"){
					console.log("성공");
					window.location.href="/reset/item/"+item+"/review/"+rev_no;
				} else if(data=="0"){
					alert("글수정에 실패하였습니다.");
				}
		 	})
			.fail(function () { // 실패했을때 불러질 함수
				console.error('데이터 수정 실패');
			})     
		})
		$("#reivewDelete").on("click",function(){
			var item=${item_bean.item};
		    var rev_no=${review_bean.rev_no };
			var formData = new FormData($('#review')[0]);
			$.ajax({
				type:"delete",
				enctype: 'multipart/form-data',
				data : formData,
				url: "/reset/item/"+item+"/review/"+rev_no,
				contentType: false,
				processData: false,
				dataType: "text"
			}) 
			.done(function(data){
				console.log(data);
				if(data=="1"){
					console.log("성공");
					window.location.href="/reset/item/"+item;
				} else if(data=="0"){
					alert("글삭제에 실패하였습니다.");
				}
		 	})
			.fail(function () { // 실패했을때 불러질 함수
				console.error('데이터 삭제 실패');
			}) 
		})
});
	
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
						      <li><a href="${goRoot}ranking?id=1">스킨</a></li>
							  <li><a href="${goRoot}ranking?id=2">로션</a></li>
							  <li><a href="${goRoot}ranking?id=3">에센스</a></li>
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
			<button type="button" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#review_update" >
			  수정
			</button>
			<button type="button" class="btn btn-lg btn-color" data-toggle="modal" data-target="#review_delete" >
			  삭제
			</button>
		</div>
		
       <div class="reviewBox">
      		<c:choose>
				<c:when test="${review_bean.img != ''}">
            		<img src="${goRoot}${review_bean.img }"/>
				</c:when>
			</c:choose>
            <label>${review_bean.writer }</label>
            <label>${review_bean.age }</label>/<label>${review_bean.skin }</label>/<label>${review_bean.gender }</label>/
            <label>${review_bean.star }점</label>/<label>${review_bean.nalja }</label>
            <p>${review_bean.good }</p>
            <p>${review_bean.bad }</p>
            <p>${review_bean.tip }</p>
            <p>${review_bean.pop }</p>
        </div>
        <div class="icon">
	        <button type="button" class="btn btn-default btn-lg">
	        	<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
	        </button>
        </div>
        
        <!-- 댓글입력(comment) 시작 -->
			<div>
				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title">ADD NEW Comment</h3>
					</div>
					<div class="box-body">
						<label for="writer">writer</label>
						<input class="form-control" type="text" name="writer" id="writer">
						<label for="content">content</label>
						<input class="form-control" type="text" name="content" id="content">
						
						<!-- 고정값 및 임의값 -->
						<input type="text" name="email" id="email" value="test@gmail.com">
					</div>
					<div class="box-footer">
						<button type="submit" class="btn btn-primary" id="comment_addBtn">add comment</button>
					</div>
				</div>
			</div>
			<!-- 댓글입력 끝 -->
			<!-- MOD 버튼 클릭시 모달 시작 -->
			<div id="modDiv" style="display : none;">
				<div class="modal-title">
					<input type="hidden" id="commentnum" >
					댓글 수정
				</div>
				<div>
					<input type="text" id="commenttext">
				</div>
				<div>
					<button type="button" id="commentModBtn">수정</button>
					<button type="button" id="commentDelBtn">삭제</button>
					<button type="button" id="closeBtn">닫기</button>
				</div>
			</div>
			<!-- MOD 버튼 클릭시 모달 끝 -->
			<!-- 댓글 리스트 시작 -->
			<div>
				<ul class="timeline">
					<li class="time-label" id="comment_div"><span class="bg-green">Comment List</span></li>
				</ul>
				<%-- <c:forEach items="${comment }" var="com">
					<div>
						<hr/>
						<div id="writer_${co_no}">${com.writer }</div>
						<div id="conetent_${co_no}">${com.content }</div>
						<div id="nalja_${co_no}">${com.nalja }</div>
						<div>
							<button>MOD</button>
						</div>
					</div>
				</c:forEach> --%>
		   	 	<div id="comment">
				
				</div>
			</div>
			<!-- 댓글 리스트 끝 -->
        
	</div>
    <!-- //main contents -->
    
    		<!-- Modal -->
		<div class="modal fade" id="review_update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">리뷰 수정</h4>
		      </div>
		      <div class="modal-body">
		      <form id="review" action="/reset/item/${item_bean.item}" name="review" enctype="multipart/form-data">
	        	<input type="hidden" id="option" name="option" value="1"/>
	        	<input type="hidden" id="rev_no" name="rev_no" value="${review_bean.rev_no}"/>
	        	<input type="hidden" id="preimg" name="preimg" value="${review_bean.img }"/>
			    <input type="hidden" name="writer" value="${review_bean.writer }"/>
			    <input type="hidden" name="pop" value="${review_bean.pop }"/>
			    
		      	<label>좋은점</label>
		        <textarea class="form-control" rows="3" name="good" id="good">${review_bean.good }</textarea>
		      	<label>나쁜점</label>
		        <textarea class="form-control" rows="3" name="bad" id="bad">${review_bean.bad }</textarea>
		      	<label>꿀팁</label>
		        <textarea class="form-control" rows="3" name="tip" id="tip">${review_bean.tip }</textarea>
		        
		       
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
			    
				<c:choose>
					<c:when test="${review_bean.img != ''}">
						<div id="img_preview">
							<img src="${goRoot}${review_bean.img }"/>
							<a href="${goRoot}${review_bean.img }">Remove</a>
						</div>
					</c:when>
					<c:when test="${review_bean.img == ''}">
						<div id="img_preview" style="display:none;">
							<img src=""/>
							<a href="">Remove</a>
						</div>
					</c:when>
				</c:choose>
				<br />
			  
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="close" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button type="button" id="reivewUpdate" class="btn btn-primary">글쓰기</button>
		      </div>
		    </div>
		  </div>
		</div>
    <!-- //modal -->
    <div class="modal fade" id="review_delete" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">리뷰 삭제</h4>
	      </div>
	      <div class="modal-body">
	        <p>리뷰를 삭제하시겠습니까?&hellip;</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-danger" id="reivewDelete">리뷰 삭제</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

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
            $('#option').attr('value',2);
        }
    });

    $('#img_preview a').bind('click', function() {
        resetFormElement($('#img')); //전달한 양식 초기화
        $(this).parent().slideUp(100); //미리 보기 영역 감춤
        $('#img').slideDown(100); //파일 양식 보여줌
        $('#option').attr('value',3);
        return false; //기본 이벤트 막음
    });
    $('#close').bind('click', function() {
        resetFormElement($('#review')); //전달한 양식 초기화
        $('#option').attr('value',1);
    	$('#img_preview').css('display','');
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
        $('#img_preview img').attr("src","${goRoot}${review_bean.img }");
        $('#img_preview img').css('width', '100%');
        $('#img_preview a').attr("href","${goRoot}${review_bean.img }");
        
    }
    
    /* 댓글  */
	var p_no=${review_bean.rev_no };
	var co_type="review";
	
	<%//TODO url 경로 변경해야함.%>
	//댓글 리스트 받아오기.
	function getAllList(){
		$.getJSON('/reset/'+co_type+"/"+p_no+"/comment",function(data){
			var str="";
			
		$(data).each(
			function(){
			str+=
				"<div class='commentLi'>"
				+"<div>"+this.writer+"</div>"
				+"<div data-co_no='"+this.co_no+"' class='textCo'>"+this.content+"</div>"
				+"<div>"+this.nalja+"</div>"
				+"<div><button class='comBtn'>MOD</button></div>"
				+"</div>";
		});
		
		$("#comment").html(str);
		
		});
	};//getAllList end
	
	$(function(){
		getAllList();
	}); // 최초로드 end
 
	//댓글 추가 버튼
	$("#comment_addBtn").on("click",function(){
		var writer =$("#writer").val();
		var content =$("#content").val();
		var email =$("#email").val();
		<%//TODO url 경로 변경해야함.%>
		$.ajax({
			type:'post',
			url: '/reset/'+co_type+'/'+p_no+'/'+'comment/add',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method_Override" : "POST"		
			},
			dataType:'text',
			data : JSON.stringify({
				writer : writer,
				email : email,
				content : content,
				co_type : co_type,
				p_no : p_no
			}),
			success : function(result){
				if(result == 'SUCCESS'){
					alert("등록 되었습니다.");
					getAllList();
				}
			}
		});
	}); //comment add end

	//MOD버튼 클릭시 모달이 나옴.
	$("#comment").on("click",".commentLi button",function(){
		var comment=$(this).parent().parent().find(".textCo");
		var co_no = comment.attr("data-co_no");
		
		var replytext=comment.text();
		$("#commentnum").val(co_no);
		$("#commenttext").val(replytext);
		$("#modDiv").show("slow");
	});
	
	//댓글 수정 버튼 클릭시
	$("#commentModBtn").on("click",function(){
		var co_no=$("#commentnum").val();
		var content=$("#commenttext").val();
		$.ajax({
			type: 'put',
			url:'/reset/'+co_type+'/'+p_no+'/comment/'+co_no,
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data:JSON.stringify({content:content}),
			dataType:'text',
			success:function(result){
				console.log("result:"+result);
				if(result=='SUCCESS'){
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});
	
	//댓글 삭제 버튼 클릭시
	$("#commentDelBtn").on("click",function(){
		var co_no=$("#commentnum").val();
		$.ajax({
			type: 'delete',
			url: '/reset/'+co_type+'/'+p_no+'/comment/'+co_no,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result){
				console.log("result:"+result);
				if(result=='SUCCESS'){
					alert("삭제되었습니다");
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});	
</script> 
</body>
</html>