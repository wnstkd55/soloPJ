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
	//�α��� �ѻ���̸� userID��� ������ �ش� ���̵� ���� �׷��� ������ null��
		String userID = null;
		String userRole = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		UserDAO userDAO = new UserDAO();
		userRole = userDAO.findRole(userID);
		//System.out.println("���̵�: "+userID);
		//System.out.println("����: "+userRole);
	%>
	
<div class= "head">
	<div class = "container">
		<div class = "logo justify-content-center mx-auto">
			<a href = "main.jsp">
				<img class = "img-fluid" alt="�ΰ����" src="./images/pj_logo.png">
			</a>
		</div>
		<nav id="navbar-example2" class="navbar navbar-dark bg-dark">
		  <div class="container justify-content-center">
		  <ul class="nav nav-pills">
		    <li class="nav-item">
		      <a class="nav-link" href="pbbs.jsp">��ǰ�����ϱ�</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">��ǰ�ڶ��ϱ�</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="bbs.jsp">������</a>
		    </li>
		    <%
				//�α��� �ȵȰ��
				if(userID == null) {
			%>
		    <li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">ȸ������</a>
		      <ul class="dropdown-menu">
		        <li><a class="dropdown-item" href="#" style="color:black;">��α��λ����Դϴ�</a></li>
		        <li><hr class="dropdown-divider"></li>
		        <li><a class="dropdown-item" href="join.jsp" style="color:black;">ȸ������</a></li>
		        <li><a class="dropdown-item" href="login.jsp" style="color:black;">login</a></li>
		      </ul>
		    </li>
		    <%
				//�α��� �Ȱ��
				} else if(userID != null) {
					if(userRole.equals("������")){
			%>
			<li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">ȸ������</a>
		      <ul class="dropdown-menu">
		        <li><a class="dropdown-item" href="#" style="color:black;"><%=userID %>�� ȯ���մϴ�!</a></li>
		        <li><a class="dropdown-item" href="#" style="color:black;">ȸ������</a></li>
		        <li><hr class="dropdown-divider"></li>
		        <li><a class="dropdown-item" href="logoutAction.jsp" style="color:black;">logout</a></li>
		      </ul>
		    </li>
		    <%
				}else{
			%>
			<li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">ȸ������</a>
		      <ul class="dropdown-menu">
		        <li><a class="dropdown-item" href="#" style="color:black;"><%=userID %>�� ȯ���մϴ�!</a></li>
		        <li><a class="dropdown-item" href="u_info.jsp" style="color:black;">ȸ������</a></li>
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