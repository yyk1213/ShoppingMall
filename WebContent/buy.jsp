<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%Cookie[] cookies=request.getCookies(); %>
<%
request.setCharacterEncoding("euc-kr");

Class.forName( "com.mysql.jdbc.Driver");
request.setCharacterEncoding("euc-kr");

int productID=Integer.parseInt(getCookieValue(cookies,"productID"));
String productname=getCookieValue(cookies,"productname");

int number=Integer.parseInt(request.getParameter("number"));
String userID = (String) session.getAttribute("userID");
String password = (String) session.getAttribute("password");
String currentUser=(String)session.getAttribute("userID");

Date d=new Date();
String date=d.toString();
int newstock=0;


if(userID==null){
%>
<script language=javascript>
self.window.alert("로그인이 필요합니다.");
location.href="Login.jsp?";
</script>
<% }
else{


try {

Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/joy", "root", "1234");

	Statement stmt=conn.createStatement();
	PreparedStatement pstmt;
	ResultSet rs=null;
	pstmt=conn.prepareStatement("SELECT stock FROM product WHERE  productID =?");
	pstmt.setInt(1,productID);
	rs=pstmt.executeQuery();
	
	if (!rs.next())
		throw new Exception("해당 데이터가 없습니다.");
	else{
		int stock=rs.getInt(1);
		newstock=stock-number;
		
		if(newstock<0){
			%> 
			
			 <script language=javascript>
			 self.window.alert("재고가 부족합니다. 죄송합니다 .");
			 location.href="Main.jsp?";
			 </script>
			 <% 
		}
		else{
			String sql2="update product set stock ="+newstock+" where productID ="+productID;
			stmt.executeUpdate(sql2);
			String command=String.format("insert into order (userID, productID, number) values (?,?,?);");
			pstmt= conn.prepareStatement(command);
			pstmt.setString(1,userID);
			pstmt.setInt(2,productID);
			pstmt.setInt(3,number);
			pstmt.execute();   }
		
		}
		
	

	rs.close();
	stmt.close();
	conn.close();
   


} catch (Exception e) {

   out.println(e.toString());


}}


 %>
 <%!
 private String getCookieValue(Cookie[] cookies, String name){
		String value=null;
		if(cookies==null) return null;
		for(Cookie cookie:cookies){
			if(cookie.getName().equals(name)) return cookie.getValue();}
		return null;
		} 
%>
 <!-- <script language=javascript>
 self.window.alert("주문 완료되었습니다 .");
 location.href="boardList.jsp?";
 </script>
 -->