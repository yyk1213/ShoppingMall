<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy �α���</title>
<script>

window.onload=function(){
	//submit�� ������ �� ȣ��� �Լ�����
	document.getElementById("loginForm").onsubmit=function(){
		//id���� ������ �������� �ʱ�
		var sid=document.getElementById("id").value;
		var password=document.getElementById("password").value;
		if(sid==null ||sid.length==0){
			alert("���̵�� �ʼ� �Է��Դϴ�.");
			return false;
		}else if(password==null ||password.length==0){
			alert("��й�ȣ�� �ʼ� �Է��Դϴ�.");
			return false;
		}
		return true;
	}
}
</script>
</head>
<body>
<FORM name="loginForm" id="loginForm" ACTION=LoginProcess.jsp Method=POST>
���̵�:<INPUT TYPE=TEXT NAME=id ID="id"><BR>
�н�����:<INPUT TYPE=PASSWORD NAME=password ID="password"><BR>
<INPUT TYPE="submit" VALUE='Ȯ��'>
</FORM>
<a href="SignUp.html">ȸ�������ϱ�</a>
</body>
</html>