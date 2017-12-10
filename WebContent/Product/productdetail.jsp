<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<title>Joy ��ǰ �󼼺���</title>
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
			<div id="content">
				<%
					Class.forName("com.mysql.jdbc.Driver");
					int productID = Integer.parseInt(request.getParameter("productID"));
					try {
						Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/joy", "root", "forgod1994!");
						Statement stmt = conn.createStatement();
						String sql = "SELECT productName, price,stock, category from product where productID=" + productID;
						ResultSet rs = stmt.executeQuery(sql);

						if (rs.next()) {
							String productname = rs.getString(1);
							int price = rs.getInt(2);
							int stock = rs.getInt(3);
							String category = rs.getString(4);
				%>
				<div id="pic">
					<input type="image" src="http://localhost:8080/DB_final/Img?id=<%=productID%>" width="40%">
				</div>
				<div id="detail">
					<p>
					<h2><%=productname%></h2>
					price:
					<%=price%>
					</p>
					<form name="productnum" id="productnum" action="buy.jsp">
						����:<input type="number" id="number" name="number" required> <input type="submit" text="�ֹ��ϱ�">
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	
		window.onload = function() {
			//submit�� ������ �� ȣ��� �Լ�����
			document.getElementById("productnum").onsubmit = function() {
				//id���� ������ �������� �ʱ�
				var snum = document.getElementById("number").value;
				if (snum == null || snum.length == 0) {
					alert("������ �ʼ� �Է��Դϴ�.");
					return false;
				} else if (snum < 0) {
					alert("����� �Է��ϼ��� ");
					return false;
				} else if (snum.getClass().getName != "int") {
					alert("���ڸ� �Է��ϼ���");
					return false;
				}
				return true;
			}
		}
	</script>
</body>
</html>
<%
	String id = Integer.toString(productID);
			response.addCookie(new Cookie("productID", id));
		}
		rs.close();
		stmt.close();
		conn.close();

	} catch (SQLException e) {
	}
%>