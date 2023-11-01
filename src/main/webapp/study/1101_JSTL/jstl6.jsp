<%@page import="study.j1101.Jstl4VO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>jstl6.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>JSTL Function 라이브러리</h2>
		<pre>
			사용법 : $ { fn : 함수명 ( 변수 / 값 ) }
			관계 연산자 : ==(eq), !=(ne), >(gt), <(lt), >=(ge), <=(le) 
		</pre>	
<%
			String str = "Welcome to My HomePage";
			pageContext.setAttribute("str", str);
			
			String[] hobbys = {"그림","수영","뜨개질","영화보기","쇼핑"};
			pageContext.setAttribute("hobbys", hobbys);
			
			ArrayList<Jstl4VO> vos = new ArrayList<>();
			Jstl4VO vo = new Jstl4VO();
			vo.setName("봉미선");
			vo.setAge(29);
			vo.setGender("여자");
			vo.setJob("주부");
			vo.setAddress("서울");
			vos.add(vo);
			
			vo = new Jstl4VO();
			vo.setName("고윤정");
			vo.setAge(28);
			vo.setGender("여자");
			vo.setJob("배우");
			vo.setAddress("서울");
			vos.add(vo);
			pageContext.setAttribute("vos", vos);
%>
		<%-- <c:set var="str" value="Welcome to My HomePage" /> --%>
		<div>
			str 변수의 값 : ${str}<br/>
			1-1.길이(length) : <%=str.length()%> / ${fn:length(str)} <br/>
			1-2.길이(length) : <%=hobbys.length%> / ${fn:length(hobbys)} <br/>
			1-3.길이(length) : <%=vos.size()%> / ${fn:length(vos)} <br/>
			<hr/>
			2-1.대문자변환(toUpperCase()) : <%=str.toUpperCase() %> / ${fn:toUpperCase(str)}<br/>
			2-2.소문자변환(toLowerCase()) : <%=str.toLowerCase() %> / ${fn:toLowerCase(str)}<br/>
			<hr/>
																										<%-- ${fn:substring(str,5)}<br/> 안됨--%>
			3-1.문자열추출(substring()) : <%=str.substring(5) %> / ${fn:substring(str, 5, fn:length(str))}<br/>
			3-1.문자열추출(substring()) : <%=str.substring(5) %> / ${fn:substring(str, 5, -1)}<br/>
			3-2.문자열추출(substring()) : <%=str.substring(0,5) %> / ${fn:substring(str, 0, 5)}
			<hr/>
			4-1.특정문자의 위치값(indexOf()) :  <%=str.indexOf("o") %> / ${fn:indexOf(str, 'o')}<br/>
			4-2.특정문자의 위치값(lastIndexOf()) :  <%=str.lastIndexOf("o") %> / <%-- ${fn:lastIndexOf(str, 'o')} --%>
			4-3.str 변수의 값 중에서 'o'문자가 들어가 있는 모든 위치를 출력하세요.<br/>
				<c:set var="cnt" value="0" /> 
				<c:forEach var="i" begin="0" end="${fn:length(str)-1}">
					<c:if test="${fn:substring(str, i, i+1)} == 'o'">
						<c:set var="cnt" value="${cnt + 1}" />
						${cnt}번째의 위치 값은? ${i}<br/>
					</c:if>
				</c:forEach>
				str변수의 'o'문자의 개수는 ${cnt}개 있습니다.<br/>
		  4-4. str변수의 'o' 문자의 2번째 위치값만 출력하시오?(마지막 'o'문자의 위치값은?)
   				 ~~~~~~~~~ 출력????? ~~~~~~~~<br/>
			5.문자열추출(substringBefore() / substringAfter())<br/>
				문자 'o'앞의 문자열을 출력 ${fn:substringBefore(str,'o')}<br/>
				문자 'o'뒤의 문자열을 출력 ${fn:substringAfter(str,'o')}<br/>
   				 ~~~~~~~~~2번째 'o'의 위치값 출력????? ~~~~~~~~<br/>
   		6.문자열분리(split(변수, 분리할 기준 문자)) : 문자 분리 후에는 분리된 문자들을 '변수'에 담아줘야 한다.<br/>
   			예) str 변수 안의 문자열 중에서 'o'를 기준으로 분리해서 출력하세요<br/>
   			<c:set var="strs" value="${fn:split(str, 'o')}" />
   			<c:forEach var="s" items="${strs}" varStatus="st" >
   				${st.count}.${s}<br/>
   			</c:forEach>
 				str변수의 'o'문자의 개수는 ${fn:length(strs)-1}개 있습니다.<br/>
   		7.치환(replace())<br/>
   			예) str 변수 안의 'o'를 'O'로 치환<br/>
   			<%=str.replace("o", "O") %> / ${fn:replace(str, 'o', 'O')}<br/>
   		8.특정 문자(열)의 포함 유무 - true/false (contains()) <br/>
   			예1) str 변수에 "My"가 포함되었는가? ${fn:contains(str, 'My')}<br/>
   			예2) str 변수에 "my"가 포함되었는가? ${fn:contains(str, 'my')}<br/>
		</div>
	</div>
<p><br/></p>
</body>
</html>