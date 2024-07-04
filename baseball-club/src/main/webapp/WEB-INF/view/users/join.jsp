<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/053f0cac61.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<section class="sign">
		<div class="sign_box">
			<div class="in">
				<div class="top_link">
					<a href="${pageContext.servletContext.contextPath }/index"> <i
						class="fa-solid fa-baseball-bat-ball fa-1x no-deco-link"></i>
					</a>
				</div>
				<div class="contacts">
					<form
						action="${pageContext.servletContext.contextPath }/join-handle"
						method="post">
						<h3>회원가입</h3>
						<div>
							<label for="id-input">아이디</label> <input type="text" name="userId" id="id-input">
							
						</div>
						<div>
							<label for="password-input">비밀번호</label> <input type="password" name="password" id="password-input">
						</div>
						<div>
							<label for="nickname-input">닉네임</label> <input type="text" name="nickname" id="nickname-input">
						</div>
						<div>
							<label for="birth-input">생년월일</label> <input type="date" name="birth" id="birth-input">
						</div>
						<div>
							<span class="float-left" style="padding-right: 10px">성별</span><br/>
							<div class="d-flex g-1 align-center">
								<input type="radio" name="gender" value="남" id="male-radio"/><label for="male-radio" class="me-5 ">남</label> <input
									type="radio" name="gender" value="여" id="female-radio"/><label for="female-radio">여</label>
							</div>
						</div>
						<div>
							<label for="email-input">이메일</label> <input type="text" name="email" id="email-input">
						</div>
						<div>
							선호구단
							<div class="d-flex align-center g-05">
								<input type="radio" name="club" value="LG트윈스" id="lg-radio"><label for="lg-radio">LG</label> 
								<input type="radio" name="club" value="KT위즈" id="kt-radio"><label for="kt-radio">KT</label> 
								<input type="radio" name="club" value="SSG랜더스" id="ssg-radio"><label for="ssg-radio">SSG</label>
								<input type="radio" name="club" value="NC다이노스"id="nc-radio"><label for="nc-radio">NC</label>
								<input type="radio" name="club" value="두산베어스"id="dosan-radio"><label for="dosan-radio">두산</label>
								<input type="radio" name="club" value="KIA타이거즈" id="kia-radio"><label for="kia-radio">KIA</label>
								<input type="radio" name="club" value="롯데자이언츠" id="lotte-radio"><label for="lotte-radio">롯데</label> 
								<input type="radio" name="club" value="삼성라이온즈" id="samsung-radio"><label for="samsung-radio">삼성</label> 
								<input type="radio" name="club" value="한화이글스" id="hanhwa-radio"><label for="hanhwa-radio">한화</label>  
								<input type="radio" name="club" value="키움히어로즈" id="kiwoom-radio"><label for="kiwoom-radio">키움</label> 
							</div>
						</div>
						<button class="submit">회원가입</button>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
</html>