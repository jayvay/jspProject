<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- test13Logout.jsp -->
<%	//mvc는 < % % >를 맨 위로 다 뺀다
	String name = request.getParameter("name");
	pageContext.setAttribute("name", name);	//변수에 test13Res에서 쿼리스트링으로 보낸 name을 저장해야 9번에 name이 뜬다
%>

<script>
	alert("${name}님 로그아웃 되었습니다.(MVC)");
	<%-- location.href = "<%=request.getContextPath()%>/study/1026/test13.jsp"; --%>
	<%-- 위에거를 EL표기법으로(getter) 적기 (EL은 현재 페이지에 있는 값을 저장하는 server 저장소 pageContext에 저장하는 게 좋다) --%>
	location.href = "${pageContext.request.contextPath}/study/1026/test13.jsp";
	/* location.href = "test13.jsp"; */
</script>
	
