<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous"><title>게시글 작성하기</title></head>
<body>
<ul class="nav justify-content-end">
  <li class="nav-item">
    <a class="nav-link active" href="#">로그인</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">회원가입</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">My Page</a>
  </li>
  <li class="nav-item">
    <a class="nav-link disabled" href="#">Disabled</a>
  </li>
</ul>
<div class="container col-9"> 
         <div class="index-content" > 
           <h3 style="text-align:left; color:#5D5D5D;">글쓰기</h3> 
           <hr> 
           <div class="new-content" > 
             <form action=boardNew.jsp METHOD=POST> 
             
               <label for="titlearea" class="input-label">title</label> 
               <input name="title" class="form-control form-control-sm" id="titlearea" type="text"> 
               <br> 
               <br> 
               <label for="contentarea" class="input-label">content</label> 
               <textarea name="content" class="form-control" id="contentarea tippost_content" rows="7"></textarea> 
               <br> 
               <hr> 
             </div> 
               <hr> 
               <button type="submit" class="btn btn-secondary btn-sm" style="float:right;">등록</button> 
               </form>
            
            <form action=boardList.jsp method="GET"> 
               <button type="submit" class="btn btn-secondary btn-sm" style="float:left;">list</button> 
             </form> 
            
         </div> 
      </div> 
</body>
</html><%
if(session.getAttribute("userID")==null){

%>
<script language=javascript>
 self.window.alert(" 로그인이 필요합니다.  .");
 location.href="Login.jsp";
 </script><%
}else
response.addCookie(new Cookie("writer",session.getAttribute("userID").toString()));
%>
