<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/053f0cac61.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<div class="withdraw">
		<div>
			<a href="${pageContext.servletContext.contextPath }/index"> <i
				class="fa-solid fa-house no-deco-link"></i>
			</a>
		</div>
		<div>
			<p class="fs-3">
				다시 한번 <b class="warning">비밀번호</b>를 입력해주세요
			</p>
		</div>
		<form
			action="${pageContext.servletContext.contextPath }/withdraw-handle"
			method="post">
			<div>
				<input type="password" name="password">
			</div>
			<div class="text-center">
				<button type="submit" class="b-2">회원탈퇴</button>
			</div>
		</form>
	</div>
</body>
</html>