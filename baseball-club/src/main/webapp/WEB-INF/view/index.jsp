<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/053f0cac61.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>그공놀</title>
</head>
<body>
	<div>
		<%@ include file="/WEB-INF/view/common/header.jsp"%>
	</div>
	<div class="index-area">
		<div class="d-flex align-center g-1 my-3">
			<i class="fa-solid fa-up-right-from-square no-deco-link"></i> <span>구단
				홈페이지 바로가기</span>
		</div>
		<div class="club-link">
			<a href="https://tigers.co.kr/" target="_blank" title="기아타이거즈"> <img
				src="img/kia-tigers.jpg" />
			</a> <a href="https://heroesbaseball.co.kr/index.do" target="_blank"
				title="키움히어로즈"><img src="img/kiwoon-heros.jpg" /></a> <a
				href="https://www.hanwhaeagles.co.kr/index.do" target="_blank"
				title="한화이글스"><img src="img/hanhwa-eagles.jpg" /> </a> <a
				href="https://www.samsunglions.com/" target="_blank" title="삼성라이온즈"><img
				src="img/kia-tigers.jpg" /> </a> <a
				href="https://www.giantsclub.com/html/" target="_blank"
				title="롯데자이언츠"><img src="img/lotte-giants.jpg" /></a>
		</div>
		<div class="club-link">
			<a href="https://www.doosanbears.com/" target="_blank" title="두산베어스"><img
				src="img/doosan-bears.jpg" /> </a><a
				href="https://www.lgtwins.com/service/html.ncd?view=/pc_twins/twins_main/twins_main"
				target="_blank" title="LG트윈스"><img src="img/lg-twins.jpg" /> </a><a
				href="https://www.ktwiz.co.kr/" target="_blank" title="KT위즈"><img
				src="img/kt-wiz.jpg" /></a> <a href="https://www.ssglanders.com/main"
				target="_blank" title="SSG랜더스"><img src="img/ssg-landers.jpg" /></a>
			<a href="https://www.ncdinos.com/" target="_blank" title="NC다이노스"><img
				src="img/nc-dinos.png" /></a>
		</div>

		<div class="today-game">
			<h2>
				<a href="${pageContext.servletContext.contextPath }/schedule"
					class="no-deco-link"> <i class="fa-solid fa-baseball"
					style="color: #b1ccfb;"></i> <span class="kbo">TODAY GAMES</span> <i
					class="fa-solid fa-baseball" style="color: #b1ccfb;"></i>
				</a>
			</h2>
			<c:choose>
				<c:when test="${size != 0 }">
					<table>
						<thead>
							<tr>
								<th style="width: 25%">경기일</th>
								<th style="width: 25%">경기</th>
								<th style="width: 25%">경기장</th>
							</tr>
						</thead>
						<c:forEach var="i" items="${todayMatch }" varStatus="status">
							<c:set var="show"
								value="${status.index == 0 || todayMatch[status.index-1].matchDate != i.matchDate}" />
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
	<h2 style="text-align: center;">경기 일정이 없습니다.</h2>
	</c:otherwise>
			</c:choose>
		</div>
		<div>
			<p class="fw-b">🔥 게시판별 조회 수 인기글</p>
		</div>
		<div class="index-board">
			<div class="popular-board">
				<h3>
					<a href="${pageContext.servletContext.contextPath }/board/list"
						class="no-deco-link">자유게시판</a>
				</h3>

				<table>
					<c:forEach var="one" items="${plaza }">
						<c:set var="i" value="${i+1 }" />
						<tr>
							<td>${i }.</td>
							<td><a
								href="${pageContext.servletContext.contextPath }/board?boardId=${one.boardId }"
								class="no-deco-link"> ${one.title } </a></td>
							<td><i class="fa-regular fa-eye" style="color: #444;"></i>&nbsp;${one.views }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="popular-board">
				<h3>
					<a href="${pageContext.servletContext.contextPath }/board/club"
						class="no-deco-link">구단게시판</a>
				</h3>
				<table>
					<c:forEach var="one" items="${club }">
						<c:set var="j" value="${j+1 }" />
						<tr>
							<td>${j }.</td>
							<td><a
								href="${pageContext.servletContext.contextPath }/board?boardId=${one.boardId }"
								class="no-deco-link"> ${one.title } </a></td>
							<td><i class="fa-regular fa-eye" style="color: #444;"></i>&nbsp;${one.views }</td>
						</tr>
					</c:forEach>
				</table>

			</div>
			<div class="popular-board">
				<h3>
					<a href="${pageContext.servletContext.contextPath }/board/event"
						class="no-deco-link">이벤트게시판</a>
				</h3>
				<table>
					<c:forEach var="one" items="${event }">
						<c:set var="idx" value="${idx+1 }" />
						<tr>
							<td>${idx }.</td>
							<td><a
								href="${pageContext.servletContext.contextPath }/board?boardId=${one.boardId }"
								class="no-deco-link"> ${one.title } </a></td>
							<td><i class="fa-regular fa-eye" style="color: #444;"></i>&nbsp;${one.views }</td>
						</tr>
					</c:forEach>
				</table>

			</div>

		</div>



	</div>
</body>
</html>
