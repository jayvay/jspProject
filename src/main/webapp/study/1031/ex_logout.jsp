<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ex_logout.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		alert('<%=mid%> 님, 또 만나요~');
 		location.href = "<%=request.getContextPath()%>/study/1031/ex_login.jsp";
 	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		
	</div>
<p><br/></p>
</body>
</html>