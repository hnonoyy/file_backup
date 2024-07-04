<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/053f0cac61.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>팔로잉</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="follow">
		<div class="follower">
			<div class="text-right">
				<a href="${pageContext.servletContext.contextPath }/following">
					<i class="fa-solid fa-user-plus no-deco-link"></i>
				</a>
			</div>
			<div class="">
				<span>${sessionScope.authUser.userId }님의 팔로잉 목록</span>
			</div>
			<div class="">
				<ul>
					<c:forEach var="i" items="${followings }">
						<li><a
							href="${pageContext.servletContext.contextPath }/profile?userId=${i.followingId }"
							class="no-deco-link mx-2">${i.followingId }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>