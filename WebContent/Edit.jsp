<%@ page language="java" contentType="text/html; charset=EUC-KR"
    %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy ȸ����������</title>
</head>
<body>
	<FORM ACTION=Updater.jsp METHOD=POST>
		�̸�: <INPUT TYPE=TEXT NAME=name SIZE=5 VALUE='${NAME}'><BR> 
		���̵�: <INPUT TYPE=TEXT NAME=id SIZE=50 VALUE='${ID}'> <BR> 
		��й�ȣ: <INPUT TYPE=TEXT NAME=password SIZE=20 VALUE='${PASSWORD}'> <BR> 
		�ּ�: <INPUT TYPE=TEXT NAME=address SIZE=50 VALUE='${ADDRESS}'><BR> 
		�޴��� ��ȣ: <INPUT TYPE=TEXT NAME=phoneNum SIZE=50 VALUE='${PHONENUM}'><BR> 
		<INPUT TYPE=SUBMIT VALUE='����'>
	</FORM>
</html>