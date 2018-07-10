<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../ckeditor/ckeditor.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
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
            <!-- add-page 입니다. -->
            <form action="/reset/event" method="post">
            	<div>
	            	<label for="img">대표이미지</label>
	            	<input type="file" name="img" id="img">
            	</div>
            	<div>
	            	<label for="title">제목</label>
	            	<input type="text" name="title" id="title">
            	</div>
            	<div>
	            	<label for="con">내용</label>
			        <textarea name="con" id="con" style="width: 700px; height: 400px;"></textarea>
			        <!-- ckeditor를 사용하여 서버로 이미지를 올리고 다시 불러오는 설정입니다. -->
			        <script>
				    $(function(){
				         
				        CKEDITOR.replace( 'con', {//해당 이름으로 된 textarea에 에디터를 적용
				            width:'100%',
				            height:'400px',
				            filebrowserImageUploadUrl: '/reset/add/img' //여기 경로로 파일을 전달하여 업로드 시킨다.
				        });
				         
				         
				        CKEDITOR.on('dialogDefinition', function( ev ){
				            var dialogName = ev.data.name;
				            var dialogDefinition = ev.data.definition;
				          
				            switch (dialogName) {
				                case 'image': //Image Properties dialog
				                    //dialogDefinition.removeContents('info');
				                    dialogDefinition.removeContents('Link');
				                    dialogDefinition.removeContents('advanced');
				                    break;
				            }
				        });
				         
				    });
				</script>
            	</div>
            	<div>
	            	<label for="tags">해시태그</label>
	            	<input type="text" name="tags" id="tags">
            	</div>
            	<div>
            		<button type="submit">등록</button>
            		<button type="reset">취소</button>
            	</div>
            </form>
			<!-- 내용 끝 -->
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

</body>
</html>
