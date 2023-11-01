<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ex_jstl_combo.jsp</title>
 	<jsp:include page="/include/bs4.jsp" />
</head>
<body>
<p><br/></p>
	<div class="container">
		<h2>댕댕쓰</h2>
		<pre>
			콤보 상자에 숫자 1~5까지 기억시켜서 화면에 보여준다.
			이 때 숫자를 선택하면 아래쪽(demo)으로 선택한 숫자의 그림 파일을 출력하세요.	
			콤보 상자 옆에 텍스트 박스를 만들어준 후, 그곳에 아래 출력된 파일의 '이름'을 적어준 후 '저장'버튼을 클릭하여 저장시켜준다.
			'전체그림출력'버튼을 만들어서 이 버튼을 클릭하면 지금까지 저장된 그림 파일들을 모두 demo에 차례대로 출력시켜줄 수 있도록 하세요.
			배열..arraylist..
		</pre>
		<div>
			<select class="form-control text-center">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</div>
	</div>
<p><br/></p>
</body>
</html>