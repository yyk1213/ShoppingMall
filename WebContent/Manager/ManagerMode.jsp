<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy �����ڸ��</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				<a href="../Main.jsp"><img src="../images/joy.png" style="float: left; height: 100%;"></a>
				<ul class="nav justify-content-end">
					<li class="nav-item"><a class="nav-link" href="../User/Logout.jsp">�α׾ƿ�</a></li>
				</ul>
			</div>
			<div id="menu">
				<nav class="nav flex-column"> <a class="nav-link" href="../Product/top.jsp">Top</a> <a class="nav-link" href="../Product/bottom.jsp">Bottom</a> <a class="nav-link" href="../Board/boardList.jsp">Board</a> </nav>
			</div>
			<div id="content">
				<%
					Connection conn = null;
					Statement stmt = null;

					String id = (String) session.getAttribute("userID");
					String password = (String) session.getAttribute("userPassword");
					System.out.println(id);

					try {
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
						if (conn == null)
							throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
						stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT * FROM user ;");
				%>
				<h2>ȸ�� ���</h2>
				<table width="70%" cellpadding="0" cellspacing="0" border="0">
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
					<tr height="5">
						<td width="5"></td>
					</tr>
					<tr height="5" align="center">
						<td>&nbsp;</td>
						<td width="73">���̵�</td>
						<td width="73">��й�ȣ</td>
						<td width="73">�̸�</td>
						<td width="73">�ּ�</td>
						<td width="73">�ڵ��� ��ȣ</td>
						<td width="73">���</td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
					<%
						while (rs.next()) {
					%><tr height="25" align="center">
					<td>&nbsp;</td>
						<td><%=rs.getString("userID")%></td>
						<td><%=rs.getString("password")%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("address")%></td>
						<td><%=rs.getString("phoneNum")%></td>
						<td><input type ="button" value="����"/></td>
						</tr>
					<tr height="1" bgcolor="#D2D2D2">
						<td colspan="6"></td>
					</tr>
					<%
						}
							rs.close();
							stmt.close();
							conn.close();
						} catch (SQLException e) {
							out.println(e.toString());
						}
					%>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
				</table>
				<br>
				<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
						if (conn == null)
							throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
						stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT * FROM product ;");
				%>
				<h2>��ǰ ���</h2>
				<table width="70%" cellpadding="0" cellspacing="0" border="0">
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="800"></td>
					</tr>
					<tr height="5">
						<td width="5"></td>
					</tr>
					<tr height="5" align="center">
						<td>&nbsp;</td>
						<td width="73">��ǰID</td>
						<td width="73">��ǰ�̸�</td>
						<td width="73">����</td>
						<td width="73">���</td>
						<td width="73">ī�װ�</td>
						<td width="73">����</td>
						<td width="73">���</td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
					<%
						while (rs.next()) {
					%><tr height="25" align="center">
					<td>&nbsp;</td>
						<td><%=rs.getInt("productID")%></td>
						<td><%=rs.getString("productName")%></td>
						<td><%=rs.getInt("price")%></td>
						<td><%=rs.getInt("stock")%></td>
						<td><%=rs.getString("category")%></td>
						<td><input type="image" src="http://localhost:8080/DB_final/Img?id=<%=rs.getInt("productID")%>" width="50" height="50"></td>
						<td><input type ="button" value="����"/></td>
						</tr>
					<tr height="1" bgcolor="#D2D2D2">
						<td colspan="6"></td>
					</tr>
					<%
						}
							rs.close();
							stmt.close();
							conn.close();
						} catch (SQLException e) {
							out.println(e.toString());
						}
					%>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
				</table>
				
			</div>
		</div>
	</div>
</body>
</html>