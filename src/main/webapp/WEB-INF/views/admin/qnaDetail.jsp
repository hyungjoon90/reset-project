<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../../js/jquery-1.12.4.js"></script>
<script type="text/javascript">


$(document).ready(function() {
	var answerSave = $('#answerSave'); // 답변저장
	var answerWrite = $('#answerWrite'); //답변작성하기
	var answer = $('#answer'); //답변 input
	var answerCancel = $('#answerCancel'); //디테일로 돌아가는 취소창
	var mailSend = $('#mailSend');
	var target = $('#target');
	
	answer.hide(); // 답변 input hide
	answerSave.hide(); // 답변 저장 hide
	answerCancel.hide();
	answerWrite.show(); //답변 작성하기 보여줌
	/* answerWrite.prop( "disabled", false );*/// 답변하기 disable
	mailSend.hide();
	
	answerWrite.click(function() {
		answerWrite.hide();
		answerSave.show();
		answerCancel.show();
		answer.show();
		if (target.val()=="등록된 답변이 없습니다. 답변을 입력해주세요") {
			mailSend.hide();
		}
	});

	
	answerSave.click(function() {
		if (answer.val().length < 1) {
			alert("내용을 입력하세요"); //답변 null값이 들어가지 않도록 막음
			
		} else {
			/* event.preventDefault(); */
			$.ajax({
			type : 'post',
			enctype: 'multipart/form-data',
			url : '/reset/admin/qnaDetail/${bean.qa_no }',
			dataype : 'text',
			headers : {
				//"Context-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST",
		
			},
			data : "answer="+answer.val(), 
			success : function(data) {
				console.log(data.result); 
				if (data.result==1) {
					alert("등록되었습니다");
					 $("#target").text(data.new_answer);
					 $("#mailSend").css("display","inline-block");
					}	
				}
			}); //ajax end
		} //else end
	}); 
});
</script>

</head>
<body>
		        <h4>글번호 ${bean.qa_no} 상세페이지</h4>
		 
		        
		      		<div>
		      			<label for="qa_no">글번호</label>	&nbsp; &nbsp; &nbsp; &nbsp;
                         <span>${bean.qa_no }</span>
		      			<input type="hidden" value="${bean.qa_no }" class="form-control" name="qa_no" id="qa_no" placeholder="사번" />
		      		</div>
                    <div>
		      			<label>날짜</label>&nbsp; &nbsp; &nbsp; &nbsp;
				        <span>${bean.nalja }</span>
		      		</div>
		      		<div>
		      			<label>질문유형</label>&nbsp; &nbsp; &nbsp; &nbsp;
				        <span>${bean.qa_type }</span>
		      		</div>
		      		<div>
		      			<label>내용</label>&nbsp; &nbsp; &nbsp; &nbsp;
				        <span>${bean.con }</span>
		      		</div>
		      		        <form action="${bean.qa_no }" method="post">
		      		<div>
		      			<label>답변</label>&nbsp; &nbsp; &nbsp; &nbsp;
		    <c:choose> 
				<c:when test="${empty bean.answer}">
						<span id="target">등록된 답변이 없습니다. 답변을 입력해주세요</span>
				</c:when>  
				<c:otherwise>
						${bean.answer }
				</c:otherwise>
			</c:choose>
					<span id="target"><button type="button" id="mailSend" style="display:none">메일전송</button></span>
			
			</div>
		<div>
			<input type="text" name="answer" id="answer" class="answer-input" palceholder="답변을 작성하세요"/>
		</div>	
		    
	<button type="button">목록</button>
	<button type="button" id="answerWrite" >답변</button>
	<button type="button" id="answerSave" >저장</button>
	<button type="button" id="answerCancel">취소</button>	
	</form>
</body>
</html>