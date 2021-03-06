<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>

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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<link rel="stylesheet" href="javascript/jquery-1.12.3.js">
<link rel="stylesheet" href="css/style.css">
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
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; //기본 페이지 넘버

		//페이지 넘버값이 있을때
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<jsp:include page="head.jsp"/>
	<br>
	<!-- 게시판 -->
	<div class = "board">
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1ps solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>">
						<%=list.get(i).getBbsTitle()%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate() %></td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<!-- 페이지 넘기기 -->
			<%
				if (pageNumber != 1) {
			%><div class="d-grid gap-2 d-md-flex justify-content-md-center">
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-outline-secondary"><i class="bi bi-arrow-left-square-fill">이전</i></a></div>
				<br>
			<%
				}
				if (bbsDAO.nextPage(pageNumber)) {
			%><div class="d-grid gap-2 d-md-flex justify-content-md-center">
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-outline-secondary "><i class="bi bi-arrow-right-square-fill">다음</i></a></div>
				<br>
			<%
				}
			%>
			<!-- 회원만 넘어가도록 -->
			<%
				//if logined userID라는 변수에 해당 아이다가 담기고 if not null
				if (session.getAttribute("userID") != null) {
			%><div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="write.jsp" class="btn btn-secondary">글쓰기</a></div>
			<%
				} else {
			%><div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-secondary"
				onclick="if(confirm('로그인 하세요'))location.href='login.jsp';"
				type="button">글쓰기</button></div>
				<%
				}
			%>

		</div>
	</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>