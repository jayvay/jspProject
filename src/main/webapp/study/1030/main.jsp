<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String flag = request.getParameter("flag")== null ? "" : request.getParameter("flag");
	String mSw = request.getParameter("mSw")== null ? "" : request.getParameter("mSw");
	String mid = request.getParameter("mid")== null ? "" : request.getParameter("mid");
	pageContext.setAttribute("mSw", mSw);
	pageContext.setAttribute("mid", mid);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>main.jsp</title>
	<%-- <%@ include file="../../include/bs4.jsp" %> --%>
	<%-- <jsp:include page="../../include/bs4.jsp" /> --%>
	<%-- <jsp:include page="${pageContext.request.contextPath}/include/bs4.jsp" /> (오류) --%>
	<jsp:include page="/include/bs4.jsp" /> <!-- jsp액션태그 처음의 '/'는 ContextPath의 root명(javaProject)으로 간주 -->
	<script>
		'use strict';
		
		if('${mSw}' == 'No' || '${mid}' == '') {
			alert("회원정보를 확인 후 다시 로그인하세요.");
			location.href = "login.jsp";
		}
		else if('${mSw}' == 'Ok') {
			alert("${mid} 회원님 방문을 환영합니다~")
		}
	</script>
</head>
<body>
	<!-- header영역(로고/메뉴/Top Image 등) -->
	<div id="header" class="text-center" style="background-color:skyblue">
		<%@ include file = "nav2.jsp" %>
		<div class="text-right">${mid}님 로그인 중입니다.</div>
	</div>
	<p><br/></p>
		<div class="container" style="text-align:center">
<% 		if(flag.equals("guest")) { %>
					<%@ include file="guest2.jsp" %>	
<% 		} else if(flag.equals("board")) {%>
					<%@ include file="board2.jsp" %>	
<% 		} else if(flag.equals("pds")) {%>
					<%@ include file="pds2.jsp" %>	
<% 		} else { %>
					<h2>이곳은 메인 화면(Home) 입니다.</h2>
					<p><img src="../../images/13.jpg" width="500px" /></p>
					<hr/>
<% 		} %>
		</div>
	<p><br/></p>
	<!-- footer영역(Copyright/Email Address/사업자등록증/Image 등) -->
	<div id="footer" class="text-center">
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>