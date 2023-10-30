<!-- 지시자(디렉티브(directive)) : < % @ -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test2.jsp</title>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
  	//자바스크립트 한 줄 주석입니다.
  	/*
  		자바스크립트 여러 줄 주석입니다.
  	*/
		<%-- JSP 주석입니다.(자바스크립트 영역) --%>
  </script>
  <style>
  	/*
  		스타일 시트 주석입니다.
  	*/
		<%-- JSP 주석입니다.(스타일 시트 영역) --%>
  </style>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>JSP 각종 주석</h2>
		<!-- html 주석입니다. -->
		<%-- JSP 주석입니다.(본문 영역) --%>
		
		<%	// 스크립틀릿(scriptlet)
			// 자바 코드 작성하는 영역 (주석도 자바 주석으로)
			System.out.println("이곳은 JSP 파일 안 입니다.");
		
			out.println("브라우저에 출력되게 하려면 이렇게 써요.");
			out.println("<p><font size='4'><b>html도 돼요</b></font></p>");
			out.println("<script>");
			out.println("alert('이건 자바스크립트요')");
			out.println("</script>");
			//태그와 서버 코드 다 섞여 있어 = 스파게티 코드..안 좋아요 //이래서 mvc가 나온 거예요. <>를 무조건 한 곳에 몰아야 해요.
		%>
		<hr/>
		<div>본문이 계속됩니다.</div>
		<%
			int tot = 0;
		%>
		<h3>1~100까지의 합</h3>
		<%
			for(int i=1; i<=100; i++) {
				tot += i;
			}
			out.println("1~100까지의 합은 " + tot + "입니다.");
		%>
		<hr/>
		<div>1~100까지의 합은 <%=tot %> 입니다.</div>		<!-- < % = 표현식(expression) -->
	</div>
<p><br/></p>
</body>
</html>