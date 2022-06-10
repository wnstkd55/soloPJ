<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="pbbs.ProductDAO"%>
<%@ page import="pbbs.Product"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<link rel="stylesheet" href="javascript/jquery-1.12.3.js">
<link rel="stylesheet" href="css/style_pbbs.css">
<title>jsp 게시판 웹사이트</title>
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
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
	%>
	<jsp:include page="head.jsp"/>
	<!-- 게시판 -->
	<div class = "board">
		<div class="container">
			<div class="row">
			<!-- 
				<table class="table table-striped"
					style="text-align: center; border: 1ps solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
							<th style="background-color: #eeeeee; text-align: center;">작품이름</th>
							<th style="background-color: #eeeeee; text-align: center;">등록한사람</th>
							<th style="background-color: #eeeeee; text-align: center;">간단설명</th>
							<th style="background-color: #eeeeee; text-align: center;">가격</th>
						</tr>
					</thead>
					<tbody>
						<%
							ProductDAO ppDAO = new ProductDAO();
							
							ArrayList<Product> list = ppDAO.getList();
							for (int i = 0; i < list.size(); i++) {
								
						%>
						<tr>
							<td><%=list.get(i).getPcode()%></td>
							<td><%=list.get(i).getPname()%></td>
							<td><%=list.get(i).getRegid()%></td>
							<td><%=list.get(i).getPinfo()%></td>
							<td><%=list.get(i).getPprice()%></td>
							</tr>
						<%
							}
						%>
					</tbody>
				</table>
				 -->
	
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
			        <a href = "#">
			          <div class="card shadow-sm">
			            	<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="./images/<%=list.get(i).getPcode()%>.jpg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#55595c"/>
			            <div class="card-body">
			              <p class="card-text"><%=list1.get(i).getPinfo()%></p>
			              <p class="card-text">작가이름 <%=list1.get(i).getRegid()%></p>
			              <div class="d-flex justify-content-between align-items-center">
			                <div class="btn-group">
			                  <button type="button" class="btn btn-sm btn-outline-secondary">즉시구매하기</button>
			                </div>
			                <small class="text-muted">가격 <%=list1.get(i).getPprice()%> 원</small>
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
				%>
				<a href="#" class="btn btn-primary pull-right">등록하기</a>
				<%
					} else {
				%>
				<button class="btn btn-primary pull-right"
					onclick="if(confirm('로그인 하세요'))location.href='login.jsp';"
					type="button">등록하기</button>
					<%
					}
				%>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>