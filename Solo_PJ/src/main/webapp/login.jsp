<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/style_login.css">
	<script src="js/bootstrap.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" initial-scale="1">
<title>Test1</title>
</head>
<body>

	<jsp:include page="head.jsp" flush = "false"/>
	<div class = "main">
	<!-- 로그인 양식 -->
		<div class="container">		<!-- 하나의 영역 생성 -->
			<div class=loginform>	<!-- 영역 크기 -->
				<!-- 점보트론은 특정 컨텐츠, 정보를 두드러지게 하기 위한 큰 박스 -->
				<div class="jumbotron">
					<form method="post" action="loginAction.jsp">
						<h3 style="text-align: center;">로그인 화면</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
						</div>
						<input type="submit" class="btn btn-primary form-control" value="로그인">
					</form>
				</div>
			</div>	
		</div>
	</div>
	<jsp:include page="footer.jsp" flush = "false"/>
</body>
</html>