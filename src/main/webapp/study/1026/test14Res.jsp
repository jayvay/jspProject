<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test14Res.jsp</title>
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    alert("${vo.name}님 환영합니다");	//EL표기법(MVC패턴 - < % % >를 최소한으로 씀)
    
  </script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>회원 메인창(가입 완료)</h2>
		<p>${vo.name}님 환영합니다~</p>	<!-- EL표기법에서 getter는 그냥 이렇게 씀 -->

		<p>나이 : ${vo.age}</p>
		<p>성별 : ${vo.gender}</p>
		<p>취미 : ${vo.hobby}</p>
		<p>직업 : ${vo.job}</p>

		<p>
			<input type="button" value="로그아웃(button)" onclick="logoutCheck()" class="btn btn-warning mr-3" />
			<!-- <a href="javascript:logoutCheck()" class="btn btn-danger">로그아웃(a)</a> -->
			<a href="<%=request.getContextPath() %>/j1026/test14Logout?name=${vo.name}" class="btn btn-danger">로그아웃(a)</a>
		</p>
	</div>
<p><br/></p>
</body>
</html>