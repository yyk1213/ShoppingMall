<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%
	String id = request.getParameter("id");

	Connection conn = null;
	Statement stmt = null;

	try {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
		if (conn == null)
			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
		stmt = conn.createStatement();

		int rowNum = stmt.executeUpdate(
				"DELETE FROM joy.order WHERE orderID='" + id + "';");

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
	response.sendRedirect("ManagerMode.jsp");
%>