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
<link rel="stylesheet" href="css/style_head.css">
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
		          <li><a href="main.jsp" class="nav-link px-2 link-secondary">����</a></li>
		          <li><a href="pbbs.jsp" class="nav-link px-2 link-dark">�����Ϸ�����</a></li>
		          <li><a href="#" class="nav-link px-2 link-dark">�ڶ��ϱ�</a></li>
		          <li><a href="bbs.jsp" class="nav-link px-2 link-dark">������</a></li>
		        </ul>
		    
					<%
						//�α��� �ȵȰ��
						if(userID == null) {
					%>
						<div class="dropdown text-end">
					          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
					            <img src="./images/user1.png" alt="user" width="32" height="32" class="rounded-circle">
					          </a>
					          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
					            <li><a class="dropdown-item" href="login.jsp">�α���</a></li>
					            <li><a class="dropdown-item" href="join.jsp">ȸ������</a></li>
					          </ul>
		       		 	</div>
	       		 	
					<%
						//�α��� �Ȱ��
						} else if(userID != null) {
							if(userRole.equals("������")){
								
							
					%>
						 <div class="dropdown text-end">
					          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
					            <img src="./images/user1.png" alt="user" width="32" height="32" class="rounded-circle">
					          </a>
					          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
					            <li><a class="dropdown-item" href="#">ȸ������</a></li>
					            <li><a class="dropdown-item" href="logoutAction.jsp">�α׾ƿ�</a></li>
					          </ul>
		       		 	</div>
	       		 	
					<%
						}else{
					%>
						<div class="dropdown text-end">
					          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
					            <img src="./images/user1.png" alt="user" width="32" height="32" class="rounded-circle">
					          </a>
					          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
					            <li><a class="dropdown-item" href="u_info.jsp">ȸ������</a></li>
					            <li><a class="dropdown-item" href="logoutAction.jsp">�α׾ƿ�</a></li>
					          </ul>
		       		 	</div>
					
					<%
							}
						}
					%>
					
				</div>
				</div>
			</div>
		</header>
	</div>
</body>
</html>