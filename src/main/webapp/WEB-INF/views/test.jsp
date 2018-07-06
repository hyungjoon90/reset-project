<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-1.12.4.js"></script>

<script type="text/javascript">
	
	function getAllList(){
		var p_no=1;
		$.getJSON("comment/all/"+p_no,function(data){
			var str="";
			console.log(data.length);
			
		$(data).each(
			function(){
			str+="<li data-co_no='"+this.co_no+"' class='commentLi'>"
			   +this.co_no+":"+this.content
			   +"</li>";
		});
		
		$("#comment").html(str);
		
		});
	}
		$("#addBtn").on("click",function(){
			var writer =$("#writer").val();
			var content =$("#content").val();
			var email =$("#email").val();
			var co_type =$("#co_type").val();
			var p_no =$("#p_no").val();
			
			$.ajax({
				type:'post',
				url: '/reset/comment',
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
		});
</script>
</head>
<body>
	<h2>ajax test page</h2>
	<div>
		WRITER <input type="text" name="writer" id="writer">
	</div>
	<div>
		content <input type="text" name="content" id="content">
	</div>
	<div>
		email <input type="text" name="email" id="email">
	</div>
	<div>
		co_type <input type="text" name="co_type" id="co_type">
	</div>
	<div>
		p_no <input type="text" name="p_no" id="p_no">
	</div>
	<button id="addBtn">입력</button>
	<ul id="comment">
	</ul>
</body>
</html>