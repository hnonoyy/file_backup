<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 동네도서관</title>
<link rel="stylesheet" href="<%=application.getContextPath()%>/common/style.css"/>
</head>
<body>
	<%-- navbar 만들어서 include 시킬것 --%>
	<%@ include file="/common/header.jsp" %>
	<div style="width : 840px; margin: auto;">
		<div style="text-align: center;">
			<h2>로그인</h2>
			<div style="display: flex; justify-content: center; align-items: center;">
				<a class="no_deco_link" href="<%=application.getContextPath()%>/index.jsp">
				<img class="img-st" alt="🏠" src="https://e7.pngegg.com/pngimages/370/221/png-clipart-black-house-art-one-line-home-icon-icons-logos-emojis-home-icons.png"></a> &nbsp;
				회원서비스 &gt; <span style="color :hotpink;">로그인</span>
			</div>
		</div>
		<div style="width: 350px; margin: 60px auto; border: 1px solid #ddd; padding: 30px;">
			<form action="<%=application.getContextPath()%>/member/login-handle.jsp">
				<p>
					<input type="text" class="login-input" placeholder="아이디를 입력해주세요"
					name="u_id"/>
				</p>
				<p>
					<input type="password" class="login-input"	placeholder="비밀번호를 입력해주세요"
					name="u_pwd"/>
				</p>
			 	<p>
			 		<button type="submit" class="button button2">로그인</button>
			 	</p>
			</form>
			<p style="text-align: center;" >
				<a class="no-deco-link fs-small" href="<%=application.getContextPath()%>/member/join.jsp">신규회원가입</a>
			</p>
		</div>
	</div>
</body>
</html>