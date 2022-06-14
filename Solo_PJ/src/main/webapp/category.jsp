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
	<div class="container">
		<div class = "container" style="text-align:center">
			<nav class="navbar navbar-dark bg-dark" aria-label="First navbar example">
			    <div class="container-fluid">
			      <a class="navbar-brand" href="#">Never expand</a>
			      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
			        <span class="navbar-toggler-icon"></span>
			      </button>
			      <div class="collapse navbar-collapse" id="navbarsExample01">
			        <ul class="navbar-nav me-auto mb-2">
			          <li class="nav-item">
			            <a class="nav-link active" aria-current="page" href="#">Home</a>
			          </li>s
			          <li class="nav-item">
			            <a class="nav-link" href="#">Link</a>
			          </li>
			          <li class="nav-item">
			            <a class="nav-link disabled">Disabled</a>
			          </li>
			          <li class="nav-item dropdown">
			            <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">Dropdown</a>
			            <ul class="dropdown-menu" aria-labelledby="dropdown01">
			              <li><a class="dropdown-item" href="#">Action</a></li>
			              <li><a class="dropdown-item" href="#">Another action</a></li>
			              <li><a class="dropdown-item" href="#">Something else here</a></li>
			            </ul>
			          </li>
			        </ul>
			      </div>
			    </div>
			  </nav>
		</div>
	</div>
	
</body>
</html>