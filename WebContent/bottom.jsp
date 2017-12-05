<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page language="java"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<li class="nav-item"><a class="nav-link active" href="#">�α���</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="#">ȸ������</a></li>
		<li class="nav-item"><a class="nav-link" href="#">My Page</a></li>
		<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
		</li>
	</ul>
	<div id="menu">
		<nav class="nav flex-column"> <a class="nav-link active"
			href="product.jsp">All</a> <a class="nav-link" href="top.jsp">Top</a>
		<a class="nav-link" href="bottom.jsp">Bottom</a> <a class="nav-link"
			href="boardList.jsp">Board</a> <a class="nav-link disabled" href="#">Disabled</a>
		</nav>
	</div>





	<div id="content">

		<h2>BOTTOM</h2>
		<div class="row">
			<%
				Blob img = null;
				byte[] imgdata = null;
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				String iurl1 = null;
				try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
					stmt = conn.createStatement();

					rs = stmt.executeQuery("select id,productname, price, img  from product where category='bottom'");

					while (rs.next()) {
						int id = rs.getInt(1);
						String productname = rs.getString(2);
						int price = rs.getInt(3);
						img = rs.getBlob(4);
			%>

			<div class="col-sm-1">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top" src="..." alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title"><%=productname%></h4>
						<p class="card-text"><%=price%></p>
						<a href="productdetail.jsp?productname=<%=productname%>"
							class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>

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


</body>
</html>