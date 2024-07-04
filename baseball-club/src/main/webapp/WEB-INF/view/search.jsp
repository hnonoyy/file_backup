<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div style="padding: 8px; margin: auto; width: 1140px;">
		<div style="margin: auto; text-align: center; margin-bottom: 8px;">
			<h1>
				<span style="color: blue;">${word }</span> 검색결과
			</h1>
		</div>
		<div style="margin: auto; text-align: center;">
			<div class="container">
				<div class="board-list">
					<c:choose>
						<c:when test="${boardsize != 0 }">
							<div>
								<table
									style="margin-left: auto; margin-right: auto; text-align: center">
									<thead>
										<tr>
											<th style="width: 5%;">게시판</th>
											<th style="width: 5%;">말머리</th>
											<th style="width: 15%;">제목</th>
											<th style="width: 8%;">작성자</th>
										</tr>
									</thead>
									<c:forEach var="one" items="${boards }">
										<tr>
											<td>${one.type }</td>
											<td>${one.category }</td>
											<td><a
												href="${pageContext.servletContext.contextPath }/board?boardId=${one.boardId }"
												class="no-deco-link"> ${one.title } </a></td>
											<td>${one.writerId }</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</c:when>
						<c:otherwise>
							<p style="text-align: center;">검색 결과가 없습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

	</div>
</body>
</html>