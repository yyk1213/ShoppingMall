<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	Cookie[] cookies = request.getCookies();
%>
<%
	request.setCharacterEncoding("euc-kr");
	Class.forName("com.mysql.jdbc.Driver");
	String content = request.getParameter("input_comment");
	String userID = (String) session.getAttribute("userID");
	String id = getCookieValue(cookies, "boardID");
	int boardID = Integer.parseInt(id);

	if (userID == null) {
%>
<script language=javascript>
	self.window.alert("�α����� �ʿ��մϴ�.");
	location.href = "../UserLogin.jsp?";
</script>
<%
	} else {

		try {

			Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/joy", "root", "1234");

			String command = String.format("insert into comment(userID,boardID, content)values(?,?,?)");
			PreparedStatement pstmt = conn.prepareStatement(command);
			pstmt.setString(1, userID);
			pstmt.setInt(2, boardID);
			pstmt.setString(3, content);

			pstmt.execute();
			pstmt.close();
			conn.close();

		} catch (Exception e) {

			out.println(e.toString());

		}
	}
%>
<%!private String getCookieValue(Cookie[] cookies, String name) {
		String value = null;
		if (cookies == null)
			return null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name))
				return cookie.getValue();
		}
		return null;
	}%>
<script language=javascript>
	self.window.alert("����� ��ϵǾ����ϴ� .");
	location.href = "boardView.jsp?boardID=<%=boardID%>";
</script>