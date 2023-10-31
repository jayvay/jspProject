<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); 

	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	String remember = request.getParameter("remember")==null ? "" : request.getParameter("remember");
%>

<%
	Cookie cookieMid = new Cookie("cMid", mid);
	cookieMid.setMaxAge(60*60*24);
	
	Cookie cookiePwd = new Cookie("cPwd", pwd);
	cookiePwd.setMaxAge(60*60*24);
	
	Cookie cookieRemember = new Cookie("cRemember", remember);
	cookieRemember.setMaxAge(60*60*24);
	
	response.addCookie(cookieMid);
	response.addCookie(cookiePwd);
	response.addCookie(cookieRemember);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ex_member.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict'
 	
		alert("${param.mid}님, 환영합니다!");
		
 		function logoutCheck() {
			let ans = confirm("로그아웃 하시겠습니까?");
			if(ans) {
				location.href = "<%=request.getContextPath()%>/study/1031/ex_logout.jsp?mid=<%=mid%>";
			}
		}
	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>메인 화면</h2>
		<hr/>
		<p>
<%	
			Cookie[] cookies = request.getCookies();

			out.print("안녕하세요 " + mid + " 님, 쿠키 정보는 다음과 같습니다<br/>");
			out.print("====================================<br/>");
			for(int i=0; i<cookies.length; i++) {
				out.print("쿠키 이름 : " + cookies[i].getName() + "<br/>");
				out.print("쿠키 값 : " + cookies[i].getValue() + "<br/>");
				out.print("쿠키 만료 시간 : " + cookies[i].getMaxAge() + "<br/>");
				out.print("----------------------------------<br/>");
			}
%>
		</p>
		<p>
			<a href="javascript:logoutCheck()" class="btn btn-outline-info">로그아웃</a>
		</p>
	</div>
<p><br/></p>
</body>
</html>