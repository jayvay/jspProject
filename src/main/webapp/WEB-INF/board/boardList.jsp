<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boardList.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 		
 		function pageSizeCheck() {
			let pageSize = $("pageSize").val();
			location.href = "boardList.bo?pageSize="+pageSize;
			
		}
 	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
		<table class="table table-borderless p-0 m-0">
			<tr>
				<td colspan="2"><h2 class="text-center">게 시 판</h2></td>
			</tr>
			<tr>
				<c:if test="${sLevel != 1}">
					<td><a href="boardInput.bo" class="btn btn-info btn-sm">글쓰기</a></td>
				</c:if>
				<td class="text-right">
					<select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
				    <option ${pageSize==3 ? "selected" : ""}>3</option>
	          <option ${pageSize==5 ? "selected" : ""}>5</option>
	          <option ${pageSize==10 ? "selected" : ""}>10</option>
	          <option ${pageSize==15 ? "selected" : ""}>15</option>
	          <option ${pageSize==20 ? "selected" : ""}>20</option>
					</select> 건
				</td>
			</tr>
		</table>
		<table class="table table-hover text-center">
			<tr class="table-dark text-dark">
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수(좋아요)</th>
			</tr>
			<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${curScrStartNo}</td>
					<td class="text-left">
						<a href="boardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
						<c:if test="${vo.hour_diff <= 24}"><img src="${ctp}/images/new.gif" /></c:if> 
						<c:if test="${vo.replyCnt != 0}">(${vo.replyCnt})</c:if>
					</td>
					<td>${vo.nickName}</td>
					<td> <!-- new.gif가 표시된 글은 날짜에 시간만 나오게, 그렇지 않은 자료는 날짜에 일자만 나오게 -->
							 <!-- 단(24시간안에 만족하는 자료), 날짜가 오늘날짜만 시간으로표시하고, 어제날짜는 날짜시간으로 표시하시오. -->
          	<c:if test="${vo.hour_diff > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
          	<c:if test="${vo.hour_diff <= 24}">
           		 ${vo.date_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,0,16)}
         		</c:if>
					</td>
					<td>${vo.readNum}(${vo.good})</td>
				</tr>
				<tr><td colspan="5" class="m-0 p-0"></td></tr>
				<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
			</c:forEach>
		</table>
	</div>
	<!-- 페이징 처리 -->
	<!-- 블록페이지 시작(1블록의 크기를 3개(3Page)로 한다. 한페이지 기본은 5개 -->
<br/>
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="boardList.bo?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
  	<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="boardList.bo?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a></li></c:if>
  	<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="boardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="boardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
  	</c:forEach>
  	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="boardList.bo?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
  	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="boardList.bo?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
  </ul>
</div>
<!-- 블록페이지 끝 -->

<!-- 게시글 검색 -->
<div class="container text-center">
	<form name="searchForm" method="post" action="boardSearch.bo">
		<b>검색 : </b>
		<select name="search" id="search">
			<option value="title" selected>글제목</option>
			<option value="nickName">글쓴이</option>
			<option value="content">글내용</option>
		</select>
		<input type="text" name="searchString" id="searchString"/>
		<input type="submit" value="검색" class="btn btn-info btn-sm" />
		<input type="hidden" name="pag" value="${pag}" />
		<input type="hidden" name="pageSize" value="${pageSize}" />
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>