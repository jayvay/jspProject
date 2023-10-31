<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_ApplicaionMidDelete.jsp -->

<%
	session.removeAttribute("aMid");
%>

<script>
	alert("ID 어플리케이션이 삭제되었습니다.");
	location.href="t3_ApplicationMain.jsp"
</script>