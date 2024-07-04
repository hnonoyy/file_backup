<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그공놀 | 작성글</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="container">
		<div class="board-list">
			<p>내가 쓴 게시글</p>
			<table>
				<thead>
					<tr>
						<th>게시판</th>
						<th>말머리</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<c:forEach var="one" items="${boardList }">
					<tr>
						<td>${one.type }</td>
						<td>${one.category }</td>
						<td><a
							href="${pageContext.servletContext.contextPath }/board?boardId=${one.boardId }"
							class="no-deco-link"> ${one.title } </a></td>
						<td>${one.writedAt }</td>
					</tr>
				</c:forEach>
			</table>
			<div class="text-center">
				<a>${totalPages }</a>
			</div>
		</div>
	</div>
</body>
</html>