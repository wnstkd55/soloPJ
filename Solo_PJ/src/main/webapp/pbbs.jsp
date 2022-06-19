<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="product.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "user.User" %>
<%@ page import = "user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="./css/style_pbbs.css">
<title>CMM</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}
</style>
</head>
<body>
	<%
		//로긴 한사람이면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		String userRole = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		UserDAO userDAO = new UserDAO();
		userRole = userDAO.findRole(userID);	//유저아이디로 역할 찾기
		
	%>
	<jsp:include page="head.jsp"/>
	<!-- 게시판 -->
	<div class = "board" style = "background-color: #F8F9FA; margin-left: 80px; margin-right:80px;">
		<div class="container">
			<div class="category" style="text-align:center">
					<nav class="navbar navbar-dark bg-dark" aria-label="First navbar example">
					    <div class="container-fluid">
					    <div class="col-sm">
					      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample01" aria-controls="navbarsExample01" aria-expanded="false" aria-label="Toggle navigation">
					        <span class="navbar-toggler-icon"></span>
					      </button>
					      </div>
					      <div class="collapse navbar-collapse" id="navbarsExample01">
					        <ul class="navbar-nav me-auto mb-2">
					          <li class="nav-item">
					            <a class="nav-link active" aria-current="page" href="pbbs_cate.jsp?pdCate=A">Accessory</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link active" aria-current="page" href="pbbs_cate.jsp?pdCate=B">Achol</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link active" aria-current="page" href="pbbs_cate.jsp?pdCate=C">Ceramic</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link active" aria-current="page" href="pbbs_cate.jsp?pdCate=D">Craft</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link active" aria-current="page" href="pbbs_cate.jsp?pdCate=E">DailyTool</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link active" aria-current="page" href="pbbs_cate.jsp?pdCate=F">Dessert</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link active" aria-current="page" href="pbbs_cate.jsp?pdCate=G">Food</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link active" aria-current="page" href="pbbs_cate.jsp?pdCate=H">Clothes</a>
					          </li>
					          <li class="nav-item">
					            <a class="nav-link active" aria-current="page" href="pbbs_cate.jsp?pdCate=I">Perfume</a>
					          </li>
					        </ul>
					      </div>
					    </div>
					  </nav>
				</div>
			<div class="album py-5 bg-light">
			    <div class="container">
			      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
			      	<%
						ProductDAO ppDAO1 = new ProductDAO();
						
						ArrayList<Product> list1 = ppDAO1.getList();
						for (int i = 0; i < list1.size(); i++) {
					%>
			        <div class="col">
			        <a href = "./p_view.jsp?pdId=<%=list1.get(i).getPdId() %>" style="text-decoration:none">
			          <div class="card shadow-sm">
			            	<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="./images/product/<%=list1.get(i).getPdPic()%>" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#55595c"/>
			            <div class="card-body">
			              <span class="card-text" style = "color: black; font-size: 15px;"> <%=list1.get(i).getPdName()%></span><br>
			              <span class="card-text" style = "color: #6C757D; font-size: 13px;"> <%=list1.get(i).getRgId()%></span>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group" style="float: right;">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">작품 자세히보기</button>
			                </div>
			                <small class="text-muted">가격 <%=list1.get(i).getPdPrice()%> 원</small>
			                <small class="text-muted" style="display:none;">가격 <%=list1.get(i).getPdCate()%> 원</small>
			              </div>
			            </div>	
			            </div>
			          </a>
			        </div>
			        <%
			        }
					%>
			      </div>
			    </div>
			  </div>
				
				<!-- 회원만 넘어가도록 -->
				<%
					//if logined userID라는 변수에 해당 아이다가 담기고 if not null
					if (session.getAttribute("userID") != null) {
						if(userRole.equals("관리자") || userRole.equals("판매자")){
							
						
				%><div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a href="regpd.jsp" class="btn btn-outline-primary pull-right">등록하기</a>
				</div>
				<%
						} 
					} else {
				%><div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<button class="btn btn-primary pull-right"
					onclick="if(confirm('로그인 하세요'))location.href='login.jsp';"
					type="button">등록하기</button></div>
					<%
						
					}
				%>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>