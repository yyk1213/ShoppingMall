<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy MyPage</title>
</head>
<BODY>
	<%
		int total = 0;
		Connection conn = null;
		Statement stmt = null;

		try {
			String id = (String) session.getAttribute("id");
			String password = (String) session.getAttribute("password");
			System.out.println(id);

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
			if (conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			stmt = conn.createStatement();
			String sql="select count(*) from order where userID ='"+id+"';";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next())
				total = rs.getInt(1);
			rs.close();
			String sql1="select count(*) from order where userID='"+id+"';";
			rs = stmt.executeQuery(sql1);
	%>
	<H3>내 구매목록</H3>
	<table width="70%" cellpadding="0" cellspacing="0" border="0">

		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
		<tr height="5">
			<td width="5"></td>
		</tr>
		<tr height="5">
			<td>&nbsp;</td>
			<td width="73">번호</td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
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
								int orderNum = rs.getInt("orderNum");
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

			<H3>내 정보수정</H3>
			<FORM ACTION="Reader.jsp" METHOD=GET>
				<INPUT TYPE=SUBMIT VALUE='회원정보수정'>
			</FORM>
			<H3>회원탈퇴</H3>
			<FORM ACTION="DeleteForm.jsp" METHOD=GET>
				<INPUT TYPE=SUBMIT VALUE='회원탈퇴'>
			</FORM>
</BODY>
</html>