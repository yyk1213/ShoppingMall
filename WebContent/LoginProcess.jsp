<%@ page language="java" contentType="text/html; charset=EUC-KR"
	errorPage="DBError.jsp"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
		if (conn == null)
			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
		stmt = conn.createStatement();
		ResultSet result = stmt
				.executeQuery("select userID from user where userID='" + id + "' and password='" + password + "' ;");
		if (!result.next()) {
			throw new Exception("�ش� �����Ͱ� �����ϴ�.");//�˾�
	} else {
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			response.sendRedirect("Main.html");
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