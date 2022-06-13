<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO"%>
<%@ page import = "product.Product" %>
<%@ page import="java.io.PrintWriter"%>
<!-- 자바 클래스 사용 -->
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null){//유저 아이디 이름으로 세션이 존재하는 회원들은
		userID = (String)session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
	}
	
		
	if(!(userID == null)){
		 
			Product pp = new Product();
			ProductDAO ppDAO = new ProductDAO();
			int result = ppDAO.register(request.getParameter("pdName"), request.getParameter("rgId"), 
					Integer.parseInt(request.getParameter("pdPrice")), request.getParameter("pdPic"), request.getParameter("pdExp"),
					request.getParameter("pdCate"));
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('등록에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('등록 하였습니다')");
				script.println("location.href='pbbs.jsp'");
				script.println("</script>");
			
		}
	}
	%>
</body>
</html>