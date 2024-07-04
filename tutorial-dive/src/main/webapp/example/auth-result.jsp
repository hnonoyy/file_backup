<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	// id가 "admin" 
	// password 가 "1q2w3e4r" 이때만 인증성공
	if(id == null || id.isBlank() || pass==null || pass.isBlank()) {
		response.sendRedirect(request.getContextPath()+"/example/auth.jsp?error=blank");
		return;
	}
	
	boolean valid = false;
	if(id.equals("admin") && pass.equals("1q2w3e4r")) {
		request.getSession().setAttribute("auth", "success");
		valid = true;
	}
	
	if(!valid) {
		response.sendRedirect(request.getContextPath()+"/example/auth.jsp?error=invalid");
		return;
	}
	
	LocalDateTime time = LocalDateTime.now();
	String remoteAddr = request.getRemoteAddr();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 인증</title>
</head>
<body style="text-align: center;">
	<h2>관리자 로그인 성공!</h2>
	<div >
		<img style="border-radius: 20px" width="400px" alt="웃고있는 고양이" src="https://i.pinimg.com/564x/b2/1a/9f/b21a9ff51a2b511b3680603887147f01.jpg">
	</div>
	<p>
		접속 아이피 : <%= remoteAddr%>
	</p>
	<p>
		인증 시간  : <%= time %>
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/example/auth-main.jsp">
			<button style=" background-color:transparent; border: none; " type="button" > 관리자모드로 이동 </button>
		</a>
	
	</p>
	<p>
		<a href="<%=request.getContextPath()%>/example/auth-exit.jsp">
			<button style=" background-color:transparent; border: none; " type="button"  > 로그아웃 </button>
		</a>
	</p>
</body>
</html>