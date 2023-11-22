<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberMain.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 		
 		function chatInput() {
			let chat = $("#chat").val();
 			
			if(chat.trim() != "") {
	 			$.ajax({
					url : "${ctp}/memberMessageInput.mem",
					type : "post",
					data : {chat : chat},
					error : function() {
						alert("전송 오류");
					}
				});
			}
		}
 		
 		$(function() {
			$("#chat").on("keydown", function(e) {
				if(e.keyCode == 13) {
					chatInput();
				}
			});
		});
 	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
		<h2>회 원 전 용 방</h2>
		<hr/>
		<c:if test="${level == 1}">
			<pre>
				정회원 등업 조건
			</pre>
		</c:if>
		<hr/>
		<!-- 실시간 DB 채팅 -->
		<div style="width:500px">
			<form name="chatForm">
				<label for="chat"><b>실시간 대화방</b></label>
				<iframe src="${ctp}/include/memberMessage.jsp" width="100%" height="250px" class="border"></iframe>
				<div class="input-group mt-1">
					<input type="text" name="chat" id="chat" class="form-control" placeholder="대화내용을 입력하세요." autofocus() />
					<div class="input-group-append">
						<input type="button" value="글 등록" onclick="chatInput()" class="btn btn-dark" />
					</div>
				</div>
			</form>
		</div>
		<hr/>
		<div><img src="${ctp}/images/member/${mVo.photo}" width="200px" /></div>
		<div>
			<p>현재 ${sNickName}(${sStrLevel})님 접속 중입니다.</p>
			<p>총 방문 횟수 : ${mVo.visitCnt}회</p>
			<p>오늘 방문 횟수 : ${mVo.todayCnt}회</p>
			<p>총 보유 포인트 : ${mVo.point}점</p>
			<hr/>
			<h4>활동 내역 : </h4>
			<p>방명록 게시글 수 : ${fn:length(gVos)}건</p>
			<p>게시판 게시글 수 : ${empty bVo.boardCnt ? 0 : bVo.boardCnt}건</p>
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>