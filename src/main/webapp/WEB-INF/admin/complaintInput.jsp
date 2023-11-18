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
 		
    $(function() {
      $("#cpContentEtc").hide();
    });
	
 		function compCheck() {
 			let query = {
 			  part : $("#part").val(),
 			  cpMid : $("#cpMid").val(),
 			  cpContent : $("#cpContent").val(),
 			 	cpContentEtc : $("#cpContentEtc").val(),
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
 		
 		function cpContentCheck() {
			let cpContent = $("#cpContent").val();
			if(cpContent == '기타') {
				$("#cpContentEtc").show();
			}
		}
 	</script>
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2 class="text-center mb-3">신고하기</h2>
		<form name="myform" method="post" action="complaintInputOk.ad">
			신고 메뉴 : 
			<select name="part" id="part" class="form-control text-center mb-2">
				<option value="guest">방명록</option>
				<option value="board">게시판</option>
				<option value="pds">자료실</option>
			</select>
			신고자 :
			<input type="text" name="cpMid" id="cpMid" value="${sMid}" readonly class="form-control mb-2" />
			신고사유 :
			<div class="form-check">
				<input type="radio" class="form-check-input" name="cpContent" value="스팸홍보/도배글입니다." />스팸홍보/도배글입니다.
			</div>
			<div class="form-check">
				<input type="radio" class="form-check-input" name="cpContent" value="음란물입니다." />음란물입니다.
			</div>
			<div class="form-check">	
				<input type="radio" class="form-check-input" name="cpContent" value="불법정보를 포함하고 있습니다." />불법정보를 포함하고 있습니다.
			</div>
			<div class="form-check">	
				<input type="radio" class="form-check-input" name="cpContent" value="청소년에게 유해한 내용입니다." />청소년에게 유해한 내용입니다.
			</div>
			<div class="form-check">			
				<input type="radio" class="form-check-input" name="cpContent" value="욕설/생명경시/혐오/차별적 표현입니다." />욕설/생명경시/혐오/차별적 표현입니다.
			</div>
			<div class="form-check">
				<input type="radio" class="form-check-input" name="cpContent" value="개인정보 노출 게시물입니다." />개인정보 노출 게시물입니다.
			</div>
			<div class="form-check">
				<input type="radio" class="form-check-input" name="cpContent" value="불쾌한 표현이 있습니다." />불쾌한 표현이 있습니다.
			</div>
			<div class="form-check">	
				<input type="radio" class="form-check-input" name="cpContent" id="cpContent" onchange="cpContentCheck()" value="기타" />기타
				<textarea name="cpContentEtc" id="cpContentEtc" rows="3" placeholder="기타 사유를 적어주세요." class="form-control"></textarea>
			</div>
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