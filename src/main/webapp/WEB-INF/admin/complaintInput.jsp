<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>complaintInput.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 		
 		function compCheck() {
 			let query = {
 			  part : $("#part").val(),
 			  cpMid : $("#cpMid").val(),
 			  cpContent : $("#cpContent").val(),
 			  partIdx : ${param.idx}
 			}
 			
 			$.ajax({
 				url  : "complaintInputOk.ad",
 				type : "post",
 				data : query,
 				success:function() {
 					alert("신고가 접수되었습니다.");
 					window.close();
 				},
 				error : function() {
 					alert("전송오류!");
 				}
 			});
		}
 		
 		function compCancel() {
			window.close();
		}
 	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2 class="text-center mb-3">신고하기</h2>
		<form name="myform" method="post" action="complaintInputOk.ad">
			신고 메뉴 : 
			<select name="part" id="part" class="form-control text-center">
				<option value="guest">방명록</option>
				<option value="board">게시판</option>
				<option value="pds">자료실</option>
			</select>
			신고자 :
			<input type="text" name="cpMid" id="cpMid" value="${sMid}" readonly class="form-control" />
			신고사유 :
			<textarea name="cpContent" id="cpContent" rows="4" class="form-control"></textarea>
			<hr/>
			<div class="text-center">
				<input type="button" value="신고" onclick="compCheck()" class="btn btn-danger"/>
				<input type="button" value="취소" onclick="compCancel()" class="btn btn-warning"/>
			</div>
				
			<input type="hidden" name="partIdx" value="${param.idx}" />
		</form>
	</div>
<p><br/></p>
</body>
</html>