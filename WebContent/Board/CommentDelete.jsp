<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	Cookie[] cookies = request.getCookies();
%>
<%
	int commentID = Integer.parseInt(request.getParameter("commentID"));

	String bid = getCookieValue(cookies, "boardID");
	int boardID = Integer.parseInt(bid);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/joy", "root", "forgod1994!");
	Statement stmt = conn.createStatement();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994");

	String sql = "delete from comment where commentID=? and boardID=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, commentID);
	pstmt.setInt(2, boardID);
	pstmt.executeUpdate();

	pstmt.close();
	conn.close();
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
 self.window.alert("댓글을 삭제했습니다.");
 location.href="boardView.jsp?boardID=<%=boardID%>";
</script>