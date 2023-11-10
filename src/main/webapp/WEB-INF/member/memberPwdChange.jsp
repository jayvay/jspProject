<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberPwdChange.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
  	<h2>비밀번호 변경</h2>
		<form name="myform" method="post" action="memberPwdCheckOk.mem">
		<table class="table table-bordered">
  	  <tr>
  	    <th>현재 비밀번호</th>
  	    <td><input type="password" name="pwd" id="pwd" class="form-control" required /></td>
  	  </tr>
  	  <tr>
  	    <th>변경할 비밀번호</th>
  	    <td><input type="password" name="newPwd" id="newPwd" class="form-control" required /></td>
  	  </tr>
  	  <tr>
  	    <th>변경할 비밀번호 확인</th>
  	    <td><input type="password" name="newPwdCheck" id="newPwdCheck" class="form-control" required /></td>
  	  </tr>
  	  <tr>
  	    <td class="text-center">
  	      <input type="submit" value="비밀번호변경" class="btn btn-success mr-2" />
  	      <input type="reset" value="다시입력" class="btn btn-warning mr-2" />
  	      <input type="button" value="돌아가기" onclick="location.href='memberMain.mem';" class="btn btn-info mr-2" />
  	    </td>
  	  </tr>
  	</table>
  	</form>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>