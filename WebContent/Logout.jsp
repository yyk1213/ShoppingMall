<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
session.invalidate();
response.sendRedirect("Main.jsp");
%>
<script>
self.window.alert("�α׾ƿ� �Ǿ����ϴ�.");
location.href("Main.jsp");
</script>