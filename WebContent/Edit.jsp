<%@ page language="java" contentType="text/html; charset=EUC-KR"
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy 회원정보수정</title>
</head>
<body>
	<FORM ACTION=Updater.jsp METHOD=POST>
		이름: <INPUT TYPE=TEXT NAME=name SIZE=5 VALUE='${NAME}'><BR> 
		아이디: <INPUT TYPE=TEXT NAME=id SIZE=50 VALUE='${ID}'> <BR> 
		비밀번호: <INPUT TYPE=TEXT NAME=password SIZE=20 VALUE='${PASSWORD}'> <BR> 
		주소: <INPUT TYPE=TEXT NAME=address SIZE=50 VALUE='${ADDRESS}'><BR> 
		휴대폰 번호: <INPUT TYPE=TEXT NAME=phoneNum SIZE=50 VALUE='${PHONENUM}'><BR> 
		<INPUT TYPE=SUBMIT VALUE='수정'>
	</FORM>
</html>