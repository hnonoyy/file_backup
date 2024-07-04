<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String n = request.getParameter("n");
	String control = request.getParameter("control");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수 조작하기</title>
</head>
<body>
<style>
	.dla{
		padding: 1em;
		width:33%;
		border-radius: 1em;
		background-color: #ACDCDF;
		text-indent: -10px;
	}
	.dlb{
		padding: 1em;
		width:33%;
		border-radius: 1em;
		background-color: #D9EEE1;
	}
</style>
	<% if(n == null || control == null){%>
		<h2 style="color: #D51B21"> n과 control값은 반드시 입력해주세요! </h2>
	<% }else{
		int nI = Integer.parseInt(n);
		for(int i=0;i<control.length();i++){
			if(control.charAt(i)=='w'){
				nI += 1;	
			}else if(control.charAt(i) == 'a'){
				nI -= 10;
			}else if(control.charAt(i) == 'd'){
				nI += 10;
			}else if(control.charAt(i) == 's'){ 
				nI -= 1;	
			}
		}%>
		<h3 >💬 수 조작하기</h3>
		<dl class="dla">
			<dt style="font-weight: bold">✏️ 문제설명</dt>
			<dd> 1. 정수 n과 문자열 control이 주어집니다. </dd>
			<dd> 2. 문자열은 "w", "a", "s", "d"의 4개의 문자로 이루어져있습니다. </dd>
			<dd> 3. 문자열의 앞에서부터 순서대로 n의 값을 바꿉니다. </dd>
		</dl>
		<dl class="dlb">	
			<dt style="font-size: 110%; font-weight: bold; text-align: center;" > 문자 작동방식</dt>
			<dd style="text-indent: 100px">  <b> w </b> ➡️ n이 1 커집니다.</dd>
			<dd style="text-indent: 100px"> <b> s </b> ➡️ n이 1 작아집니다.</dd>
			<dd style="text-indent: 100px">  <b> d </b> ➡️ n이 10 커집니다.</dd>
			<dd style="text-indent: 100px"> <b> a </b> ➡️ n이 10 작아집니다.</dd>			
		</dl>
		
		
		<p style="font-size: 130%">🤔 위의 규칙에 따라 마지막에 나오는 <b>n</b>의 값은 무엇일까요?</p>
		<p style="font-size: 120%">💡 본인이 입력한 n : <b style="color: #f64f44"><%= n %>
		</b> control : <b style="color: #f64f44"><%= control %></b>입니다.</p>	
		<p style="font-size: 120%">💡 최종 값은 <b style="color: red"><%= nI %></b>입니다.</p>
		
		
		<a href='./gugu.jsp'>구구단 공부하러 가기<br/></a>
		<a href='./fortune.hy'>운세 확인하러 가기<br/></a>
		<a href='./pizza'>피자나눠먹기</a>
	<%} %>
</body>
</html>