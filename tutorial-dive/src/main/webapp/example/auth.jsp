<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String error = request.getParameter("error");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body style="text-align: center">
	
	<h2>&#128187;</h2>
	<div style=" border: 1px solid; border-radius:10px; padding: 2px; height: 300px; width: 270px; margin-left: auto; margin-right: auto;">
		<form action="<%= request.getContextPath() %>/example/auth-result.jsp">
			<h3 style="font-weight: bold; text-align:left; text-indent: 10px; color: #6a5acd;">LOGIN</h3>
			<p>
			👤
			<input style="border: none; padding: 5px" type="text" name="id" placeholder="ID" />		
			</p>
			<p>
			🔒
			<input style="border: none; padding: 5px" type="password"  name="pass" placeholder="PW"/>
			</p>
			<%if(error != null){%>
				<p style="color: red; font-size: small; padding-top: 10px">
					아이디 또는 비밀번호가 일치하지 않습니다.
				</p>
			<%}%>
			
			<p>
				<button style=" background-color:transparent; border: none; " type="button" >회원가입</button>
				|
				<button style=" background-color:transparent; border: none; " type="button" >ID/PW 찾기</button><br/>
			</p>
			<button style="background-color: #8e8ac8; border: none; border-radius:10px; padding: 12px 40px; margin: 5px; cursor: pointer;" type="submit" >
			<b style="color: white; font-size:large; ;">로그인 </b></button>
	</form>
	</div>
</body>
</html>