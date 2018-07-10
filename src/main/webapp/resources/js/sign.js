function validateEmail(email) {
   var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
   return re.test(email);
}// function validateEmail(email)

/*
 Password Validator 0.1
 (c) 2007 Steven Levithan 
 MIT License
*/
 
function validatePassword (pw, options) {
 // default options (allows any password)
 var o = {
  lower:    0,
  upper:    0,
  alpha:    0, /* lower + upper */
  numeric:  0,
  special:  0,
  length:   [0, Infinity],
  custom:   [ /* regexes and/or functions */ ],
  badWords: [],
  badSequenceLength: 0,
  noQwertySequences: false,
  noSequential:      false
 };
 
 for (var property in options)
  o[property] = options[property];
 
 var re = {
   lower:   /[a-z]/g,
   upper:   /[A-Z]/g,
   alpha:   /[A-Z]/gi,
   numeric: /[0-9]/g,
   special: /[\W_]/g
  },
  rule, i;
 
 // enforce min/max length
 if (pw.length < o.length[0] || pw.length > o.length[1])
  return false;
 
 // enforce lower/upper/alpha/numeric/special rules
 for (rule in re) {
  if ((pw.match(re[rule]) || []).length < o[rule])
   return false;
 }
 
 // enforce word ban (case insensitive)
 for (i = 0; i < o.badWords.length; i++) {
  if (pw.toLowerCase().indexOf(o.badWords[i].toLowerCase()) > -1)
   return false;
 }
 
 // enforce the no sequential, identical characters rule
 if (o.noSequential && /([\S\s])\1/.test(pw))
  return false;
 
 // enforce alphanumeric/qwerty sequence ban rules
 if (o.badSequenceLength) {
  var lower   = "abcdefghijklmnopqrstuvwxyz",
   upper   = lower.toUpperCase(),
   numbers = "0123456789",
   qwerty  = "qwertyuiopasdfghjklzxcvbnm",
   start   = o.badSequenceLength - 1,
   seq     = "_" + pw.slice(0, start);
  for (i = start; i < pw.length; i++) {
   seq = seq.slice(1) + pw.charAt(i);
   if (
    lower.indexOf(seq)   > -1 ||
    upper.indexOf(seq)   > -1 ||
    numbers.indexOf(seq) > -1 ||
    (o.noQwertySequences && qwerty.indexOf(seq) > -1)
   ) {
    return false;
   }
  }
 }
 
 // enforce custom regex/function rules
 for (i = 0; i < o.custom.length; i++) {
  rule = o.custom[i];
  if (rule instanceof RegExp) {
   if (!rule.test(pw))
    return false;
  } else if (rule instanceof Function) {
   if (!rule(pw))
    return false;
  }
 }
 
 // great success!
 return true;
}// fucntion validatePassword()

function valitdateRePW() {
     var pw = $('input[id=password]').val();
     var re = $('input[id=pwchk]').val();
     if(pw==re)return true;
     else return false;
}


/////////////////////////////////////

function checkEmail() {
    var $errM = $("<div/>",{"class":"errM"});
     var $target = $("#email");
     if (validateEmail($target.val())) {
          var $postM = $.post( "check_mail", "email="+$target.val() );
          $postM.done(function( data ) {
               if(data.result==0){
                  inputSucces($target);
            	   return true
               }else{
                 inputFail($target,$errM,"이미 사용중인 이메일입니다.")
                 return false;
               }
          });
     }else {
         inputFail($target,$errM,"올바른 이메일을 입력해주세요.")
          return false;
     }
}// fucntion checkPW()

function checkNick(){
    var $errM = $("<div/>",{"class":"errM"});
     var $target = $("#nick");
     var $postM = $.post( "check_nick", "nick="+$target.val() );
     $postM.done(function( data ) {
          if(data.result==0){
       	   // TODO ok 처리
              inputSucces($target);
        	  return true
          }else{
              inputFail($target,$errM,"이미 사용중인 닉네임입니다.")
              return false;
          }
     });

}// function checkNick()

function checkPW(){
	var $errM = $("<div/>",{"class":"errM"});
    var $target = $("#password");
    var passed = validatePassword($target.val(), {
     length:   [10, Infinity],
     lower:    1,
     upper:    1,
     numeric:  1,
     special:  1,
     badWords: ["password", "steven", "levithan"],
     badSequenceLength: 4
     });
     if(passed){
        inputSucces($target);
        return true;
     }else{
         inputFail($target,$errM,"영소대문자,숫자 1자이상 + 10글자 이상")
         return false;
     }
}// fucntion checkPW()

function checkRePW(){
    var $errM = $("<div/>",{"class":"errM"});
     var $target = $("#pwchk");
     var passed = valitdateRePW();
     if(passed){
          inputSucces($target);
          return true;
     }else{
          inputFail($target,$errM,"입력한 비밀번호가 일치하지 않습니다.")
          return false;
     }
}

function checkPhone(){
    var $errM = $("<div/>",{"class":"errM"});
    var $target = $("#phone");
    var testMobile = isMobile($target.val());
    var testPhone = isPhone($target.val());
    if(testMobile || testPhone ){
      inputSucces($target);
      return true;
    }else{
      inputFail($target,$errM,"유효한 번호를 넣어주세요");
      return false;
    }
}


// http://webskills.kr/archives/310
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

// http://holybell87.tistory.com/22#.W0RXUtVLiM8
function isMobile(phoneNum)   { 
  var regExp =/^(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/;  
  return regExp.test(phoneNum); 
}

function isPhone(phoneNum)   { 
  var regExp =/^(02|0[3-9]{1}[0-9]{1})[1-9]{1}[0-9]{2,3}[0-9]{4}$/;  
  return regExp.test(phoneNum); 
}

function inputSucces($target){
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

function addFormEvent(){
     //
$("#form input").each(function(){
	$(this).on("focus",function(){
        $(this).val('');
        $(this).css("color","black");
        $(this).parent().find(".errM").remove();
    });
});
$("#email").on("blur", checkEmail);
$("#nick").on("blur",checkNick);
$("#password").on("blur", checkPW);
$("#pwchk").on("blur",checkRePW);
$("#phone").on("blur",checkPhone);
$("#phone").on("keydown",onlyNumber);
$("#phone").on("keyup",onlyNumber);

}// addFormEvent();

function submitCheck(){
  var errTest;
  var nullCheck;
  $("#form input").each(function(){
    errTest = $(this).parent().find(".err");
    if(errTest.length>0){
      $(this).focus();
      $(this).css("border","2px soild red");
      return false;
    }
    nullCheck = $(this).val();
    if(nullCheck == null){
    	consolo.log("널오류");
      $(this).focus();
      var $errM = $("<div/>",{"class":"errM"});
      inputFail(this,$errM,"값이 비었습니다.");
      return false;
    }
  });// err 체크
  return true
}
