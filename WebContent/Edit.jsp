<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="DBError.jsp"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy ȸ����������</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				<a href="Main.jsp"><img src="/DB_final/DB_image/Joy_logo.png"
					style="float: left; height: 100%;"></a>
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link" href="Logout.jsp">�α׾ƿ�</a>
					</li>
				</ul>
			</div>

			<div id="menu">
				<nav class="nav flex-column">
					<a class="nav-link" href="product.jsp">All</a> <a class="nav-link"
						href="top.jsp">Top</a> <a class="nav-link" href="bottom.jsp">Bottom</a>
					<a class="nav-link" href="boardList.jsp">Board</a>
				</nav>
			</div>

			<div id="content">
	<FORM NAME="EditForm" ID="EditForm" ACTION=Updater.jsp METHOD=POST>
		�̸�: <INPUT TYPE=TEXT NAME=name SIZE=5 VALUE='${NAME}' ID="name" required><BR>
		���̵�: <INPUT TYPE=TEXT NAME=id SIZE=50 VALUE='${ID}' ID="id" required> <BR>
		��й�ȣ: <INPUT TYPE=TEXT NAME=password SIZE=20 VALUE='${PASSWORD}'
			ID="password" required> <BR> �ּ�: <INPUT TYPE=TEXT NAME=address
			SIZE=50 VALUE='${ADDRESS}' ID="address" required><BR> �޴��� ��ȣ: <INPUT
			TYPE=TEXT NAME=phoneNum SIZE=50 VALUE='${PHONENUM}' ID="phoneNum" required><BR>
		<INPUT TYPE="SUBMIT" VALUE='����'>
	</FORM>
	</div>
	</div>
	</div>
	</body>
</html>