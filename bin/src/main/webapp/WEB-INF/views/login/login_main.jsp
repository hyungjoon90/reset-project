
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="google-signin-client_id" content="1051220480905-p8890ral8a45q8c1q6201a57oqg75k7f.apps.googleusercontent.com">
<title>Insert title here</title>
</head>
  <%
  	SecureRandom random = new SecureRandom();
  	String state = new BigInteger(130, random).toString();
  
  	String naver_clientId = "tfJeSZAfwMMgSJ0l4M9h";//애플리케이션 클라이언트 아이디값";
    String naver_redirectURI = URLEncoder.encode("http://localhost:8080/reset/login/naver/", "UTF-8");
    String naver_apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    naver_apiURL += "&client_id=" + naver_clientId;
    naver_apiURL += "&redirect_uri=" + naver_redirectURI;
    naver_apiURL += "&state=" + state;
    session.setAttribute("state", state);

    String kakko_clientId = "f709273524fdad8902b81660b68a0735";//애플리케이션 클라이언트 아이디값";
	String kakko_redirectURI = "http://localhost:8080/reset/login/kakko";
    String kakko_apiURL = "https://kauth.kakao.com/oauth/authorize?response_type=code";
    kakko_apiURL += "&client_id=" + kakko_clientId;
    kakko_apiURL += "&redirect_uri=" + kakko_redirectURI;
    //kakko_apiURL += "&state=" + state;
%>
<body>

	<!--  네이버 -->
	<a href="<%=naver_apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	<!-- REST API 카카오 -->
	<a href="<%=kakko_apiURL%>">카카오로그인</a>
	<!-- google sign- -->
	<div id="my-signin2"></div>
  <script>
    function onSuccess(googleUser) {
    	  var id_token = googleUser.getAuthResponse().id_token;
    	  console.log(id_token);
    	  var xhr = new XMLHttpRequest();
    	  xhr.open('POST', 'http://localhost:8080/reset/login/google');
    	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	  xhr.onload = function() {
    	    console.log('Signed in as: ' + xhr.responseText);
    	  };
    	  xhr.send('idtoken=' + id_token);
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 240,
        'height': 50,
        'longtitle': true,
        'theme': 'dark',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  </script>
  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>


</body>
</html>