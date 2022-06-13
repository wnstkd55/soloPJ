<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	//sresponse.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디 이름으로 세션이 존재하는 회원들은
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다

		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}

	
		User user = new User();
		System.out.println(user.getUserID());
		if(!(userID == null)) {
			if (request.getParameter("userName") == null || request.getParameter("userEmail") == null
					|| request.getParameter("userAddress").equals("")
					|| request.getParameter("userRole").equals("")) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} 
			else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.updateUser(request.getParameter("userName"), request.getParameter("userEmail"),
						request.getParameter("userAddress"), request.getParameter("userRole"),userID);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('유저 정보를 수정하였습니다')");
					script.println("location.href='u_info.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>