<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.User" %>

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
<link rel="stylesheet" href="css/style_cart.css">
<title>CMM</title>
</head>
<body>
	<jsp:include page="head.jsp" flush="false"/>
	<% 
		//로긴 한사람이면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<%
		UserDAO userDAO = new UserDAO();
		ArrayList<User> ulist = userDAO.getUList();
		
	%>
	<br> 		
	<div class = "cart">
		<div class = "container" style = "background-color : #f8f9fa;">	
			<h3>멤버리스트</h3>
			<table style="margin-left: auto; margin-right: auto; width:1000px; margin-bottom: 50px;">
			    <thead>
			    <tr>
			    	<th>유저 아이디</th>
			        <th>유저 이름</th>
			        <th>유저 이메일</th>
			        <th>유저 주소</th>
			        <th>유저 역할</th>
			    </tr>
			    </thead>
			    <tbody>
			    <tr>
			        <td colspan="5">
			        </td>
			    </tr>
			    <% 
			    	for(int i =0; i<ulist.size(); i++){
			    		
			    %>
			    <tr>
				    <td><%=ulist.get(i).getUserID()%></td>
				    <td><%=ulist.get(i).getUserName()%></td>
				    <td><%=ulist.get(i).getUserEmail() %></td>
				    <td><%=ulist.get(i).getUserAddress() %></td>
				    <td><%=ulist.get(i).getUserRole() %></td>
				    <%
			    	}
				    %>
			    </tr>
			    </tbody>
			</table>
		</div>
		
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>