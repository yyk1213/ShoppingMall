<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="DBError.jsp"%>
<%@page import="java.sql.*"%>
<%
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String phoneNum = request.getParameter("phoneNum");
	String address = request.getParameter("address");

	if (name == null || id == null || password == null || phoneNum == null)
		throw new Exception("�ʼ������� �Է��ϼ���.");//�˾�

	Connection conn = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
		if (conn == null)
			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
		stmt = conn.createStatement();
		String command = String.format(
				"insert into user(name, userID, password,address,phoneNum) values ( '%s', '%s', '%s','%s','%s');",
				name, id, password, address, phoneNum);
		int rowNum = stmt.executeUpdate(command);
		if (rowNum < 1)
			throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�.");
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
	response.sendRedirect("SignUpResult.jsp");
%>