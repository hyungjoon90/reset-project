<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="../js/jquery-1.12.4.js"></script>
<script src="../js/bootstrap.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/bootstrap-theme.min.css" rel="stylesheet">
<link href="../css/main.css" rel="stylesheet">
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
    1px solid #e5e5e5;
    .ImgBox>img{
        width: 400px;
        height: 400px;
    }
</style>
</head>
<body>
	<!--header-->
    <div class="header">
    	<div class="wrap">
            <nav class="main_menu container">
                <div class="menu_img">
                <a href="/reset/">
                    <img src="../imgs/header_logo.png">
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
                <img src="../${bean.img }">
            </div>
            <div class="InfoBox">
                <h4>${bean.name }</h4>
                <table class="table">
                    <tr>
                        <td>용량</td>
                        <td>${bean.vol }</td>
                    </tr>
                    <tr>
                        <td>판매가격</td>
                        <td>${bean.price }원</td>
                    </tr>
                    <tr>
                        <td>평점</td>
                        <td>${bean.tot }</td>
                    </tr>
                    <tr>
                        <td>${bean.brand }</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="avgBox">
            <p>점수</p>
            <p>사진</p>
            <img />
        </div>
        <div class="reviewBox">
            <img />
            <label>닉네임</label>
            <label>나이</label>/<label>복합성</label>
            <label>평점</label>/<label>날짜</label>
            <p>좋은점</p>
            <p>나쁜점</p>
        </div>
	</div>
    <!-- //main contents -->

    <!--footer-->
    <div class="footer">
        <div class="wrap">
            <div class="container">
                <div class="row">
                    <div class="footer_L">
                        <div class="foot_logo"><a href="index.html"><img src="../imgs/footer_logo.png" alt="" /></a></div>
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
