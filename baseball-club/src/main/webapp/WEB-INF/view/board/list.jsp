<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그공놀 | 자유 게시판</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div class="container">
		<div class="board-list">
			<p>자유게시판</p>
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
				<c:forEach var="one" items="${announcement }">

					<tr>
						<td>📢</td>
						<td class="warning">${one.category }</td>
						<td class="dark"><a
							href="${pageContext.servletContext.contextPath }/board?boardId=${one.boardId }"
							class="no-deco-link fw-b"> ${one.title } </a></td>
						<td>${one.writerId }</td>
						<td>${one.writedAt }</td>
						<td>${one.views }</td>
					</tr>
				</c:forEach>
				<c:forEach var="one" items="${boards }">
					<tr>
						<td>${one.board.type }</td>
						<td>${one.board.category }</td>
						<td><a
							href="${pageContext.servletContext.contextPath }/board?boardId=${one.board.boardId }"
							class="no-deco-link"> ${one.board.title } <c:if
									test="${one.commentCount != 0 }">
									<span class="emphasize">[${one.commentCount }]</span>
								</c:if>
						</a></td>
						<td>${one.board.writerId }</td>
						<td>${one.board.writedAt }</td>
						<td>${one.board.views }</td>
					</tr>
				</c:forEach>
			</table>
			<div class="text-center">
				<a>${totalPages }</a>
			</div>
			<div
				style="display: flex; justify-content: center; gap: 50px; align-items: center; margin-top:10px; margin-left: 120px;">
				<div style="margin-right: 50px;">
					<form
						action="${pageContext.servletContext.contextPath}/board/search">
						<input type="hidden" name="type" value="자유"> <input
							type="text" class="srch-bar" placeholder="검색어를 입력하세요" size=60
							style="padding: 8px; height: 40px; border-radius: 10px"
							name="word">
						<button type="submit" class="b-1 ">검색</button>
					</form>
				</div>
				<div>
					<a href="${pageContext.servletContext.contextPath }/board/new"
						class="no-deco-link"><button type="button" class="b-1 ">새글작성</button></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>