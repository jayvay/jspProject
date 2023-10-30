<!-- 지시자(디렉티브(directive)) : < % @ -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test1.jsp</title>
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
	</div>
<p><br/></p>
</body>
</html>