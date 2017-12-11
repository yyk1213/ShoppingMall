<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy My Page</title>
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
					<li class="nav-item"><a class="nav-link" href="SignUp.jsp">ȸ������</a></li>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="Login.jsp">�α���</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="MyPage.jsp">My Page</a></li>
					<li class="nav-item"><a class="nav-link" href="Logout.jsp">�α׾ƿ�</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div id="menu">
				<nav class="nav flex-column">
					<a class="nav-link" href="../Product/top.jsp">Top</a> <a class="nav-link" href="../Product/bottom.jsp">Bottom</a> <a class="nav-link" href="../Board/boardList.jsp">Board</a>
				</nav>
			</div>
			<%
				int total = 0;
				Connection conn = null;
				Statement stmt = null;
				String password = (String) session.getAttribute("userPassword");
				System.out.println(id);

				try {

					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
					if (conn == null)
						throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
					stmt = conn.createStatement();
					String sql = "select count(*) from order where orderID=1;";
					ResultSet rs = stmt.executeQuery(sql);
					if (rs.next())
						total = rs.getInt(1);
					rs.close();
					rs = stmt.executeQuery("select * from order where orderID=1;");
			%>
			<div id="content">
				<h2>�� ���Ÿ��</h2>
				<table width="70%" cellpadding="0" cellspacing="0" border="0">
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
					<tr height="5">
						<td width="5"></td>
					</tr>
					<tr height="5" align="center">
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td width="73">��ȣ</td>
						<td>�ֹ���ȣ</td>
						<td>���Ż�ǰ��ȣ</td>
						<td>����</td>
						<td>��¥</td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
					<%
						if (total == 0) {
					%>
					<tr align="center" bgcolor="#FFFFFF" height="30">
						<td colspan="6">���ų����� �����ϴ�.</td>
					</tr>
					<%
						} else {
								while (rs.next()) {
									int orderNum = rs.getInt("orderID");
									int productID = rs.getInt("productID");
									int number = rs.getInt("number");
									int date = rs.getInt("date");
					%>
					<tr height="25" align="center">
						<td>&nbsp;</td>
						<td><%=orderNum%></td>
						<td><%=productID%></td>
						<td><%=number%></td>
						<td><%=date%></td>
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
				<br> �� ��������
				<FORM ACTION="Reader.jsp" METHOD=GET>
					<INPUT TYPE=SUBMIT VALUE='ȸ����������'>
				</FORM>
				ȸ��Ż��
				<FORM ACTION="DeleteForm.jsp" METHOD=GET>
					<INPUT TYPE=SUBMIT VALUE='ȸ��Ż��'>
				</FORM>
			</div>
		</div>
	</div>
</BODY>
</html>