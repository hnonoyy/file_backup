<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	/*
	
	주석 / 1. Java comment
	
	
	*/
	

%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Directive</title>
</head>
<body>
	<%@ include file="./nav.jsp" %>
	<!-- 주석 / 2. Mark Up comment -->
	<%-- 주석 / 3. JSP comment--%>
	<h2>JSP Directive</h2>
	<p>
		동적 HTML을 만드는데 있어서 필요한 자바 처리는 <b>스크립트릿</b> 혹은 <b>표현식</b> 같은 걸 이용해서 해결하면
		된다. 그 외에도 알아둬야 하는 <b>'지시어(Directive)'</b>가 있다.
	</p>
	<p>
		지시어는 JSP 엔진에게 페이지가 어떤식으로 처리되어야 하는지 알려주는 특수 코드이다. 보통 지시어는 페이지 최상단에 주로
		위치하는데, 필요에 따라서 달라질 수는 있다. 지시어는 <i>&lt;%@</i>형태를 띄고있다. 공&nbsp;&nbsp;백
	<p />
	<p>JSP에는 세가지 주요 지시어가 있다.</p>
	<ol>
		<li><h4>페이지 지시어 (Page Directive)</h4>
			<p>페이지 속성, 세션 사용 유무, 오류페이지 등 해당 페이지에 필요한 설정을 지정할 때 사용한다.</p></li>
		<li><h4>인클루드 지시어(include Directive)</h4>
			<p>다른 파일의 내용을 현재 JSP에 포함시키고자 할 때 사용한다.</p></li>
		<li><h4>태그라이브러리 지시어(taglib Directive)</h4>
			<p>기본 태그가 아닌 커스텀 태그를 활용하고자 할 때 사용한다.</p></li>
	</ol>
	<p>각 지시어는 특정 역할을 가지고 있고, 지시어들을 통해 JSP 페이지를 효율적으로 관리 및 최적화 할 수 있다.</p>
</body>
</html>