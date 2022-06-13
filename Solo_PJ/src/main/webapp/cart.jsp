<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "cart.Cart"%>
<%@ page import = "java.text.DecimalFormat" %>

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
<title>CMM</title>
</head>
<body>
	<jsp:include page="head.jsp" flush="false"/>
	<% 
		Enumeration enu = request.getParameterNames();
		String strName;
	 
	 //out.println("모든 파라미터값 호출");
	 while (enu .hasMoreElements()) {
	  strName= (String) enu .nextElement();
	 	}
	  %>
	  <%
		// out.print(strName + ":");
		// out.print(request.getParameter(strName)+"<BR>");
		//}
	  %>
	
	
	<%
		String pdName = (String)request.getParameter("pdname");
		int pdprice = Integer.parseInt(request.getParameter("pdprice"));
		
		//out.println(pdName);
		//out.println(pdprice);
	%>
	<br> 		
	<div class = "cart">
		<div class = "container" style = "background-color : #f8f9fa;">	
			<h3>장바구니</h3>
			
		</div>
	</div>
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>