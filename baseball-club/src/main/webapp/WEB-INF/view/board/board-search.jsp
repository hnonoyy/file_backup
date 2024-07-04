<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 검색 결과</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="container">
		<div class="board-list">
			<p style="text-align: center;">${type }게시판
				<span style="color: blue;">${word }</span> 검색결과
			</p>
			<c:choose>
				<c:when test="${searchList.size() != 0 }">
					<table>
						<thead>
							<tr>
								<th>게시판</th>
								<th>말머리</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<c:forEach var="one" items="${searchList }">
							<tr>
								<td>${one.type }</td>
								<td>${one.category }</td>
								<td><a
									href="${pageContext.servletContext.contextPath }/board?boardId=${one.boardId }"
									class="no-deco-link"> ${one.title }</a></td>
								<td>${one.writerId }</td>
								<td>${one.writedAt }</td>
								<td>${one.views }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="text-center">
						<a>${totalPages }</a>
					</div>
				</c:when>
				<c:otherwise>
					<h1 style="text-align: center;">검색결과가 없습니다.</h1>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</body>
</html>