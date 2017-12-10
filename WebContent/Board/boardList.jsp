<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<title>Joy �Խ���</title>
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
			</div>
			<div id="menu">
				<nav class="nav flex-column">
					<a class="nav-link" href="../Product/product.jsp">All</a> <a class="nav-link" href="../Product/top.jsp">Top</a> <a class="nav-link" href="../Product/bottom.jsp">Bottom</a> <a class="nav-link" href="boardList.jsp">Board</a>
				</nav>
			</div>
			<div id="content">
				<h2>�Խ���</h2>
				<%
					int total = 0;
					Connection conn = null;
					Statement stmt = null;
					try {
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
						if (conn == null)
							throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
						stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("select count(*) from board;");
						if (rs.next())
							total = rs.getInt(1);
						rs.close();
						out.print("�� �Խù�:" + total + "��");
						rs = stmt.executeQuery("select boardID, writer, title,hit from board");
				%>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
					<tr height="5">
						<td width="5"></td>
					</tr>
					<tr height="5" align="center">
						<td>&nbsp;</td>
						<td width="73">��ȣ</td>
						<td width="379" align="left">����</td>
						<td width="73" align="center">�ۼ���</td>
						<td width="73">��ȸ��</td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
					<%
						if (total == 0) {
					%>
					<tr align="center" bgcolor="#FFFFFF" height="30">
						<td colspan="6">��ϵ� ���� �����ϴ�.</td>
					</tr>
					<%
						} else {

								while (rs.next()) {
									int boardID = rs.getInt(1);
									String writer = rs.getString(2);
									String title = rs.getString(3);
									int hit = rs.getInt(4);
					%>
					<tr height="25" align="center">
						<td>&nbsp;</td>
						<td><%=boardID%></td>
						<td align="left"><a href="boardView.jsp?boardID=<%=boardID%>"><%=title%></a></td>
						<td align="center"><%=writer%></td>
						<td><%=hit%></td>
						<td>&nbsp;</td>
					</tr>
					<tr height="1" bgcolor="#D2D2D2">
						<td colspan="6"></td>
					</tr>
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
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
				</table>
				<form action=boardForm.jsp METHOD=POST style="margin: 10px">
					<button type="submit" class="btn btn-outline-dark">�۾���</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
