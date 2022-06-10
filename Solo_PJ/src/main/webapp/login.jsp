<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 부트스트랩 참조 영역 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/style_login.css">
	<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" initial-scale="1">
<title>Test1</title>
</head>
<body class = "text-center">
	<jsp:include page="head.jsp" flush = "false"/>
		<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
		<main class="form-signin">
		<div class = "login">
			<div data-aos = "fade-left">
			  <form method="post" action="loginAction.jsp">
			    <h1 class="h3 mb-3 fw-normal">Login Page</h1>
			
			    <div class="form-floating">
			      <input type="text" class="form-control" name="userID" placeholder="ID">
			      <label for="floatingInput">id</label>
			    </div>
			    <div class="form-floating">	
			      <input type="password" class="form-control" name="userPassword" placeholder="Password">
			      <label for="floatingPassword">Password</label>
			    </div>
			    <div class="checkbox mb-3">
			      <label>
			        <input type="checkbox" value="remember-me"> Remember me
			      </label>
			    </div>
			    	<button style ="width:100px;" class="btn btn-primary form-control" type="submit">Sign in</button>
					<button type="button" style ="width:100px;" class="btn btn-primary form-control" onclick="location.href='join.jsp'" >Join in</button>
			    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
			  </form>
			  </div>
		  </div>
	</main>
	<script>
		AOS.init();
	</script>
	<jsp:include page="footer.jsp" flush = "false"/>
</body>
</html>