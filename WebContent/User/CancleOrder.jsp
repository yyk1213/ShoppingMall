<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<%
	String id = (String) session.getAttribute("userID");
	String[] orderArray = request.getParameterValues("check");

	Connection conn = null;
	Statement stmt = null;

	try {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
		if (conn == null)
			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");
		stmt = conn.createStatement();

		for (String order : orderArray) {
			int orderId = Integer.parseInt(order);

			int rowNum = stmt.executeUpdate(
					"DELETE FROM joy.order WHERE userID='" + id + "' and orderID=" + orderId + ";");
		}
%>
<script>
				window.opener.alert("���Ű� ��ҵǾ����ϴ�.");
				history.go(-1);
		</script>
<%
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