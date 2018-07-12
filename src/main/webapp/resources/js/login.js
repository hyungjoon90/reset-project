function validateEmail(email) {
   var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
   return re.test(email);
}// function validateEmail(email)

function onlyNumber(event){
	event = event || window.event;
    $(event.target).val($(event.target).val().replace(/[^0-9]/g,""));
}

function inputSuccess($target){
	  $target.parent().find(".errM").remove();
	  $target.css("color","green");
	  $target.css("border","1px solid #ccc");
	}

function inputFail($target,$errM,msg){
    $errM.text(msg);
    $errM.css("color", "red");
    $target.css("color", "red");
    $errM.appendTo($target.parent());
}

function checkEmail(ele) {
    var $errM = $("<div/>",{"class":"errM"});
     var $target = $(ele);
     if (validateEmail($target.val())) {
         inputSuccess($target);
		return true;	
     }else {
         inputFail($target,$errM,"올바른 이메일을 입력해주세요.")
         return false;
     }
}// fucntion checkPW()