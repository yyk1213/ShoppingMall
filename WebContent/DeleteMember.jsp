<%@page contentType="text/html; charset=euc-kr" pageEncoding="EUC-KR"
	errorPage="DBError.jsp"%>
<%@page import="java.sql.* "%>
<html>
<head>
    <title>ȸ�� ���� ó��</title>
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
			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
		stmt = conn.createStatement();
		int rowNum = stmt
				.executeUpdate("DELETE FROM user WHERE userID='"+id+"' and password='" + password + "';");
		if (rowNum==1) {
%>
<br>
<br>
<b><font size="4" color="gray">ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.</font></b>
<br>
<br>
<br>

<a href="Main.html">��������</a>
<%
	// ��й�ȣ�� Ʋ����� - ������ �ȵǾ��� ���
session.invalidate();
		} else {
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
</body>
</html>
