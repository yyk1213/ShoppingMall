<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy Bottom</title>
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
				<form class="search" action="../Product/Search.jsp">
					<input type="text" class="form-control form-control-sm index-search" name="search" id="search" placeholder="��ǰ��">
					<button type="submit" class="btn btn-secondary btn-sm">search</button>
				</form>
			</div>
			<div id="menu">
				<nav class="nav flex-column">
					<a class="nav-link" href="top.jsp">Top</a> <a class="nav-link" href="bottom.jsp">Bottom</a> <a class="nav-link" href="../Board/boardList.jsp">Board</a>
				</nav>
			</div>
		</div>
		<div id="content">
			<h2>BOTTOM</h2>
			<div class="album text-muted">
				<div class="container">
					<div class="row">
						<%
							Connection conn = null;
							Statement stmt = null;
							ResultSet rs = null;
							try {
								Class.forName("com.mysql.jdbc.Driver");
								conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
								stmt = conn.createStatement();
								rs = stmt.executeQuery("select productID, productName, price from product where category='bottom';");

								while (rs.next()) {
									int productID = rs.getInt(1);
									String productname = rs.getString(2);
									int price = rs.getInt(3);
						%><a href="productdetail.jsp?productID=<%=productID%>">
							<div class="card">
								<input type="image" src="http://localhost:8080/DB_final/Img?id=<%=productID%>" width="210" height="210">
								<p class="card-text"><%=productname%></p>
								<p class="card-text">
									price:<%=price%>��
								</p>
							</div>
						</a>
						<%
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
	</div>
</body>
</html>