<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*" %>
<html>
<head>

<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<title>제품 상세보기</title></head>

<body>
<div id="wrapper">
	<div id="container">
		<div id="header">
			<a href=""><img src="images/joy.jpg" style="float:left;height:100%; "></a>
			<ul class="nav justify-content-end" >
				<li class="nav-item">
    				<a class="nav-link" href="#">로그인</a>
  				</li>
  				<li class="nav-item">
   					 <a class="nav-link" href="#">회원가입</a>
  				</li>
  				<li class="nav-item">
    				<a class="nav-link" href="#">My Page</a>
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
		</div>

		<div id="content">
<% 
Class.forName("com.mysql.jdbc.Driver");
String productname=request.getAttribute("productname").toString();
try{
	Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/joy", "root", "1234");
	Statement stmt=conn.createStatement();
	String sql="SELECT productname, price,stock, category from product where productname="+productname;
	ResultSet rs=stmt.executeQuery(sql);
	
	if(rs.next()){
		int price= rs.getInt(2);
		int stock=rs.getInt(3);
		String category=rs.getString(4);
		
		
	}

%>

</div>
</div>

</body>
</html>