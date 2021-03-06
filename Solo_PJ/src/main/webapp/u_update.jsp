<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "user.User" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/style_join.css">
	<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<title> jsp 게시판 웹사이트</title>
</head>
<body>
	<%
	//로그인 한사람이면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		UserDAO userDAO = new UserDAO();
		String userName = null;
		String userEmail = null;
		String userAddress = null;
		String userRole = null;
		
		ArrayList<User> ulist = userDAO.SUserInfoList(userID);
		
		for(int i=0; i<ulist.size(); i++){
			if(userID.equals(ulist.get(i).getUserID())){
				userName = ulist.get(i).getUserName();
				userEmail = ulist.get(i).getUserEmail();
				userAddress = ulist.get(i).getUserAddress();
				userRole = ulist.get(i).getUserRole();
			}
		}
		
		//System.out.println(userName + " " + userEmail+ " " +userAddress+ " " +userRole);
	%>
	
	<jsp:include page="head.jsp"/>
	<!-- 로그인 폼 -->
	<div class="container">
	<div data-aos = "fade-left">
		<div class="input-form-backgroud row">
		      <div class="input-form col-md-12 mx-auto" style="max-width:480px;">
		        <h3 class="mb-2">회원 정보 수정</h3>
		        <br>
		        <form class="validation-form" novalidate method="post" action="UserUpdateAction.jsp">
		          <div class="row">
		            <div class="col-md-6 mb-3">
		              <label for="name">아이디</label>
		              <input type="text" class="form-control" name="userID" placeholder="<%=userID %>" value="<%=userID %>" required readonly>
		              <div class="invalid-feedback">
		                아이디를 입력해주세요.
		              </div>
		            </div>
		            <div class="col-md-6 mb-3">
		              <label for="nickname">이름</label>
		              <input type="text" class="form-control" name="userName" placeholder="<%=userName %>" value="" required>
		              <div class="invalid-feedback">
		                이름을 입력해주세요.
		              </div>
		            </div>
		          </div>
					<div class="mb-3">
		            <label for="password">비밀번호</label>
		            <input type="password" class="form-control" name="userPassword" placeholder="" readonly>
		            <div class="invalid-feedback">
		              비밀번호를 입력해주세요.
		            </div>
		          </div>
		          <div class="mb-3">
		            <label for="email">이메일</label>
		            <input type="email" class="form-control" name="userEmail" placeholder="<%=userEmail %>" required>
		            <div class="invalid-feedback">
		              이메일을 입력해주세요.
		            </div>
		          </div>
		          <div class="mb-3">
		            <label for="address">주소</label>
		            <input type="text" class="form-control" name="userAddress" placeholder="<%=userAddress %>" required>
		            <div class="invalid-feedback">
		              주소를 입력해주세요.
		            </div>
		          </div>
		          <div class="row">
		            <div class="col-md-8 mb-3">
		            	<label for="address">역할</label><br>
			              <div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="userRole"  value="판매자" required>
							  <label class="form-check-label" for="inlineRadio1">판매자</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="userRole"  value="일반회원" required>
							  <label class="form-check-label" for="inlineRadio2">일반회원</label>
							</div>
		            </div>
		          </div>
		          <hr class="mb-4">
		          <div class="custom-control custom-checkbox">
		            <input type="checkbox" class="custom-control-input" id="aggrement" required>
		            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
		          </div>
		          <div class="mb-4"></div>
		          <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		          <button class="btn btn-outline-primary" type="submit">수정 완료</button>
		          </div>
		        </form>
		      </div>
		    </div>
		</div>
	</div>
	<script>
		AOS.init();
	</script>
	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
	<jsp:include page="footer.jsp"/>
</body>
</html>