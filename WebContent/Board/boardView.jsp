<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<title>Joy 게시글 보기</title>
</head>
<body>
	<div id="wrapper">
		<div id="container">
			<div id="header">
				<a href="../Main.jsp"><img src="../images/joy.png" style="float: left; height: 100%;"></a>
				<ul class="nav justify-content-end">
					<%
						String UserID = (String) session.getAttribute("userID");
						if (UserID == null) {
					%>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="User/SignUp.jsp">회원가입</a></li>
					<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="User/Login.jsp">로그인</a></li>
					<%
						} else {
					%>
					<li class="nav-item"><a class="nav-link" href="User/MyPage.jsp">My Page</a></li>
					<li class="nav-item"><a class="nav-link" href="User/Logout.jsp">로그아웃</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div id="menu">
				<nav class="nav flex-column">
					<a class="nav-link disabled" href="../Product/product.jsp">All</a> <a class="nav-link disabled" href="../Product/top.jsp">Top</a> <a class="nav-link disabled" href="../Product/bottom.jsp">Bottom</a> <a class="nav-link disabled" href="boardList.jsp">Board</a>
				</nav>
			</div>
			<%
				Class.forName("com.mysql.jdbc.Driver");

				int boardID = Integer.parseInt(request.getParameter("boardID"));
				String currentUser = (String) session.getAttribute("userID");
				try {
					Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/joy", "root", "forgod1994!");
					Statement stmt = conn.createStatement();
					String sql = "SELECT TITLE, CONTENT, WRITER,HIT FROM board WHERE boardID=" + boardID;
					ResultSet rs = stmt.executeQuery(sql);

					if (rs.next()) {
						String title = rs.getString(1);
						String content = rs.getString(2);
						String writer = rs.getString(3);
						int hit = rs.getInt(4);
						hit++;
			%>
			<div class="container col-7" id="content">
				<!-- 내용 -->
				<div>
					<h3>자유 게시판</h3>
					<p class="show-top1" style="border-bottom: 1px solid; border-top: 2px solid;">
						subject &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=title%></p>
					<p class="show-top2" style="border-bottom: 1px solid">
						writer &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=writer%></p>
					<p class="show-top2" style="border-bottom: 1px solid">
						hit &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=hit%></p>
					<p style="margin-top: 2em; margin-bottom: 5em;"><%=content%></p>
				</div>
				<%
					String sql2 = "update board set hit=" + hit + " where boardID=" + boardID;
							stmt.executeUpdate(sql2);
				%>
				<div style="border-top: 2px solid">
					<form action=boardList.jsp method="GET">
						<button type="submit" class="btn btn-secondary btn-sm" style="float: left;">list</button>
					</form>
					<%
						if (currentUser.equals(writer)) {
					%>
					<form action=boardList.jsp method="GET">
						<button type="submit" class="btn btn-secondary btn-sm" style="float: right;" formmethod="POST" data-confirm="글을 삭제합니다">delete</button>
					</form>
					<form action=boardList.jsp method="GET">
						<button type="submit" class="btn btn-secondary btn-sm" style="float: right;">edit</button>
					</form>
					<%
						}
							}

							rs.close();
					%>
				</div>
				<br>
				<hr>
				<form action="comment.jsp" method="POST">
					<input type="text" class="form-control" name="input_comment" placeholder="comment" style="width: 30em; height: 1.8em; display: inline;">
					<button type="submit" class="btn btn-secondary btn-sm">등록</button>
				</form>
				<br>
				<hr>
				<%
					sql = "select commentID, userID, content from comment where boardID=" + boardID;
						ResultSet rs2 = stmt.executeQuery(sql);
						while (rs2.next()) {
							int commentID = rs2.getInt(1);
							String userID = rs2.getString(2);
							String content = rs2.getString(3);
							if (userID != null) {
				%>
				<tr height="25" align="center">
					<td>&nbsp;</td>
					<td><%=userID%>:</td>
					<td align="left"><%=content%></a></td>
					<%
						if (currentUser != null) {
										if (currentUser.equals(userID)) {
					%>
					<td align="left">
						<form action=CommentDelete.jsp?commentID= <%=commentID%> method="POST">
							<button type="submit" class="btn btn-secondary btn-sm" style="float: right;" formmethod="POST" data-confirm="댓글을 삭제합니다">delete</button>
						</form>
					</td>
					<%
						}
					%>
				</tr>
				<tr height="1" bgcolor="#D2D2D2">
					<td colspan="6"></td>
				</tr>
				<br>
				<hr>
				<%
					}
							}
							String id = Integer.toString(boardID);
							response.addCookie(new Cookie("boardID", id));

							rs.close();
							rs2.close();
							stmt.close();
							conn.close();

						}
					} catch (SQLException e) {
					}
				%>
			</div>
		</div>
</body>
</html>
