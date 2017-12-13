<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy Main</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				<a href="../Main.jsp"><img src="../images/joy.png" style="float: left; height: 100%;"></a>
				<ul class="nav justify-content-end">
					<%
						String userID = (String) session.getAttribute("userID");
						if (userID == null) {
					%>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="../User/SignUp.jsp">회원가입</a></li>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="../User/Login.jsp">로그인</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="../User/MyPage.jsp">My Page</a></li>
					<li class="nav-item"><a class="nav-link" href="../User/Logout.jsp">로그아웃</a></li>
					<%
						}
					%>
				</ul>
				<form action="Search.jsp">
					<input type="text" name="search" hint="제품명"><input type="submit">
				</form>
			</div>
			<div id="menu">
				<nav class="nav flex-column">
					<a class="nav-link" href="top.jsp">Top</a> <a class="nav-link" href="bottom.jsp">Bottom</a> <a class="nav-link" href="../Board/boardList.jsp">Board</a>
				</nav>
			</div>
			<div id="content">
				<div class="album text-muted">
					<div class="container">
						<div class="row">
							<%
								String search = request.getParameter("search");
								Connection conn = null;
								Statement stmt = null;
								int count = 0;
								try {
									Class.forName("com.mysql.jdbc.Driver");
									conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
									if (conn == null)
										throw new Exception("데이터베이스에 연결할 수 없습니다.");
									stmt = conn.createStatement();
									ResultSet rs = stmt
											.executeQuery("select count(*) from product where productName like '%" + search + "%'");
									while (rs.next()) {
										count = rs.getInt(1);
									}
									rs.close();
									if (count == 0) {
							%>
							<script language=javascript>
								self.window.alert("검색결과가 존재하지 않습니다.");
								location.href = "../Main.jsp";
							</script>
							<%
								} else {
										rs = stmt.executeQuery("select productID, productName, price from product where productName like '%"
												+ search + "%'");
										while (rs.next()) {

											int productID = rs.getInt(1);
											String productname = rs.getString(2);
											int price = rs.getInt(3);
							%>
							<div class="card">
								<a href="productdetail.jsp?productID=<%=productID%>"> <input type="image" src="http://localhost:8080/DB_final/Img?id=<%=productID%>" width="210" height="210">
									<p class="card-text"><%=productname%></p>
									<p class="card-text">
										price:<%=price%>원
									</p>
								</a>
							</div>
							<%
								}
									}
									rs.close();
									stmt.close();
									conn.close();
								} catch (SQLException e) {
									out.println(e.toString());
								}
							%>
						</div>
					</div>
				</div>
			</div>
</body>
</html>