<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ include file="bs4.jsp" %> 같은 위치면 이렇게 써도 된다 --%>
<%-- <%@ include file="../../include/bs4.jsp" %> --%>
<%-- <%@ include file="<%=request.getContextPath() %>/include/bs4.jsp" %> 사용불가(% 안에 %를 또 사용할 수 없다) --%>
<%-- <jsp:include page="<%=request.getContextPath() %>/include/bs4.jsp" /> --%>

<!-- <div class="container"> -->
<div style="height:180px; text-align:center">
	<p><br/></p>
	<a href="home.jsp" class="btn btn-outline-info">Home</a> |
	<a href="guest.jsp" class="btn btn-outline-info">Guest</a> |
	<a href="board.jsp" class="btn btn-outline-info">Board</a> |
	<a href="pds.jsp" class="btn btn-outline-info">Pds</a>
	
</div>
