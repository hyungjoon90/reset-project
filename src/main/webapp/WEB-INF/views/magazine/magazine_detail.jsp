<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${goRoot}js/jquery-1.12.4.js"></script>
<script src="${goRoot}js/bootstrap.min.js"></script>
<link href="${goRoot}css/bootstrap.min.css" rel="stylesheet">
<link href="${goRoot}css/bootstrap-theme.min.css" rel="stylesheet">
<link href="${goRoot}css/main.css" rel="stylesheet">
	<title>Home</title>
</head>
<body>
	<!--header-->
    <div class="header">
    	<div class="wrap">
            <nav class="main_menu container">
                <div class="menu_img">
                    <img src="imgs/header_logo.png">
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
                      <li class="current"><a href="index.html">홈</a></li>
                      <li><a href="about.html">랭킹</a></li>
                      <li class="top-menu"><a href="javascript:{}">화플</a>
                          <ul class="sub-menu">
                              <li><a href="scaffolding.html">Scaffolding</a></li>
                              <li><a href="typography.html">Typography</a></li>
                              <li><a href="shortcodes.html">Shortcodes</a></li>
                              <li><a href="tables.html">Tables</a></li>
                          </ul>
                      </li>
                      <li class="top-menu"><a href="javascript:{}">이벤트</a>
                           <ul class="sub-menu">
                              <li><a href="portfolio_2columns.html">2 Columns</a></li>
                              <li><a href="portfolio_3columns.html">3 Columns</a></li>
                              <li><a href="portfolio_4columns.html">4 Columns</a></li>
                          </ul>
                      </li>                                  
                      <li class="top-menu"><a href="javascript:{}">리뷰</a>
                           <ul class="sub-menu">
                              <li><a href="blog.html">Blog with right sidebar</a></li>
                              <li><a href="blog_post.html">Blog post</a></li>
                          </ul>
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
        <hr>
            <!-- 내용 입력 -->
            <!-- magazine detail-page 입니다. -->
            <form method="post" action="/reset/admin/magazine/${detail.mag_no}">
		            <div>${detail.mag_no }</div>
		            <div><img src="../..${detail.img }"></div>
		            <div>${detail.title }</div>
		            <div>${detail.con }</div>
		            <div>${detail.cate }</div>
		            <div>${detail.tags }</div>
		            <div>${detail.writer }</div>
		            <div>${detail.nalja }</div>
		            <div>${detail.pop }</div>
		            <div>${detail.view }</div>

			<button type="reset" class="btn btn-primary">목록</button>
			<button type="submit" class="btn btn-warning">수정</button>
			</form>
			<form method="post">
				<input type="hidden" name="_method" value="delete">
				<input type="hidden" name="img" id="img" value="${detail.img }">
				<button type="submit" class="btn btn-danger">삭제</button>
			</form>
			<!-- 내용 끝 -->
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
		   	 	<div id="comment">
				
				</div>
			</div>
			<!-- 댓글 리스트 끝 -->
        <hr>
    </div>
    <!-- //main contents -->

    <!--footer-->
    <div class="footer">
        <div class="wrap">
            <div class="container">
                <div class="row">
                    <div class="footer_L">
                        <div class="foot_logo"><a href="index.html"><img src="imgs/footer_logo.png" alt="" /></a></div>
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
	/* 댓글  */
		//아래 두개의 변수만 바꿔주면 됩니다.
		var p_no=${detail.mag_no};
		var co_type="magazine";
		
		<%//TODO url 경로 변경해야함.%>
		//댓글 리스트 받아오기.
		function getAllList(){
			$.getJSON("/reset/"+co_type+"/"+p_no+"/comment",function(data){
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
