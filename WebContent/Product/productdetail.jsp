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
				<form class="search" action="Product/Search.jsp">
					<input type="text" name="search" id="search" size="8" style="text-align: center; float: left; border: none;">
					<button type="submit" class="btn btn-secondary btn-sm" style="size: 40%; float: right;">search</button>
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
						String sql = "SELECT productName, price,stock, category,detail from product where productID="
								+ productID;
						ResultSet rs = stmt.executeQuery(sql);

						if (rs.next()) {
							String productname = rs.getString(1);
							int price = rs.getInt(2);
							int stock = rs.getInt(3);
							String category = rs.getString(4);
							String detail = rs.getString(5);
				%>
				<div id="pic">
					<input type="image" src="http://localhost:8080/DB_final/Img?id=<%=productID%>" width="98%">
				</div>
				<div id="detail">
					<p>
					<h2><%=productname%></h2>
					<%=detail%><br> price:
					<%=price%>
					</p>
					<form name="productnum" id="productnum" method='post'>
						����: <input style="width: 10%;" type="number" name="number" required> <input type="button" value="buy" onClick='mySubmit(1)' class="btn btn-secondary btn-sm"> <input type="button" value="basket" onClick='mySubmit(2)' class="btn btn-secondary btn-sm">
					</form>
					<script type="text/javascript">
	function mySubmit(id){

		var element=document.productnum.number.value;
		if(id==1)
			location.href="buy.jsp?number="+element;
	
		if(id==2)
			location.href="basket.jsp?number="+element;
	}
	</script>
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