<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mysql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>top</title>
</head>
<body>
<div id="wrapper">
	<div id="box">
		<div id="header">
			<a href="Main.jsp"><img src="images/joy.jpg" style="float:left;height:100%; "></a>
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

<h2>TOP</h2>
 <!-- <div class="row"> -->
 
 
 
 <div class="album text-muted">
      <div class="container">

        <div class="row">
          
          
        
 

<% 
Blob img = null;
byte[] imgdata=null;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
	Class.forName( "com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/joy", "root","forgod1994!");	
	stmt = conn.createStatement();
	rs= stmt.executeQuery("select productID, productname, price from product where category='top';");

  
	while(rs.next()){
	 int productID= rs.getInt(1);
	 String productname= rs.getString(2);
	 int price=rs.getInt(3);

%><a href="productdetail.jsp?productID=<%=productID %>">
<div class="card">
<input type="image" src="http://localhost:8080/DB_final/DisplayImage?id=<%=productID%>" width="210" height="210">
            <p class="card-text"><%=productname %></p>
            <p class="card-text">price:<%=price%>원</p>
          </div></a>
          
 <!--  <div class="col-sm-1">
    <div class="card" style="width: 20rem;">
 		 <input type="image" src="http://localhost:8080/DB_final/DisplayImage?id=<%=productID%>" width="200" height="300">
      <div class="card-body">
        <h4 class="card-title"><%=productname %></h4>
        <p class="card-text"><%=price %></p>
        <a href="productdetail.jsp?productID=<%=productID %>" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
  </div> -->
  
  


<%

}
rs.close();
stmt.close();
conn.close();
} catch(SQLException e) {
out.println( e.toString() );
}

%>
</div>

      </div>
    </div>
  </div>
</div>
<!-- 
</div> -->




</body>
</html>