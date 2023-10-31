<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicationNameCheck.jsp -->
<jsp:include page="/include/bs4.jsp" />
<div class="container">
<p><br/></p>
<h2>전체 어플리케이션 변수명 확인하기</h2>
<%
	Enumeration names = application.getAttributeNames();
	//enum
	
	while(names.hasMoreElements()) {
		String aName = (String)names.nextElement();
		
		out.print("어플리케이션명 : " + aName + "<br/>");
	}
%>

<hr/>
<p>
	<a href="t3_ApplicationMain.jsp" class="btn btn-secondary">돌아가기</a>
</p>
</div>