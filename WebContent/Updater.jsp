<%@page contentType= "text/html; charset=euc-kr" errorPage= "../DBError.jsp" %>
<%@page import= "java.sql.* "%>
<%
        String name = request.getParameter("name");
        String ID = request.getParameter("id");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String phoneNum = request.getParameter("phoneNum");
        if (name == null || ID == null || password == null || address == null|| phoneNum==null)
                throw new Exception( "�ʼ������� �Է����ּ���");
        Connection conn = null;
        Statement stmt = null;
        try {
                Class.forName( "com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root","forgod1994!");
                if (conn == null)
                        throw new Exception( "�����ͺ��̽��� ������ �� �����ϴ�.");
                stmt = conn.createStatement();
                String command = String.format( "update user set name := '%s', ID := '%s', password := '%s', address :='%s',phoneNum :='%s' where ID = '%s';",
                                                                                                                              name, ID, password, address,phoneNum, ID);
                int rowNum = stmt.executeUpdate(command);
                if (rowNum < 1)
                        throw new Exception( "�����͸� DB�� �Է��� �� �����ϴ�.");
        }
        finally {
                try {
                        stmt.close();
                }
                catch (Exception ignored) {
                }
                try {
                        conn.close();
                }
                catch (Exception ignored) {
                }
        }
        response.sendRedirect( "UpdateResult.jsp?ID= " + ID);
%>