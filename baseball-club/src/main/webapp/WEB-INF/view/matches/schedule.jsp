<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/053f0cac61.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>그공놀 | 주간 일정</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="container">
		<div class="schedule-list">
			<div class="schedule-button ">
				<button class="b-4">주간 일정</button>
				<a href="${pageContext.servletContext.contextPath }/schedule-month"
					class="no-deco-link"><button class="b-3">월별 일정</button></a> <a
					href="${pageContext.servletContext.contextPath }/schedule-team"
					class="no-deco-link"><button class="b-3">팀별 일정</button></a>

			</div>
			<div class="move-schedule">
				<a
					href="${pageContext.servletContext.contextPath }/schedule?week=${lastWeek }"
					class="no-deco-link"><i class="fa-solid fa-caret-left fa-xl"></i></a>
				<span class="dark">${thisWeek }</span> ~ <span
					class="dark">${endDate }</span> <a
					href="${pageContext.servletContext.contextPath }/schedule?week=${nextWeek }"
					class="no-deco-link"><i class="fa-solid fa-caret-right fa-xl"></i></a>
			</div>
			<div>
				<c:choose>
					<c:when test="${size != 0 }">
						<table
							style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 0;">
							<thead>
								<tr>
									<th style="width: 25%">경기일</th>
									<th style="width: 25%">경기</th>
									<th style="width: 25%">경기장</th>
								</tr>
							</thead>
							<c:forEach var="i" items="${matches }" varStatus="status">
								<c:set var="show"
									value="${status.index == 0 || matches[status.index-1].matchDate != i.matchDate}" />
								<tr style="${!show ? 'border:none':''}">
									<c:choose>
										<c:when test="${show }">
											<td>${i.matchDate }</td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
									<td>${i.summary }</td>
									<td>${i.location }</td>
								</tr>
							</c:forEach>
						</table>
					</c:when>
					<c:otherwise>
	<h1 style="text-align: center;">경기 일정이 없습니다.</h1>
	</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>