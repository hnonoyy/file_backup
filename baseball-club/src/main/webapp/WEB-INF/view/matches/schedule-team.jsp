<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그공놀 | 팀별 경기 일정</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="schedule-area">
		<div class="schedule-team-list">
			<div class="schedule-button">
				<a href="${pageContext.servletContext.contextPath }/schedule"
					class="no-deco-link"><button class="b-3">주간 일정</button></a><a
					href="${pageContext.servletContext.contextPath }/schedule-month"
					class="no-deco-link"><button class="b-3">월별 일정</button></a>
				<button class="b-4">팀별 일정</button>
			</div>
			<div style="margin: auto; text-align: center; margin-bottom: 8px;">
				<c:choose>
					<c:when test="${teamName == 'LG' }">
						<span style="color: #a50034;">LG</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=LG"
							class="no-deco-link">LG</a>
					</c:otherwise>
				</c:choose>
				|
				<c:choose>
					<c:when test="${teamName == 'KT' }">
						<span style="color: red;">KT</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=KT"
							class="no-deco-link">KT</a>
					</c:otherwise>
				</c:choose>
				|
				<c:choose>
					<c:when test="${teamName == 'SSG' }">
						<span style="color: #ce0e2d;">SSG</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=SSG"
							class="no-deco-link">SSG</a>
					</c:otherwise>
				</c:choose>
				|
				<c:choose>
					<c:when test="${teamName == 'NC' }">
						<span style="color: #5c8ebb;">NC</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=NC"
							class="no-deco-link">NC</a>
					</c:otherwise>
				</c:choose>
				|
				<c:choose>
					<c:when test="${teamName == '두산' }">
						<span style="color: #131230;">두산</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=두산"
							class="no-deco-link">두산</a>
					</c:otherwise>
				</c:choose>
				|
				<c:choose>
					<c:when test="${teamName == 'KIA' }">
						<span style="color: #760c0c;">KIA</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=KIA"
							class="no-deco-link">KIA</a>
					</c:otherwise>
				</c:choose>
				|
				<c:choose>
					<c:when test="${teamName == '롯데' }">
						<span style="color: #041e42;">롯데</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=롯데"
							class="no-deco-link">롯데</a>
					</c:otherwise>
				</c:choose>
				|
				<c:choose>
					<c:when test="${teamName == '삼성' }">
						<span style="color: #074ca1;">삼성</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=삼성"
							class="no-deco-link">삼성</a>
					</c:otherwise>
				</c:choose>
				|
				<c:choose>
					<c:when test="${teamName == '한화' }">
						<span style="color: #FF6600;">한화</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=한화"
							class="no-deco-link">한화</a>
					</c:otherwise>
				</c:choose>
				|
				<c:choose>
					<c:when test="${teamName == '키움' }">
						<span style="color: #972546;">키움</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.servletContext.contextPath }/schedule-team?teamName=키움"
							class="no-deco-link">키움</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="move-schedule">
				<a
					href="${pageContext.servletContext.contextPath }/schedule-team?teamName=${teamName }&month=${previous }"
					class="no-deco-link"><i class="fa-solid fa-caret-left fa-xl"></i></a>
				<span class="emphasize">${month }</span>월 일정 <a
					href="${pageContext.servletContext.contextPath }/schedule-team?teamName=${teamName }&month=${next }"
					class="no-deco-link"><i class="fa-solid fa-caret-right fa-xl"></i></a>
			</div>
			<div>
				<c:choose>
					<c:when test="${size != 0 }">
						<table
							style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 0;">
							<thead>
								<tr class="tr-${param.teamName }">
									<th style="width: 25%">경기일</th>
									<th style="width: 25%">경기</th>
									<th style="width: 25%">경기장</th>
								</tr>
							</thead>
							<c:forEach var="i" items="${matches }">
								<tr>
									<td>${i.matchDate }</td>
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