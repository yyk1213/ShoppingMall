<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>
<html>
<head>

<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<title>��ǰ �󼼺���</title></head>

<body>
<div id="wrapper">
	<div id="box">
		<div id="header">
<a href="Main.jsp">
<input type="image" src="images/joy.jpg" style="float:left;height:100%; "></a>
<ul class="nav justify-content-end">
  <li class="nav-item">
    <a class="nav-link active" href="Login.jsp">�α���</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="SignUp.html">ȸ������</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="MyPage.jsp">My Page</a>
  </li>

</ul>
</div>

		<div id="menu">
<nav class="nav flex-column">
  <a class="nav-link" href="product.jsp">All</a>
  <a class="nav-link" href="top.jsp">Top</a>
  <a class="nav-link" href="bottom.jsp">Bottom</a>
  <a class="nav-link" href="boardList.jsp">Board</a>
</nav>
</div>

		<div id="content">
<% 
Class.forName("com.mysql.jdbc.Driver");
int productID=Integer.parseInt(request.getParameter("productID"));
try{
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/joy", "root", "forgod1994!");
	Statement stmt=conn.createStatement();
	String sql="SELECT productname, price,stock, category from product where productID="+productID;
	ResultSet rs=stmt.executeQuery(sql);
	
	if(rs.next()){
		String productname=rs.getString(1);
		int price= rs.getInt(2);
		int stock=rs.getInt(3);
		String category=rs.getString(4);
%>
<div id="pic">
<input type="image" src="http://localhost:8080/DB_final/DisplayImage?id=<%=productID%>" width="40%" >
</div>
<div id="detail">
	<p>
		<h2><%=productname %></h2>
		price: <%=price %>
	</p>
	<form name="productnum" id="productnum" action="buy.jsp">
		����:<input type="number" id="number" name="number" required> <input type="submit" text="�ֹ��ϱ�">
	</form>
</div>
</div>
</div>

		</div>
<script>

window.onload=function(){
	//submit�� ������ �� ȣ��� �Լ�����
	document.getElementById("productnum").onsubmit=function(){
		//id���� ������ �������� �ʱ�
		var snum=document.getElementById("number").value;
		if(snum==null ||snum.length==0){
			alert("������ �ʼ� �Է��Դϴ�.");
			return false;
		}else if(snum<0){
			alert("����� �Է��ϼ��� ");
			return false;
		}
		else if(snum.getClass().getName!="int"){
			alert("���ڸ� �Է��ϼ���");
			return false;
		}
		return true;
	}
}
</script>
</body>
</html>
	<% 
	String id=Integer.toString(productID);
	response.addCookie(new Cookie("productID",id));
	}
 	rs.close();
 	stmt.close();
 	conn.close();
	 	
	}catch(SQLException e) {
}
%>