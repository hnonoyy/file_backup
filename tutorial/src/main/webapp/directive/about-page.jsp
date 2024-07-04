<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"  %>
<%@ page import="java.time.LocalDate"%>
<%@ page errorPage="../error/handle.jsp" %>
<%@ page trimDirectiveWhitespaces="false" %>
<%@ page info="이 페이지는 페이지 지시어에 대한 설명을 하고자 만들었다." %>
<%@ page buffer="1kb" autoFlush="true" %>
<%
	List<String> logs = new ArrayList<>();
	// JSP 파일에서는 import처리가 ctrl+shift+o로 안됨. (자동완성 기능을 이용하면 import가 붙는다.)
	LocalDate now = LocalDate.now();
	//logs.get(2);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 지시어</title>
</head>
<body>
	<%@ include file="./nav.jsp" %>
	<h3>Page Directive</h3>
	<p>
		페이지 지시어는 해당 JSP 페이지의 전반적인 설정을 잡고자 할때 사용되며, 
		페이지 처리 방식, 응답 종류 등 중요한 속성들을 설정할 수 있다. 페이지 지시어는 
		&lt;%@page %&gt; 태그 안에 속성들을 명시하며 사용한다.
	</p>
	<h4>페이지 주요 속성</h4>
	<ul>
		<li>language : JSP 파일에서 사용하는 스크립트 언어를 지정.(기본값은 "java")</li>
		<li>contentType : 응답의 콘텐츠 타입을 지정 (기본값은 "text/html;charset=ISO-8859-1")</li>
		<li>import : JSP 페이지 사용할 자바 패키지나 클래스 임포트 처리</li>
		<li>errorPage : 현재 페이지에서 예외가 발생했을 때 이동할 오류 페이지의 URL 지정</li>
		<li>trimDirectiveWhitespaces : true로 설정 시 페이지 지시어 써놓은 부분 안보임 </li>
		<li>etc : 세션 사용 유무 설정이나, 버퍼크기, 자동 플러시 설정 등이 있다.</li>
	</ul>
</body>
</html>