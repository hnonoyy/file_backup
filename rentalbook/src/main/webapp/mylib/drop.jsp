<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	boolean auth = (boolean)session.getAttribute("auth");
	if(!auth){
		response.sendRedirect(application.getContextPath()+"/mylib/drop-handle.jsp");
	}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 | 동네도서관</title>
<link rel="stylesheet" href="<%=application.getContextPath()%>/common/style.css"/>
</head>
<body>
	<%-- navbar 만들어서 include 시킬것 --%>
	<%@ include file="/common/header.jsp" %>
	<div style="width : 840px; margin: auto;">
		<div style="text-align: center;">
			<h2>회원탈퇴</h2>
			<div style="display: flex; justify-content: center; align-items: center;">
				<a class="no_deco_link" href="<%=application.getContextPath()%>/index.jsp">
				<img class="img-st" alt="🏠" src="https://e7.pngegg.com/pngimages/370/221/png-clipart-black-house-art-one-line-home-icon-icons-logos-emojis-home-icons.png"></a> &nbsp;
				회원서비스 &gt; <span style="color :hotpink;">회원탈퇴</span>
			</div>
		</div>
		<div style="width: 350px; margin: 60px auto; border: 1px solid #ddd; padding: 30px;">
			<h3>유의사항</h3>
			<small>현재 비밀번호와 일치 시 회원탈퇴가 가능합니다.</small>
			<form action="<%=application.getContextPath()%>/mylib/drop-handle.jsp">
				<p>
					<input type="password" class="login-input"	placeholder="비밀번호를 입력해주세요"
					name="u_pwd"/>
				</p>
			 	<p>
			 		<button type="submit" class="button button2">회원탈퇴</button>
			 	</p>
			</form>
		</div>
	</div>
</body>
</html>