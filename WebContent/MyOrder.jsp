<%@ page language="java" contentType="text/html; charset=EUC-KR"
	errorPage="DBError.jsp" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
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
		String sql="select * from user where id="+id;

		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next())
			total = rs.getInt(1);
		rs.close();

		rs = stmt.executeQuery("select * from order where userID ='" + id + "';");

		if (!rs.next()){
			throw new Exception("해당 데이터가 없습니다.");
		}else{
			while(rs.next()){
			int orderNum = rs.getInt("orderNum");
			int productNum = rs.getInt("productNum");
			int number = rs.getInt("number");
			int date = rs.getInt("date");
			request.setAttribute("ORDERNUM", new Integer(orderNum));
			request.setAttribute("PRODUCTNUM", new Integer(productNum));
			request.setAttribute("NUMBER", new Integer(number));
			request.setAttribute("DATE", new Integer(date));
		}
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
	RequestDispatcher dispatcher = request.getRequestDispatcher("MyPage.jsp");
	dispatcher.forward(request, response);
%>