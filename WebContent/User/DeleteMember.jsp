<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy ȸ��Ż��</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				<a href="../Main.jsp"><img src="../images/joy.png" style="float: left; height: 100%;"></a>
			</div>
			<div id="menu">
				<nav class="nav flex-column">
				<a class="nav-link" href="../Product/top.jsp">Top</a> <a class="nav-link" href="../Product/bottom.jsp">Bottom</a> <a class="nav-link" href="../Board/boardList.jsp">Board</a>
				</nav>
			</div>
			<div id="content">
				<%
					String id = (String) session.getAttribute("userID");
					String password = request.getParameter("password");
					Connection conn = null;
					Statement stmt = null;
					try {

						System.out.println("id��" + id);
						Class.forName("com.mysql.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
						if (conn == null)
							throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
						stmt = conn.createStatement();
						int rowNum = stmt
								.executeUpdate("DELETE FROM user WHERE userID='" + id + "' AND password='" + password + "';");
						if (rowNum == 1) {
				%>
				ȸ�� Ż�� �Ϸ�Ǿ����ϴ�. <br> <a href="../Main.jsp">��������</a>
				<%
					session.invalidate();
							// ��й�ȣ�� Ʋ����� - ������ �ȵǾ��� ���
						} else {
							System.out.println(rowNum);
				%>
				<script>
					alert("��й�ȣ�� ���� �ʽ��ϴ�.");
					history.go(-1);
				</script>
				<%
					}
					} finally {
						try {
							stmt.close();
						} catch (Exception ignored) {
						}
						try {
							conn.close();
						} catch (Exception ignored) {
						}
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>
