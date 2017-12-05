<%@page contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"
	errorPage="DBError.jsp"%>
<%@page import="java.sql.* "%>
<html>
<head>
    <title>회원 삭제 처리</title>
</head>
<body>
<%
	Connection conn = null;
	Statement stmt = null;
	try {
		String id = (String) session.getAttribute("id");
		String password = request.getParameter("password");
		System.out.println(id);
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
		if (conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		int rowNum = stmt
				.executeUpdate("DELETE FROM user WHERE userID='"+id+"' and password='" + password + "';");
		if (rowNum==1) {
%>
<br>
<br>
<b><font size="4" color="gray">회원 탈퇴가 완료되었습니다.</font></b>
<br>
<br>
<br>

<a href="Main.html">메인으로</a>
<%
	// 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
session.invalidate();
		} else {
%>
<script>
	alert("비밀번호가 맞지 않습니다.");
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
</body>
</html>
