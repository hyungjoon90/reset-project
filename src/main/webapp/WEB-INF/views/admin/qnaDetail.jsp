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

window.onload = function() { 

	var answerSave = $('#answerSave'); // 답변저장
	var answerWrite = $('#answerWrite'); //답변작성하기
	var answer = $('#answer'); //답변 input
	
	
    $(document).ready(function() {
        answer.hide();  // 답변 input hide
        answerSave.hide(); // 답변 저장 hide
        answerWrite.show(); //답변 작성하기 보여줌
       /* answerWrite.prop( "disabled", false );*/  // 답변하기 disable
        answerWrite.click(function(){
	   answerWrite.hide();
        answerSave.show();
	   answer.show();
	    });
    });
 
	 answerSave.click(function(){
	    	if(answer.val().length < 1){
			answer.prop('disable', true);
			}else{
            answer.prop('disable', false);
            }
	    });
};//window.onload end
</script>

</head>
<body>
		        <h4>글번호 ${bean.qa_no} 상세페이지</h4>
		         <form action="${bean.qa_no }" method="post">	
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
		      		<div>
		      			<label>답변</label>&nbsp; &nbsp; &nbsp; &nbsp;
		      			<c:choose> 
				<c:when test="${empty bean.answer}">등록된 답변이 없습니다. 답변을 입력해주세요</c:when>  
				<c:otherwise>${bean.answer }</c:otherwise>
			</c:choose>
			</div>
				        <div>
				        <input type="text" name="answer" id="answer" class="answer-input" palceholder="답변을 작성하세요"/>
		      		</div>	
		    
	<button type="submit">목록</button>
	<button type="button" id="answerWrite" >답변</button>
	<button type="submit" id="answerSave" >저장</button>
	</form>
</body>
</html>