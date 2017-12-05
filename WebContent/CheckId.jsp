<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="DBError.jsp"%>
<%@ page import="java.sql.*" %>
<%
 Connection con = null;
 PreparedStatement pstmt = null;
 ResultSet rs = null;
 
 //id 파라미터의 값을 가져오기
 String id = request.getParameter("id");
 
 try{
  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection(
		  "jdbc:mysql://localhost:3306/joy", "root", "forgod1994!");
  pstmt = con.prepareStatement(
   "select * from user where ID=?");
  pstmt.setString(1, id);
  //아이디가 존재하면 rs.next()가 true를 리턴하고
  //아이디가 존재하지 않는 다면 rs.next()가 false 리턴
  rs = pstmt.executeQuery();
 }
 catch(Exception e){
  out.println(e.getMessage());
 }
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy 로그인</title>
</head>
<body>
 <%
  //아이디가 중복되었을 때 출력
  if(rs.next() ){
 %>
  현재 <%=id %> 사용 불가능<br />
  <form method="get" action="CheckId.jsp"
  id="idCheckForm" onsubmit = "return check()">
   아이디:<input type="text" name="id"
   id="id" />
   <input type="submit" value="중복체크" />
  </form>
 <%}else if(id == null) {%> 
 아이디 다시 선택<br />
  <form method="get" action="CheckId.jsp"
  id="idCheckForm" onsubmit = "return check()">
   아이디:<input type="text" name="id"
   id="id" />
   <input type="submit" value="중복체크" />
  </form>
 <%} else { %>
  현재 <%=id %> 사용 가능<br />
  <form method="get" action="CheckId.jsp"
  id="idCheckForm">
   <a href="CheckId.jsp">다른 아이디 선택</a><br />
   <input type="button" value="현재 아이디 선택"
   onClick="javascript:checkIdClose('<%=id%>')"/>
  </form>
 
 <%} %>
 
 <script>
  function checkIdClose(id){
   //자신을 연 파일의 joinForm에 있는 id의 값을 id로 설정
   opener.signUpForm.id.value=id;
   opener.signUpForm.isCheck.value="true";
   opener.signUpForm.password.focus();
   //현재 창 닫기
   window.close();
  }
  function check(){
   var cid=document.getElementById("id").value;
   if( cid==null || cid.length==0 ){
    alert("아이디는 필수 입력입니다.");
    return false;
   }
  }
 </script>
</body>
</html>

