<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/053f0cac61.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>프로필</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="profile">
		<div class="profile-box">
			<div class="text-right">
				<a href="${pageContext.servletContext.contextPath }/following">
					<i class="fa-solid fa-user-plus no-deco-link"></i>
				</a>
			</div>
			<div class="text-center fs-3">
				<h2 class=" fw-b">프로필</h2>
			</div>
			<div style="display: flex; justify-content: center; gap: 50px">
				<div style="width: 200px;">
					<p class="fs-4">
						아이디 <span class="fw-b">${foundUser.userId }</span>
					</p>
					<p class="fs-4">
						닉네임 <span class="fw-b">${foundUser.nickname }</span>
					</p>
					<p class="fs-4">
						선호구단 <span class="fw-b">${foundUser.club }</span>
					</p>
					<p class="fs-4">
						팔로워 <span class="hash fw-b">${follower }</span> 팔로잉<span
							class="hash fw-b"> ${following }</span>
					</p>
				</div>
				<div>
					<c:choose>
						<c:when test="${foundUser.club == 'LG트윈스' }">
							<img alt="lg" src="img/lg-pf.jpg">
						</c:when>
						<c:when test="${foundUser.club == 'KIA타이거즈' }">
							<img alt="kia" src="img/kia-pf.jpg">
						</c:when>
						<c:when test="${foundUser.club == 'KT위즈' }">
							<img alt="kt" src="img/kt-pf.jpg">
						</c:when>
						<c:when test="${foundUser.club == 'SSG랜더스' }">
							<img alt="ssg" src="img/ssg-pf.jpg">
						</c:when>
						<c:when test="${foundUser.club == 'NC다이노스' }">
							<img alt="nc" src="img/nc-pf.jpg">
						</c:when>
						<c:when test="${foundUser.club == '두산베어스' }">
							<img alt="doosan" src="img/doosan-pf.jpg">
						</c:when>
						<c:when test="${foundUser.club == '롯데자이언츠' }">
							<img alt="lotte" src="img/lotte-pf.jpg">
						</c:when>
						<c:when test="${foundUser.club == '삼성라이온즈' }">
							<img alt="samsung" src="img/samsung-pf.jpg">
						</c:when>
						<c:when test="${foundUser.club == '한화이글스' }">
							<img alt="hanhwa" src="img/hanhwa-pf.jpg">
						</c:when>
						<c:when test="${foundUser.club == '키움히어로즈' }">
							<img alt="kiwoom" src="img/kiwoom-pf.jpg">
						</c:when>
					</c:choose>

				</div>
			</div>
			<div style="text-align: right">
				<c:choose>
					<c:when test="${!followed }">
						<a
							href="${pageContext.servletContext.contextPath }/following-handle?userId=${foundUser.userId }"
							class="no-deco-link"><button type="button" class="b-1">팔로우</button></a>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/following-delete?userId=${foundUser.userId }"
							class="no-deco-link"><button type="button" class="b-1">언팔로우</button></a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>