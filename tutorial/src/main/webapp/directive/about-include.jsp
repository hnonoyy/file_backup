<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인클루드 지시어</title>
</head>
<body>
	<%@ include file="./nav.jsp" %>
	<h3>include directive</h3>
	<p>
		<b>Include</b> 지시어는 현재 JSP 페이지 내에 다른 파일의 내용을 포함 시킬 때 사용한다.
		이 지시어는 페이지 레이아웃 설정이나 혹은 구성요소 재활용 할 때 유용하다.
	</p>
	<p>
		사용법은 &lt;%@ include file="url" %&gt; 이렇게 된다.
	</p>
</body>
</html>