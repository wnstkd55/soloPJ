<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import = "user.User" %>
<%@ page import = "user.UserDAO" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userRole" />
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/style_head2.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	//로그인 한사람이면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		String userRole = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		UserDAO userDAO = new UserDAO();
		userRole = userDAO.findRole(userID);
		//System.out.println("아이디: "+userID);
		//System.out.println("역할: "+userRole);
	%>
	
<div class= "head">
	<div class = "container">
		<div class = "logo justify-content-center mx-auto">
			<a href = "main.jsp">
				<img class = "img-fluid" alt="로고사진" src="./images/pj_logo.png">
			</a>
		</div>
		<nav id="navbar-example2" class="navbar navbar-dark bg-dark">
		  <div class="container justify-content-center">
		  <ul class="nav nav-pills">
		    <li class="nav-item">
		      <a class="nav-link" href="pbbs.jsp">작품구경하기</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">작품자랑하기</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="bbs.jsp">고객센터</a>
		    </li>
		    <%
				//로그인 안된경우
				if(userID == null) {
			%>
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">회원정보</a>
		      <ul class="dropdown-menu">
		        <li><a class="dropdown-item" href="#" style="color:black;">비로그인상태입니다</a></li>
		        <li><hr class="dropdown-divider"></li>
		        <li><a class="dropdown-item" href="join.jsp" style="color:black;">회원가입</a></li>
		        <li><a class="dropdown-item" href="login.jsp" style="color:black;">login</a></li>
		      </ul>
		    </li>
		    <%
				//로그인 된경우
				} else if(userID != null) {
					if(userRole.equals("관리자")){
			%>
			<li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">회원정보</a>
		      <ul class="dropdown-menu">
		        <li><a class="dropdown-item" href="#" style="color:black;"><%=userID %>님 환영합니다!</a></li>
		        <li><a class="dropdown-item" href="#" style="color:black;">회원관리</a></li>
		        <li><hr class="dropdown-divider"></li>
		        <li><a class="dropdown-item" href="logoutAction.jsp" style="color:black;">logout</a></li>
		      </ul>
		    </li>
		    <%
				}else{
			%>
			<li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">회원정보</a>
		      <ul class="dropdown-menu">
		        <li><a class="dropdown-item" href="#" style="color:black;"><%=userID %>님 환영합니다!</a></li>
		        <li><a class="dropdown-item" href="u_info.jsp" style="color:black;">회원정보</a></li>
		        <li><hr class="dropdown-divider"></li>
		        <li><a class="dropdown-item" href="logoutAction.jsp" style="color:black;">logout</a></li>
		      </ul>
		    </li>
			<%
					}
				}
			%>
		  </ul>
		  </div>
		</nav>
	</div>
	</div>
</body>
</html>