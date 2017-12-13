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
					<li class="nav-item"><a class="nav-link" href="SignUp.jsp">회원가입</a></li>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="Login.jsp">로그인</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="MyPage.jsp">My Page</a></li>
					<li class="nav-item"><a class="nav-link" href="Logout.jsp">로그아웃</a></li>
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
						throw new Exception("데이터베이스에 연결할 수 없습니다.");
					stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("select count(*) from joy.order where userID='" + id + "';");
					if (rs.next())
						total = rs.getInt(1);
					rs.close();
					rs = stmt.executeQuery("select * from joy.order where userID='" + id + "';");
			%>
			<div id="content">
				<h2>내 구매목록</h2>
				<table width="70%" cellpadding="0" cellspacing="0" border="0">
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
					<tr height="5">
						<td width="5"></td>
					</tr>
					<tr height="5" align="center">
						<td>&nbsp;</td>
						<td>주문번호</td>
						<td>구매상품번호</td>
						<td>수량</td>
						<td>날짜</td>
					</tr>
					<tr height="1" bgcolor="#82B5DF">
						<td colspan="6" width="752"></td>
					</tr>
					<%
						if (total == 0) {
					%>
					<tr align="center" bgcolor="#FFFFFF" height="30">
						<td colspan="6">구매내역이 없습니다.</td>
					</tr>
					<%
						} else {
								while (rs.next()) {
									int orderNum = rs.getInt("orderID");
									int productID = rs.getInt("productID");
									int number = rs.getInt("number");
									String date = rs.getString("date");
					%>
					<tr height="25" align="center">
					<form action="CancleOrder.jsp" method="post">
						<td><input type="checkbox" value="<%=orderNum%>" name="check"/></td>
						<td><%=orderNum%></td>
						<td><%=productID%></td>
						<td><%=number%></td>
						<td><%=date%></td>
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
					<tr>
					<input type="submit" style="float: right;" value="선택항목 구매취소"/></tr>
				</form>
				</table><br>
				<h2>내 정보수정</h2>
				<FORM ACTION="Reader.jsp" METHOD=GET>
					<INPUT TYPE=SUBMIT VALUE='회원정보수정'>
				</FORM>
				<br>
				<h2>회원탈퇴</h2>
				<FORM ACTION="DeleteForm.jsp" METHOD=GET>
					<INPUT TYPE=SUBMIT VALUE='회원탈퇴'>
				</FORM>
			</div>
		</div>
	</div>
</BODY>
</html>