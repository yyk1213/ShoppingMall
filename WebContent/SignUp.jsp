<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="DBError.jsp"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Joy 회원가입</title>
</head>
<body>
	<div id="wrapper">
		<div id="box">
			<div id="header">
				<a href="Main.jsp"><img src="/DB_final/DB_image/Joy_logo.png" style="float: left; height: 100%;"></a>
			<ul class="nav justify-content-end">
			<li class="nav-item">
					<li class="nav-item"><a class="nav-link" href="Login.jsp">로그인</a>
					</li>
					</ul>	
			</div>
			<div id="menu">
				<nav class="nav flex-column">
					<a class="nav-link" href="product.jsp">All</a> <a class="nav-link" href="top.jsp">Top</a> <a class="nav-link" href="bottom.jsp">Bottom</a> <a class="nav-link" href="boardList.jsp">Board</a>
				</nav>
			</div>
<script>
	window.onload = function IDCheck(){
		document.getElementById("isCheck").value = "false";
		document.getElementById("checkId").onclick = function() {
			var sid = document.getElementById("id").value;
			if (sid == null || sid.length == 0) {
				alert("아이디를 입력하고 검사하세요");
			} else {
				window
					.open("CheckId.jsp?id=" + sid, "",
						"width=400 height=400");
			}
		}
		//id 란에 포커스가 오면 중복체크를 다시 하도록 isCheck의 값을 변경
		document.getElementById("id").onblur = function() {
			document.getElementById("isCheck").value = "false";
		}
	}
</script>
<div id="content">
	<H4>회원 정보를 입력하세요</H4>
	<FORM ACTION=SignUpProcess.jsp Method=POST>
		<input type="hidden" id="isCheck" /> 아이디:<INPUT
			TYPE=TEXT NAME=id id="id" required><input type="button"
			value="중복확인" id="checkId"/> <BR> 패스워드:<INPUT TYPE=PASSWORD
			NAME=password id="password" required><BR> 이름:<INPUT
			TYPE=TEXT NAME=name id="name" required><BR> 전화번호:<INPUT
			TYPE=TEXT NAME=phoneNum id="phoneNum" required><BR> 주소:<INPUT
			TYPE=TEXT NAME=address id="address" required><BR> <INPUT
			TYPE="SUBMIT" VALUE='회원가입'> <INPUT TYPE="RESET" VALUE='취소'>
	</FORM>
	</div>
	</div>
	</div>
</body>
</html>