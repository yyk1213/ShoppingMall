<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>top</title>
</head>
<body>
	
	<ul class="nav justify-content-end">
		<li class="nav-item"><a class="nav-link active" href="#">로그인</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
		<li class="nav-item"><a class="nav-link" href="#">My Page</a></li>
		<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
		</li>
	</ul>
	<div id="menu">
		<nav class="nav flex-column">
			<a class="nav-link active" href="product.jsp">All</a> <a
				class="nav-link" href="top.jsp">Top</a> <a class="nav-link"
				href="bottom.jsp">Bottom</a> <a class="nav-link"
				href="boardList.jsp">Board</a> <a class="nav-link disabled" href="#">Disabled</a>
		</nav>
	</div>
	<div id="content">

		<h2>TOP</h2>
		<div class="row">
			<input type="image" src="http://localhost:8080/DB_final/Img?id=1" width="200" height="300"/>
			<input type="image" src="http://localhost:8080/DB_final/Img?id=2" width="200" height="300"/>
			<input type="image" src="http://localhost:8080/DB_final/Img?id=3" width="200" height="300"/>
			<input type="image" src="http://localhost:8080/DB_final/Img?id=4" width="200" height="300"/>
		</div>
		</div>
</body>
</html>