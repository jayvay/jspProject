<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int level = session.getAttribute("sLevel")==null ? 99 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<script>
	function memberDelCheck() {
		let ans = confirm("정말 탈퇴하시겠습니까?");
		if(ans) {
			let ans2 = confirm("탈퇴 후 1개월 간 같은 아이디로 다시 가입할 수 없습니다.\n그래도 탈퇴하시겠습니까?");
			if(!ans2) return false;
		}
		else return false;
		
		//회원탈퇴
		$.ajax({
			url : "memberDeleteCheck.mem",
			type : "post",
			success : function(res) {
				if(res != "1") alert("회원 탈퇴 실패");
				else location.href = "memberLogout.mem";
			},
			error : function() {
				alert("전송 오류");
			}
		});
	}
</script>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<!-- 햄버거 버튼 -->
  <a class="navbar-brand" href="http://192.168.50.52:9090/javaProject">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/GuestList">Guest</a>
      </li>
     	<c:if test="${level <= 4}">
	      <li class="nav-item">
	        <a class="nav-link" href="boardList.bo">Board</a>
	      </li>
	      <li class="nav-item">
	        <c:if test="${level != 1}"><a class="nav-link" href="pdsList.pds">Pds</a></c:if>
	      </li>    
	      <li class="nav-item ml-2 mr-2">
	         <div class="dropdown">
					    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">Study1</button>
					    <div class="dropdown-menu">
					      <a class="dropdown-item" href="${ctp}/study/password/passForm.jsp">암호화연습</a>	
					      <a class="dropdown-item" href="${ctp}/mapping/Test1">디렉토리 패턴</a>
					      <a class="dropdown-item" href="${ctp}/mapping/test5.do">확장자 패턴</a>
					      <a class="dropdown-item" href="${ctp}/mapping/test5.re">확장자 패턴2</a>
					      <a class="dropdown-item" href="${ctp}/mapping/login.lo">로그인 연습</a>
					      <a class="dropdown-item" href="ajaxTest1.st">AJax 연습1</a>
					      <a class="dropdown-item" href="userList.us">AJax 연습2</a>
					      <a class="dropdown-item" href="login.alo">AJax연습3</a>
					      <a class="dropdown-item" href="uuidProcess.st">UUID연습</a>
					    </div>
					  </div>
	      </li>
	      <li class="nav-item ml-2 mr-2">
	         <div class="dropdown">
					    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">Study2</button>
					    <div class="dropdown-menu">
					      <a class="dropdown-item" href="fileUpload1.st">싱글파일업로드1</a>
					      <a class="dropdown-item" href="fileUpload2.st">싱글파일업로드2</a>
					      <a class="dropdown-item" href="fileUpload3.st">멀티파일업로드1</a>
					      <a class="dropdown-item" href="fileUpload4.st">멀티파일업로드2</a>
					      <a class="dropdown-item" href="fileDownload.st">다운로드</a>
					      <a class="dropdown-item" href="calendar1.st">달력연습1</a>
					      <a class="dropdown-item" href="calendar2.st">달력연습2</a>
					      <a class="dropdown-item" href="api1.st">api연습</a>
					    </div>
					  </div>
	      </li>
	      <li class="nav-item ml-2 mr-2">
	         <div class="dropdown">
					    <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown">MyPage</button>
					    <div class="dropdown-menu">
					      <a class="dropdown-item" href="memberMain.mem">회원메인방</a>
					      <a class="dropdown-item" href="schedule.sc">일정관리</a>
					      <a class="dropdown-item" href="webMessage.wm">메세지관리</a>
					      <a class="dropdown-item" href="memberPwdCheck.mem">회원정보수정</a>
					      <c:if test="${sLevel != 1}"><a class="dropdown-item" href="mList.mem">회원리스트</a></c:if>
					      <a class="dropdown-item" href="javascript:memberDelCheck()">회원탈퇴</a>
					      <c:if test="${sLevel == 0}"><a class="dropdown-item" href="adminMain.ad">관리자메뉴</a></c:if>
					    </div>
					  </div>
	      </li>
      </c:if>
     	<li class="nav-item">
        <c:if test="${level > 4}"><a class="nav-link" href="memberLogin.mem">Login</a></c:if>
        <c:if test="${level <= 4}"><a class="nav-link" href="memberLogout.mem">Logout</a></c:if>
      </li>
      <li class="nav-item">
        <c:if test="${level > 4}"><a class="nav-link" href="memberJoin.mem">Join</a></c:if>
      </li>            
    </ul>
  </div>  
</nav>	