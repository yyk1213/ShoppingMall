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
<title>Joy 회원정보수정</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				<a href="Main.jsp"><img src="/DB_final/DB_image/Joy_logo.png"
					style="float: left; height: 100%;"></a>
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link" href="Logout.jsp">로그아웃</a>
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
           <H4>회원 정보가 수정되었습니다.</H4>
           수정된 정보를 조회하려면 아래의 링크를 클릭하세요. <BR><BR>
           <A HREF=Reader.jsp?ID=${param.id}>회원 정보 조회</A>
           </div>
           </div>
           </div>
     </BODY>
</HTML>
