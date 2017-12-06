<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy 로그인</title>
<script>

window.onload=function(){
	//submit을 눌렀을 때 호출될 함수설정
	document.getElementById("loginForm").onsubmit=function(){
		//id값이 없으면 전송하지 않기
		var sid=document.getElementById("id").value;
		var password=document.getElementById("password").value;
		if(sid==null ||sid.length==0){
			alert("아이디는 필수 입력입니다.");
			return false;
		}else if(password==null ||password.length==0){
			alert("비밀번호는 필수 입력입니다.");
			return false;
		}
		return true;
	}
}
</script>
</head>
<body>
<FORM name="loginForm" id="loginForm" ACTION=LoginProcess.jsp Method=POST>
아이디:<INPUT TYPE=TEXT NAME=id ID="id"><BR>
패스워드:<INPUT TYPE=PASSWORD NAME=password ID="password"><BR>
<INPUT TYPE="submit" VALUE='확인'>
</FORM>
<a href="SignUp.html">회원가입하기</a>
</body>
</html>