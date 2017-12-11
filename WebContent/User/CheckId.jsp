<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="../DBError.jsp"%>
<%@ page import="java.sql.*"%>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	//id �Ķ������ ���� ��������
	String id = request.getParameter("id");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");

		if (con == null)
			throw new Exception("�����ͺ��̽��� ������ �� �����ϴ�.");

		pstmt = con.prepareStatement("select * from user where userID=?");
		pstmt.setString(1, id);
		//���̵� �����ϸ� rs.next()�� true�� �����ϰ�
		//���̵� �������� �ʴ� �ٸ� rs.next()�� false ����
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy ���̵� �ߺ�Ȯ��</title>
</head>
<body>
<div id="content">	
<%
		//���̵� �ߺ��Ǿ��� �� ���
		if (rs.next()) {
	%>
	����
	<%=id%>
	��� �Ұ���
	<br />
	<form method="get" action="CheckId.jsp" id="idCheckForm" onsubmit="return check()">
		���̵�:<input type="text" name="id" id="id" /> <input type="submit" value="�ߺ�üũ" />
	</form>
	<%
		} else if (id == null) {
	%>
	���̵� �ٽ� ����
	<br />
	<form method="get" action="CheckId.jsp" id="idCheckForm" onsubmit="return check()">
		���̵�:<input type="text" name="id" id="id" /> <input type="submit" value="�ߺ�üũ" />
	</form>
	<%
		} else {
	%>
	����
	<%=id%>
	��� ����
	<br />
	<form method="get" action="CheckId.jsp" id="idCheckForm">
		<a href="CheckId.jsp">�ٸ� ���̵� ����</a><br /> <input type="button" value="���� ���̵� ����" onclick="javascript:checkIdClose('<%=id%>')" />
	</form>
	<%
		}
	%>
	<script>
		function checkIdClose(id) {
			opener.SignUpForm.id.value = id;
			opener.SignUpForm.isCheck.value = "true";
			opener.SignUpForm.password.focus();
	
			window.close();
		}
		function check() {
			var cid = document.getElementById("id").value;
			if (cid == null || cid.length == 0) {
				alert("���̵�� �ʼ� �Է��Դϴ�.");
				return false;
			}
		}
	</script>
	</div>
</body>
</html>
