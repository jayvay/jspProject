<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_requestGetOk.jsp -->

<%
	request.setCharacterEncoding("utf-8");

	String[] hobbys = request.getParameterValues("hobby");
	
	String hobby = "";
	
	for(String h : hobbys) {
		hobby += h + "/";
	}
	hobby = hobby.substring(0, hobby.length()-1);
%>
<p>전송된 값</p>
<p>성명 : <%=request.getParameter("name") %></p>
<p>취미 : <%=hobby %></p>
<p>호스트IP1 : <%=request.getParameter("hostIp") %></p>	<!-- 값을 담아서 db에 담는다면 이렇게.. -->
<p>호스트IP2 : <%=request.getRemoteAddr() %></p>	
<p>전송방식 : <%=request.getMethod() %></p>
<p>접속 프로토콜 : <%=request.getProtocol() %></p>
<p>접속 서버 이름 : <%=request.getServerName() %></p>
<p>접속 서버 포트 : <%=request.getServerPort() %></p>
<p>접속 Context명 : <%=request.getContextPath() %></p>
<p>접속 URL : <%=request.getRequestURL() %></p>
<p>접속 URI : <%=request.getRequestURI() %></p>
<p><input type="button" value="돌아가기" onclick="history.back()" /></p>

<!--  
	ipV6(128bit)
	ipV4로 전환 -Djava.net.preferIPv4Stack=true
 -->
