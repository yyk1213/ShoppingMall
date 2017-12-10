<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy ȸ������</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				<a href="../Main.jsp"><img src="../images/joy.png" style="float: left; height: 100%;"></a>
				<ul class="nav justify-content-end">
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="Login.jsp">�α���</a></li>
				</ul>
			</div>
			<div id="menu">
				<nav class="nav flex-column">
					<a class="nav-link" href="../Product/product.jsp">All</a> <a class="nav-link" href="../Product/top.jsp">Top</a> <a class="nav-link" href="../Product/bottom.jsp">Bottom</a> <a class="nav-link" href="../Board/boardList.jsp">Board</a>
				</nav>
			</div>
			<script>
				window.onload = function IDCheck() {
					document.getElementById("isCheck").value = "false";
					document.getElementById("checkId").onclick = function() {
						var sid = document.getElementById("id").value;
						if (sid == null || sid.length == 0) {
							alert("���̵� �Է��ϰ� �˻��ϼ���");
						} else {
							window
								.open("CheckId.jsp?id=" + sid, "",
									"width=400 height=400");
						}
					}
					//id ���� ��Ŀ���� ���� �ߺ�üũ�� �ٽ� �ϵ��� isCheck�� ���� ����
					document.getElementById("id").onblur = function() {
						document.getElementById("isCheck").value = "false";
					}
				}
			</script>
			<div id="content">
				<H4>ȸ�� ������ �Է��ϼ���</H4>
				<FORM ID="SignUpForm" ACTION=SignUpProcess.jsp Method=POST>
					<input type="hidden" id="isCheck" /> ���̵�:<INPUT TYPE=TEXT NAME=id id="id" required><input type="button" value="�ߺ�Ȯ��" id="checkId" /> <BR> �н�����:<INPUT TYPE=PASSWORD NAME=password id="password" required><BR> �̸�:<INPUT TYPE=TEXT NAME=name id="name" required><BR> ��ȭ��ȣ:<INPUT TYPE=TEXT NAME=phoneNum id="phoneNum" required><BR> �ּ�:<INPUT TYPE=TEXT NAME=address id="address" required><BR> <INPUT TYPE="SUBMIT" VALUE='ȸ������'> <INPUT TYPE="RESET" VALUE='���'>
				</FORM>
			</div>
		</div>
	</div>
</body>
</html>