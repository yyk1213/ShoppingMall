<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<title>Joy �Խñ� �ۼ��ϱ�</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				<a href="../Main.jsp"><img src="../images/joy.png" style="float: left; height: 100%;"></a>
				<ul class="nav justify-content-end">
					<%
						String id = (String) session.getAttribute("userID");
						if (id == null) {
					%>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="../User/SignUp.jsp">ȸ������</a></li>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="../User/Login.jsp">�α���</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="../User/MyPage.jsp">My Page</a></li>
					<li class="nav-item"><a class="nav-link" href="../User/Logout.jsp">�α׾ƿ�</a></li>
					<%
						}
					%>
				</ul>
				<div class="container col-9">
					<div class="index-content">
						<h3 style="text-align: left; color: #5D5D5D;">�۾���</h3>
						<hr>
							<form action="boardNew.jsp" method="POST">
								<label for="titlearea" class="input-label">title</label>
								 <input name="title" class="form-control form-control-sm" id="titlearea" type="text">
								  <br> <br> 
								  <label for="contentarea" class="input-label">content</label>
								<textarea name="content" class="form-control" id="contentarea tippost_content" rows="7"></textarea>
								<br>
								<hr>
						<hr>
						<button type="submit" class="btn btn-secondary btn-sm" style="float: right;">���</button>
						</form>
						<form action=boardList.jsp method="GET">
							<button type="submit" class="btn btn-secondary btn-sm" style="float: left;">list</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%
	if (session.getAttribute("userID") == null) {
%>
<script language=javascript>
	self.window.alert(" �α����� �ʿ��մϴ�.  .");
	location.href = "../User/Login.jsp";
</script>
<%
	} else
		response.addCookie(new Cookie("writer", session.getAttribute("userID").toString()));
%>