<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/style_head.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	//로그인 한사람이면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
	
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<!-- 네비게이션 -->
	<!-- 
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span><span class="icon-bar"></span><span
					class="icon-bar"></span>
			</button>
			</div>
			<div class="collaspe navbar-collapse"
				id="#bs-example-navbar-collapse-1">
	 -->
	<div class = "head">
	  <header class="p-3 mb-3 border-bottom">
	    <div class="container">
	      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	      	<div class = logo>
				<a href="main.jsp" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
		          	<img alt="logo" src="./images/sp_logo.png" width = 300>
		        </a>
          	</div>
		        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
		          <li><a href="main.jsp" class="nav-link px-2 link-secondary">메인</a></li>
		          <li><a href="pbbs.jsp" class="nav-link px-2 link-dark">구매하러가기</a></li>
		          <li><a href="#" class="nav-link px-2 link-dark">자랑하기</a></li>
		          <li><a href="bbs.jsp" class="nav-link px-2 link-dark">고객센터</a></li>
		        </ul>
		    
					<%
						//로그인 안된경우
						if(userID == null) {
					%>
				
					
						<div class="dropdown text-end">
					          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
					            <img src="./images/user1.png" alt="user" width="32" height="32" class="rounded-circle">
					          </a>
					          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
					            <li><a class="dropdown-item" href="login.jsp">로그인</a></li>
					            <li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
					          </ul>
		       		 	</div>
		       		 	
	       		 	
					<%
						//로그인 된경우
						} else {
					%>
						 <div class="dropdown text-end">
					          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
					            <img src="./images/user1.png" alt="user" width="32" height="32" class="rounded-circle">
					          </a>
					          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
					            <li><a class="dropdown-item" href="#">회원관리</a></li>
					            <li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
					          </ul>
		       		 	</div>
	       		 	
					<%
						}
					%>
				</div>
				</div>
			</div>
		</header>
	</div>
</body>
</html>