<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberPwdCheck.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 		
 		let pwd = myform.pwd.value;
 		
 		function pwdReCheck() {
			$.ajax({
				url : "memberPwdChange.mem",
				type : "post",
				data : {pwd : pwd},
				success : function(res) {
					
				},
				error : function() {
					alert("전송 실패");
				}
			});
		}
 	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
		<form name="myform" method="post" action="memberPwdCheckOk.mem">
		<table class="table table-bordered">
  	  <tr>
  	    <td colspan="2" class="text-center">
  	    	<h2>비밀번호 확인</h2>
  	    	<div>현재 비밀번호를 입력하세요.</div>
  	    </td>
  	  </tr>
  	  <tr>
  	    <th>비밀번호</th>
  	    <td><input type="password" name="pwd" id="pwd" class="form-control" required /></td>
  	  </tr>
  	  <tr>
  	    <td colspan="2" class="text-center">
  	      <input type="button" value="비밀번호변경" onclick="pwdReCheck()" class="btn btn-success mr-2" />
  	      <input type="submit" value="회원정보수정" class="btn btn-success mr-2" />
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