<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="study.j1031.T3VO" /> <!-- useBean tag로 객체 생성(불러올 class는 패키지부터 적는다) -->
<!-- 
	서블릿에서는 getter와 setter를 이용해 값을 불러오거나 저장한다.
	jsp에서는 getProperty와 setProperty를 이용해 값을 불러오거나 저장한다.
 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>t3Ok2.jsp</title>
	<jsp:setProperty property="name" name="vo"/>
	<jsp:setProperty property="age" name="vo" value="27"/>
	<jsp:setProperty property="gender" name="vo"/>
	<jsp:setProperty property="hobby" name="vo"/>
	<jsp:setProperty property="job" name="vo"/>
	<jsp:setProperty property="address" name="vo"/>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>처리된 자료를 view에 출력시켜보자</h2>
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td><jsp:getProperty property="name" name="vo"/>/${name}</td>
			</tr>
			<tr>
				<th>나이</th>
				<td><jsp:getProperty property="age" name="vo"/>/${age}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td><jsp:getProperty property="gender" name="vo"/>/${gender}</td>
			</tr>
			<tr>
				<th>취미</th>
				<td><jsp:getProperty property="hobby" name="vo"/>/${hobby}</td>
			</tr>
			<tr>
				<th>직업</th>
				<td><jsp:getProperty property="job" name="vo"/>/${job}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><jsp:getProperty property="address" name="vo"/>/${address}</td>
			</tr>
		</table>
		<p><a href="t3.jsp" class="btn btn-warning">돌아가기</a></p>
	</div>
<p><br/></p>
</body>
</html>