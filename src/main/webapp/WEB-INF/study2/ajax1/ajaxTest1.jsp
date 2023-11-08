<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ajaxTest1.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
 	<script>
 		'use strict';
 		
 		//일반 아이디 검색	
 		function idCheck() {
 			//let mid = document.myform.value;
 			//let mid = myform.value;
			//let mid = document.getElementById("mid").value;
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			location.href = "ajaxTest1Ok.st?mid="+mid;
		}
 		
 		//aJax로 아이디 검색1
 		function idCheck1() {
			let mid = $("#mid").val();
			
			if(mid.trim() == "") {
				alert("아이디를 입력하세요");
				$("#mid").focus();
				return false;
			}
			
			$.ajax({
				url : "${ctp}/ajaxTest1", //필수
				type : "get",							//필수
				data : {mid : mid},	//json형식 {"서버(서블릿)에서 받는 변수명" : "클라이언트 값을 담은 변수" , "__" : "__"}	//필수
				contextType : "application/json",
				charset : "utf-8",
				success : function(res) {	//필수 콜백함수 무조건 자바스크립트,제이쿼리 문법
				//alert("서버에 성공적으로 다녀왔습니다. ==> " + res);
				//demo.innerHTML = res;
					$("#demo").html(res);
				},
				error : function() {
					alert("전송 오류");
				} 
			});
 			}
			//aJax로 아이디검색2
			function idCheck2() {
				let mid = $("#mid").val();
				
				if(mid.trim() == "") {
					alert("아이디를 입력하세요");
					$("#mid").focus();
					return false;
				}
				
				let query = {
					mid : mid						
				}
				
				$.ajax({
					url : "${ctp}/ajaxTest2",
					type : "post",
					data : query,
					success : function(res) {
						$("#demo").html(res);
						let str = res.split("/");
						$("#tMid").html(str[0]);
						$("#name").html(str[1]);
						$("#point").html(str[2]);
						$("#todayCount").html(str[3]);
					},
					error : function() {
						alert("전송 오류");
					}
				});
			}
			
			//aJax로 아이디검색3
			function idCheck3() {
				let mid = $("#mid").val();
								
				if(mid.trim() == "") {
					alert("아이디를 입력하세요");
					$("#mid").focus();
					return false;
				}
				
				$.ajax({
					url : "${ctp}/ajaxTest3",
					type : "post",
					data : {mid : mid},
					success : function(res) {
						$("#demo").html(res);
						$("#tMid").html(res.substring(res.indexOf("mid=")+4 , res.indexOf("," , res.indexOf("mid="))));
						$("#name").html(res.substring(res.indexOf("name=")+5 , res.indexOf("," , res.indexOf("name="))));
						$("#point").html(res.substring(res.indexOf("point=")+6 , res.indexOf("," , res.indexOf("point="))));
						$("#todayCount").html(res.substring(res.indexOf("todayCount=")+11 , res.indexOf("]")));
					},
					error : function() {
						alert("전송 오류");
					}
				});
			}
			
			//aJax로 아이디검색4 (HashMap 활용)
			function idCheck4() {
				let mid = $("#mid").val();
				
				if(mid.trim() == "") {
					alert("아이디를 입력하세요");
					$("#mid").focus();
					return false;
				}
				
				$.ajax({
					url : "${ctp}/ajaxTest4",
					type : "post",
					data : {mid : mid},
					success : function(res) {
						console.log("res" , res);
						$("#demo").html(res);
						
						let js = JSON.parse(res);	//json 타입을 자바스크립트 객체 형식으로.. 자바스크립트(vscode)에서 배웠던 거!
						console.log("js" , js);
						
						$("#tMid").html(js.mid);
						$("#name").html(js.name);
						$("#point").html(js.point);
						$("#todayCount").html(js.todayCount);
					},
					error : function() {
						alert("전송 오류");
					}
				});
			}
			
			//aJax로 아이디검색4 (vos 활용)
			function idCheck5() {
				let mid = $("#mid").val();
				
				if(mid.trim() == "") {
					alert("아이디를 입력하세요");
					$("#mid").focus();
					return false;
				}	
				
				$.ajax({
					url : "${ctp}/ajaxTest5",
					type : "post",
					data : {mid : mid},
					success : function(res) {
						$("#demo").html(res);
						let js = JSON.parse(res);
						console.log("js", js);
						
						let tMid = "", name = "", point = "", todayCount = "";
						for(let j of js) {
							tMid += j.mid + "/";
							name += j.name + "/";
							point += j.point + "/";
							todayCount += j.todayCount + "/";
							
							$("#tMid").html(tMid);
							$("#name").html(name);
							$("#point").html(point);
							$("#todayCount").html(todayCount);
						}
					},
					error : function() {
						alert("전송 오류");
					}
				});
			}
 	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
	<div class="container">
		<h2>AJax 연습</h2>
		<hr/>
		<form name="myform">
			아이디 : 
			<div class="input-group">
				<input type="text" name="mid" id="mid" class="form-control mb-2" />
				<div class="input-group-append"><input type="button" value="아이디 일반검색" onclick="idCheck()" class="btn btn-info mb-2" /></div>
			</div>
			<hr/>
			aJax 검색 : <br/>
			<div>
				<input type="button" value="아이디검색1" onclick="idCheck1()" class="btn btn-primary" />
				<input type="button" value="아이디검색2" onclick="idCheck2()" class="btn btn-warning" />
				<input type="button" value="아이디검색3" onclick="idCheck3()" class="btn btn-info" />
				<input type="button" value="아이디검색4" onclick="idCheck4()" class="btn btn-secondary" />
				<input type="button" value="아이디검색5" onclick="idCheck5()" class="btn btn-secondary" />
			</div>
			<hr/>
			<div>출력결과 : <span id="demo"></span></div>
			<hr/>
			<div>
				<div>아이디 : <span id="tMid"></span></div>
				<div>성명 : <span id="name"></span></div>
				<div>포인트 : <span id="point"></span></div>
				<div>오늘 방문 카운트 : <span id="todayCount"></span></div>
			</div>
		</form>
		<hr/>
		<div><a href="javascript:location.href='${ctp}/';" class="btn btn-danger">돌아가기</a></div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>