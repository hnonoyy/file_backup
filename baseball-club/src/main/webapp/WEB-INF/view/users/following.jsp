<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그공놀 | 팔로잉</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="follow">
		<div class="follow-box">
			<div class="text-right">
				<a href="${pageContext.servletContext.contextPath }/mypage"> <i
					class="fa-solid fa-user no-deco-link mx-2"></i>
				</a>
			</div>
			<div>
				<span>${sessionScope.authUser.userId }님의 💙</span>
			</div>
			<div class="d-flex g-1 justify-center my-6 fs-1 ">
				<span>팔로워</span> <a class="no-deco-link"
					href="${pageContext.servletContext.contextPath }/follower/list">
					<span class="hash fw-b">${follower }</span><span>명</span>
				</a> <span>팔로잉</span> <a class="no-deco-link"
					href="${pageContext.servletContext.contextPath }/following/list"><span
					class="hash fw-b">${following }</span><span>명</span></a>
			</div>
		</div>
	</div>
</body>
</html>