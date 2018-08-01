<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/template/head.jsp"%>
<style type="text/css">
	.page_container{
		font-family: NanumSquareR;
	}
	//리뷰
	.reviewBox {
		width: 95%;
		border: 1px solid #e5e5e5;
		margin: 0px auto;
		clear: both;
	}
	/* reviewBox 위치 */
	.left_img_box {
		width: 25%;
		display: inline-block;
		float: left;
		text-align: center;
		margin: 6px 0px;
	}
	.left_img_box>img{
		max-width: 100%;
	}
	.right_content_box {
		width: 75%;
		float: right;
	}
	
	.right_content_box p {
		margin: 0px;
		display: inline-block;
	}
	
	.rightBox>label>img {
		width: 15px;
	}
	
	.emptyImg {
		width: 133px;
		margin: 24px 0px;
	}
	
	.right_content_top {
		float: right;
	}
	
	.right_content_bottom {
		margin-top: 5px;
	}
	
	.sub-title {
		color: #84868e;
	}
	
	.star {
		width: 80px;
	}
	
	.starRating1 {
		display: inline-block;
		overflow: hidden;
		width: 16px;
		margin: 0px 0px -3px 0px;
	}
	
	.starRating2 {
		display: inline-block;
		overflow: hidden;
		width: 32px;
		margin: 0px 0px -3px 0px;
	}
	
	.starRating3 {
		display: inline-block;
		overflow: hidden;
		width: 48x;
		margin: 0px 0px -3px 0px;
	}
	
	.starRating4 {
		display: inline-block;
		overflow: hidden;
		width: 64px;
		margin: 0px 0px -3px 0px;
	}
	
	.starRating5 {
		display: inline-block;
		overflow: hidden;
		width: 80px;
		margin: 0px 0px -3px 0px;
	}
	/* reviewBox 위치 */
	.subicon{
		width: 40px;
	}
	.col-md-6{
		font-family: NanumSquareB;
		font-size: 18px;
		margin: 20px auto;
	}
	.subSpan{
		margin-left: 30px;
	}
	.nickSpan{
		font-family: NanumSquareEB;
		font-size: 24px;
	}
	
	/* 댓글 스타일 */
	.com_div{
		display: inline-block;
		margin-bottom: 10px;
	}
	
	.com_nalja{
		float: right;
	}
	.com_hr{
		width: 100%;
		margin-bottom: 1%;
	}
	.comBtn{
		margin-left: 90%;
	}
	.box-footer{
		text-align: right;
	}
	.mypage_title_div{
		font-family: NanumSquareB;
		font-size: 25px;
	}
</style>
<script type="text/javascript">
	  $(function(){
		 cartList();
      });
	 
	  function cartList(){
		  	var email="${login_email}";
			var Data= {"email":email};
			$.ajax({
			        type: 'POST', // get 방식으로 요청
					dataType: 'text',
					url: "${goRoot}item/cart", // 데이터를 불러오는 json-server 주소입니다 .
					data: Data,
					success:function(result){
						$("#cart").html(result);
					}
			})
			.fail(function () { // 실패했을때 불러질 함수
				console.error('데이터 불러오기 실패');
			})
		};
	
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/template/menu.jsp"%>

	<!-- main contents -->
	<div class="page_container">

		<div class="mypage_title_div">회원정보</div>
		<div id="info">
			<div class="row well">
				<div class="col-md-6">
					<span>
						<c:choose>
							<c:when test="${bean.gender=='남성'}">
								<img alt="male" src="${goRoot }imgs/icon/male.png" class="subicon">
							</c:when>
							<c:otherwise>
								<img alt="female" src="${goRoot }imgs/icon/female.png" class="subicon">
							</c:otherwise>
						</c:choose>
					</span>
					<span class="subSpan nickSpan">
						${bean.nick } &nbsp; &nbsp;
					</span>
					<span>
						${bean.age } &#47; ${bean.skin }
					</span>
				</div>
				<div class="col-md-6">
					<span>
						<img alt="email" src="${goRoot }imgs/icon/email.png" class="subicon">
					</span>
					<span class="subSpan">
						${bean.email }
					</span>
				</div>
				<div class="col-md-6">
					<span>
						<img alt="phone" src="${goRoot }imgs/icon/smartphone.png" class="subicon">
					</span>
					<span class="subSpan">
						${bean.phone }
					</span>
				</div>
				<div class="col-md-6">
					<span>
						<c:choose>
							<c:when test="${bean.exp <= 100}">
								<img alt="new" src="${goRoot }imgs/icon/medal_new.png" class="subicon">		
							</c:when>
							<c:when test="${bean.exp > 100 && bean.exp <= 300}">
								<img alt="new" src="${goRoot }imgs/icon/medal_gold.png" class="subicon">	
							</c:when>
							<c:when test="${bean.exp >300 && bean.exp <= 600}">
								<img alt="new" src="${goRoot }imgs/icon/medal_vip.png" class="subicon">	
							</c:when>
							<c:otherwise>
								<img alt="new" src="${goRoot }imgs/icon/medal_vvip.png" class="subicon">
							</c:otherwise>
						</c:choose>
					</span>
					<span class="subSpan">
						${bean.exp }
					</span>
				</div>
			</div>
		</div>

		<div class="mypage_title_div">찜목록</div>
		
		<div class="row well">
			<div id="cart" class="col-md-12"></div>
		</div>
		
		<div class="mypage_title_div">리뷰</div>
		
		<div class="row well">
		<div id="review" class="col-md-12">
			<c:choose>
				<c:when test="${review_alist == '[]'}">
				</c:when>
				<c:when test="${review_alist != '[]'}">
					<c:forEach items="${review_alist }" var="review">
						<a href="${goRoot }item/${review.item }/review/${review.rev_no}">
							<div class="reviewBox">
								<div class="left_img_box">
									<c:choose>
										<c:when test="${review.img != ''}">
											<img src="${goRoot}${review.img}" />
										</c:when>
										<c:when test="${review.img == ''}">
											<img class="emptyImg" src="${goRoot}imgs/thany.png" />
										</c:when>
									</c:choose>
								</div>
								<div class="right_content_box">
									<div class="right_content_top">
										<span class="rightBox"> <label> <img
												src="${goRoot}imgs/icon/like.png"> ${review.pop }
										</label> <label>/ ${review.nalja }</label>
										</span>
									</div>
									<div class="right_content_bottom">
										<p>${review.writer }<br> <span class="sub-title">${review.age }세
												/ ${review.skin } / ${review.gender } / </span>
										</p>
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
										<br> <br>
										<p>${review.good }</p>
										<br>
										<p>${review.bad }</p>
									</div>
								</div>
							</div>
						</a>
						<img src="${goRoot }imgs/welcome_bg.png">
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		</div>
		<div class="mypage_title_div">댓글</div>
		<div class="row well">
		<div id="comment" class="col-md-12">
			<c:choose>
				<c:when test="${comment_alist == '[]'}">
				</c:when>
				<c:when test="${comment_alist != '[]'}">
					<c:forEach items="${comment_alist }" var="bean">
					<div class='commentLi'>
						<hr class='com_hr'/>
						<div class='com_writer com_div'><strong>${bean.writer }</strong></div>
						<div class='com_nalja com_div'>${bean.nalja }</div>
						<div class='textCo'>${bean.content }</div>
					</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		</div>
	</div>
	<!-- //main contents -->


	<%@include file="/WEB-INF/views/template/footer.jsp"%>
</body>
</html>
