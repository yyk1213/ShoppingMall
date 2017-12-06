<%@ page contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");

	int id = Integer.parseInt(request.getParameter("id"));
	try {
		Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/joy", "root", "forgod1994!");
		Statement stmt = conn.createStatement();
		String sql = "SELECT TITLE, CONTENT, WRITER,HIT FROM board WHERE boardID=" + id;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			String title = rs.getString(1);
			String content = rs.getString(2);
			String writer = rs.getString(3);
			int hit = rs.getInt(4);
			hit++;
%>
<html>
<head>

<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
</head>

<body>
	<div id="header">
		<a href=""><img src="images/joy.jpg"
			style="float: left; height: 100%;"></a>
		<ul class="nav justify-content-end">
			<li class="nav-item"><a class="nav-link active" href="#">로그인</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
			<li class="nav-item"><a class="nav-link" href="#">My Page</a></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>
	</div>

	<div id="menu">
		<nav class="nav flex-column">
			<a class="nav-link disabled" href="product.jsp">All</a> <a
				class="nav-link disabled" href="top.jsp">Top</a> <a
				class="nav-link disabled" href="bottom.jsp">Bottom</a> <a
				class="nav-link disabled" href="boardList.jsp">Board</a>
		</nav>
	</div>

	<div class="container col-7" id="content">
		<!-- 내용 -->
		<div>
			<h3>자유 게시판</h3>
			<p class="show-top1"
				style="border-bottom: 1px solid; border-top: 2px solid;">
				subject
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=title%></p>
			<p class="show-top2" style="border-bottom: 1px solid">
				writer
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=writer%></p>
			<p class="show-top2" style="border-bottom: 1px solid">
				hit
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=hit%></p>

			<p style="margin-top: 2em; margin-bottom: 5em;"><%=content%></p>
		</div>

		<div style="border-top: 2px solid">
			<form action=boardList.jsp method="GET">
				<button type="submit" class="btn btn-secondary btn-sm"
					style="float: left;">list</button>
			</form>
			<form action=boardList.jsp method="GET">
				<button type="submit" class="btn btn-secondary btn-sm"
					style="float: right;" formmethod="POST" data-confirm="글을 삭제합니다">delete</button>
			</form>
			<form action=boardList.jsp method="GET">
				<button type="submit" class="btn btn-secondary btn-sm"
					style="float: right;">edit</button>
			</form>
		</div>
	</div>

	<br>
	<hr>

</body>

</html>

<%
	String sql2 = "update board set hit=" + hit + " where id=" + id;
			stmt.executeUpdate(sql2);
		}
		rs.close();
		stmt.close();
		conn.close();

	} catch (SQLException e) {
	}
%>
