<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	<%-- 서버 언어를 한글로 --%>
<%
	request.setCharacterEncoding("utf-8"); //넘기는 값을 한글로

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String flag = request.getParameter("flag");
	
	System.out.println("성명 : " + name);
	System.out.println("나이 : " + age);
	System.out.println("flag : " + flag);
	
	/* out.println("성명2 : " + name);
	out.println("나이2 : " + age);
	out.println("flag : " + flag); */
%>
	<%-- 
	<hr/>
	<p>성명3 : <%=name %></p>
	<p>나이3 : <%=age %></p>
	<p>flag3 : <%=flag %></p>
	<hr/>
	<p><a href="test2.jsp">돌아가기</a></p>
 --%>
	<script>
    alert("회원 가입완료!!");
    location.href = "test2.jsp";
  </script>