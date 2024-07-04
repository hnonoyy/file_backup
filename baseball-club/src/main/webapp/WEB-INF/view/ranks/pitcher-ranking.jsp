<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그공놀 | 투수 순위</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div style="padding: 8px; margin: auto; width: 1140px;">
		<div class="board-list">
			<div style="margin: auto; text-align: center; margin-bottom: 8px;">
				<a href="${pageContext.servletContext.contextPath }/hitter-ranking"
					class="no-deco-link"><button class="b-3">타자 순위</button></a>
				<button class="b-5">투수 순위</button>
			</div>
			<div>
				<table
					style="margin-left: auto; margin-right: auto; text-align: center">
					<thead>
						<tr>
							<th style="width: 6%;">순위</th>
							<th style="width: 8%;">선수명</th>
							<th style="width: 6%;">팀명</th>
							<th style="width: 8%;">방어율</th>
							<th style="width: 8%;">경기수</th>
							<th style="width: 4%;">승</th>
							<th style="width: 4%;">패</th>
							<th style="width: 8%;">세이브</th>
							<th style="width: 6%;">홀드</th>
							<th style="width: 8%;">이닝</th>
							<th style="width: 8%;">피안타</th>
							<th style="width: 8%;">피홈런</th>
							<th style="width: 6%;">볼넷</th>
							<th style="width: 6%;">삼진</th>
							<th style="width: 6%;">실점</th>
							<th style="width: 5%;">WHIP</th>
						</tr>
					</thead>
					<c:forEach var="i" items="${pitcherRanking }">
						<tr>
							<td>${i.rank }</td>
							<td>${i.name }</td>
							<td>${i.team }</td>
							<td>${i.era }</td>
							<td>${i.game }</td>
							<td>${i.win }</td>
							<td>${i.lose }</td>
							<td>${i.save }</td>
							<td>${i.hold }</td>
							<td>${i.ip }</td>
							<td>${i.hit }</td>
							<td>${i.hr }</td>
							<td>${i.bb }</td>
							<td>${i.so }</td>
							<td>${i.r }</td>
							<td>${i.whip }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>