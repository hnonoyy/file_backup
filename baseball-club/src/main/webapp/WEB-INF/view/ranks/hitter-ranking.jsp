<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그공놀 | 타자 순위</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div style="padding: 8px; margin: auto; width: 1140px;">
		<div class="board-list">
			<div style="margin: auto; text-align: center; margin-bottom: 8px;">
				<button class="b-5">타자 순위</button>
				<a href="${pageContext.servletContext.contextPath }/pitcher-ranking"
					class="no-deco-link"><button class="b-3">투수 순위</button></a>
			</div>
			<div>
				<table
					style="margin-left: auto; margin-right: auto; text-align: center">
					<thead>
						<tr>
							<th style="width: 5%;">순위</th>
							<th style="width: 5%;">선수명</th>
							<th style="width: 5%;">팀명</th>
							<th style="width: 5%;">타율</th>
							<th style="width: 5%;">경기수</th>
							<th style="width: 5%;">타석</th>
							<th style="width: 5%;">타수</th>
							<th style="width: 5%;">득점</th>
							<th style="width: 5%;">안타</th>
							<th style="width: 5%;">홈런</th>
							<th style="width: 5%;">RBI</th>
							<th style="width: 5%;">볼넷</th>
							<th style="width: 5%;">삼진</th>
							<th style="width: 5%;">OPS</th>
						</tr>
					</thead>
					<c:forEach var="i" items="${hitterRanking }">
						<tr>
							<td>${i.rank }</td>
							<td>${i.name }</td>
							<td>${i.teamName }</td>
							<td>${i.average }</td>
							<td>${i.game }</td>
							<td>${i.pa }</td>
							<td>${i.atBats }</td>
							<td>${i.score }</td>
							<td>${i.hit }</td>
							<td>${i.homerun }</td>
							<td>${i.rbi }</td>
							<td>${i.bb }</td>
							<td>${i.so }</td>
							<td>${i.ops }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>