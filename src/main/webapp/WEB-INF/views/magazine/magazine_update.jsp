<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../../js/jquery-1.12.4.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../ckeditor/ckeditor.js"></script>
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../../css/main.css" rel="stylesheet">
	<title>Home</title>
<script type="text/javascript">
 $(function(){
	 $('#preview').hide();
	 
	 $('#img').on('change', function() {
	        
	        ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	        
	        //배열에 추출한 확장자가 존재하는지 체크
	        if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
	            resetFormElement($(this)); //폼 초기화
	            window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
	        } else {
	            file = $('#img').prop("files")[0];
	            blobURL = window.URL.createObjectURL(file);
	            $('#preview img').attr('src', blobURL);
	            $('#preview').slideDown(); //업로드한 이미지 미리보기
	            $('#Existing_img').hide();
	            $(this).slideUp(); //파일 양식 감춤
	        }
	    });
	 $('#preview button').bind('click', function() {
	        resetFormElement($('#img')); //전달한 양식 초기화
	        $('#img').slideDown(); //파일 양식 보여줌
	        $(this).parent().slideUp(); //미리 보기 영역 감춤
	        return false; //기본 이벤트 막음
	    });
	 
	 function resetFormElement(e) {
	        e.wrap('<form>').closest('form').get(0).reset(); 
	        //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
	        //요소를 감싸고 있는 가장 가까운 폼( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
	        //DOM에서 제공하는 초기화 메서드 reset()을 호출
	        e.unwrap(); //감싼 <form> 태그를 제거
	    } 
	 
 });
</script>
<style type="text/css">
	/* 미리보기 이미지 사이즈 */
	#control_img { /* div에 주는것도 좋은 방법임. */
		width: 200px;
		height: 200px;
	}

</style>
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
        	<!-- 내용 입력 시작-->
            <!-- Magazine update-page 입니다. -->
            <form method="post"  action="/reset/admin/magazine/${detail.mag_no}/update" enctype="multipart/form-data" id="magazine_updateForm">
           		<!-- <input type="hidden" name="_method" value="put"/> -->
	            <div>
	            	<label for="mag_no"></label>
	            	<input type="text" name="mag_no" id="mag_no" value="${detail.mag_no }" >
	            </div>
	            <div>
	            	<label for="img">대표이미지</label>
	            	<div name="Existing_img" id="Existing_img"><img src="..${detail.img}"></div>
	            	<input type="file" name="img" id="img">
            	</div>
            	<div id="preview">
            		<img src="#" id="control_img">
            		<button type="button">대표이미지 삭제</button>
            	</div>
	            <div>
	            	<label for="title">제목</label>
	            	<input type="text" name="title" id="title" value="${detail.title }" >
	            </div>
	            <div>
	            	<label for="con">내용</label>
			        <textarea name="con" id="con" >${detail.con }</textarea>
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
            		<label for="cate">카테고리</label>
            		<select name="cate" id="cate">
            			<option value=1 <c:if test="${detail.cate}==1">selected</c:if>>신상&amp;트렌드</option>
            			<option value=2 <c:if test="${detail.cate}==2">selected</c:if>>화장품 펙트체크</option>
            			<option value=3 <c:if test="${detail.cate}==3">selected</c:if>>인기템 리뷰</option>
            			<option value=4 <c:if test="${detail.cate}==4">selected</c:if>>다이어트&amp;운동</option>
            		</select>
            	</div>
	            <div>
	            	<label for="tags">해시태그</label>
	            	<input type="text" name="tags" id="tags" value="${detail.tags }">
            	</div>

			<button type="reset" class="btn btn-primary">목록</button>
			<button type="submit" class="btn btn-warning" id="updateBtn">수정</button>
			</form>
			<script type="text/javascript">
	       	 $("#updateBtn").on('submit',function(event){
	       		 event.preventDefault();
	    		 var mag_no=${detail.mag_no};
	    		 console.log(eve_no);
	    		 var formData = new FormData($("#magazine_updateForm")[0]);
	    		 console.log(formData);
	    	     $.ajax({
	    	       type:'post',
	    	       enctype: 'multipart/form-data',
	    	       data : formData,
	    	       url: '/reset/admin/magazine/'+mag_no+'/update',
	    	       contentType: false,
	    	       processData: false,
	    	       dataType: "Text"
	    	    }) 
	    	    .done(function(data){
	    	       console.log("전송"); 
	    	     })
	    	    .fail(function () { // 실패했을때 불러질 함수
	    	       console.error('데이터 입력 실패');
	    	    })  
	    	 });
            
            </script>
            <!-- 내용 입력 끝 -->
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