<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그공놀 | 팀 순위</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>
	<%@ include file="/WEB-INF/view/common/header.jsp"%>
	<div style="padding: 8px; margin: auto; width: 1140px;">
		<div class="board-list">
			<div style="text-align: center; margin: auto; margin-top: 10px;">
				<table style="margin-left: auto; margin-right: auto;">
					<thead>
						<tr>
							<th style="width: 6%">순위</th>
							<th colspan="2" style="width: 15%">팀명</th>
							<th style="width: 10%">경기수</th>
							<th style="width: 10%">승</th>
							<th style="width: 10%">패</th>
							<th style="width: 10%">무</th>
							<th style="width: 10%">승률</th>
							<th style="width: 10%">게임차</th>
							<th style="width: 8%">연속</th>
						</tr>
					</thead>
					<c:forEach var="i" items="${teamRanking }">
						<tr>
							<td>${i.rank }</td>
							<td colspan="2">
								<div
									style="display: flex; justify-content: center; text-align: center;">
									<c:if test="${i.name == 'KIA'}">
										<img
											src="https://i.namu.wiki/i/JkdlAhhQcnMmcqrazf1FlVsvrG_tWJFfE9ye2uMTVK60MIiRYfqPCcGI4ofXWDS4YnKjedYoyIvKYbCzJ6qpoZvyYnN9vtk1PbQzCf8wka3u8E2voypso3qaSfbe7P9ocxAXbdCEynJcCRmBp7sD-w.svg"
											witdth="30px" height="30px" />
									</c:if>
									<c:if test="${i.name == '키움'}">
										<img
											src="https://i.namu.wiki/i/Qub5dLxWr5nWffYFnvtlK2AAdJ6Ei1DLXiGW52owxP3DhfZImoOrRUnoI4WXNcNl6VJ7b0G6pVLdcsAp0EScyjZd5mNU7JonX4kmjCZ7BMNPc-qgCN3D8GoxWiwL7tX3-1l8lrmgicTEZfDSECgqXA.svg
							"
											width="30px" height="30px" />
									</c:if>
									<c:if test="${i.name == '한화'}">
										<img
											src="https://i.namu.wiki/i/dJMR7enHxv_U53_auaywWJ4KT9UmYGZxjxlNKPA8o_A-wvk22vUOukMgk6lJBxz-UiGdQPir4jMQNIV9WJyl_Pw5sfSL6nYwRzHeVfd-OiJT9YkuVfjNDCNMcxFc7s8kk0nz_2a_zMQ0pN7ZZI0aYA.svg
							"
											width="30px" height="30px" />
									</c:if>
									<c:if test="${i.name == '삼성'}">
										<img
											src="https://i.namu.wiki/i/cMZ4a4jUU7GFisAbHVU7FFCeUZeb5U2kz5JFwn-Oy4hZgh-QKs34f3-w9xRBEwPgyK73V_VRu6RA68PWZPHDlFOceN_1HihQ1R1lHyh12UzY1feqXl6h9olx1JizZVbP9O9GqGkZz0KUGSvomo9J9g.svg
							"
											width="30px" height="30px" />
									</c:if>
									<c:if test="${i.name == '롯데'}">
										<img
											src="https://i.namu.wiki/i/JKabDmgmnwQ7HcK68kOJiicJ074aI41QWe0ZQCpLKFoRkA1eXqBlVUdZNVurwF1_Eu5QHwm45JkSTQSPlmpSFGUNS0gS92WiNMLr9I80syKnreng2ndUnBR2SX0iAFAag6PZBU3olhUejZ5KkINMHQ.svg
							"
											width="30px" height="30px" />
									</c:if>
									<c:if test="${i.name == '두산'}">
										<img
											src="https://i.namu.wiki/i/JfBCPwmvKM-gyBQi1J9IsWixMaYsp1MdmAtk7wvpBitQLSioLYI45vYA7XLkjmFP1udeIYSzKHPlXqTTA1aIgXTUgKMWJZiP36OowNC1RlYiLSlbAW7druy-JaY6Hn8ctQq7CaNxvMLWCqE1vVNbjA.svg
							"
											width="30px" height="30px" />
									</c:if>
									<c:if test="${i.name == 'LG'}">
										<img
											src="https://i.namu.wiki/i/JMNSXMOBgP23YaYnROHsjYL-UxC_q7zESQ0cGzRbs_r20OxsIignk6ssM2lwvkaxoH-ea0P5u3_fzcmPcSzqFM1ubAh7sulPTr--i3JXrSBSw2Gy1pyP1wMrEtj8RDKV3KbOOxNFn0-_ICryaS2Y6Q.svg"
											width="30px" height="30px" />
									</c:if>
									<c:if test="${i.name == 'KT'}">
										<img
											src="https://i.namu.wiki/i/xfGslulXUvzz-abZDFaced_Zb-FxzAxut_kdDQlXRicxhzEtuNJCn48jABtf0QpBQ47LMBiDJzC4AT3Fw0Jtkg.svg
							"
											width="30px" height="30px" />
									</c:if>
									<c:if test="${i.name == 'SSG'}">
										<img
											src="https://i.namu.wiki/i/wcOGW0ui6neqGNcccYyy7FInd2gXCgQFcZGc9P-rL84NTJ4gmLPi2x-FfC7Z6JppstoWxxMjMu7BX-0tEYiW_XMwNM2hlPfWMyUGmfo1noR-52qPjpr436P5uVyrVKQEBxNaToPWkYqcPKm4QPBDVg.svg
							"
											width="30px" height="30px" />
									</c:if>
									<c:if test="${i.name == 'NC'}">
										<img
											src="https://i.namu.wiki/i/7U4K0G1nqS7g6opb89q9BWS3o4UkskaGPGTgVqpLwQyBaLA6dwhZ-v_giJ0AQqZawbG96f8ucODhyGJd4QBuu8uXKD9kfD94XfEfLH_OwGeaHMMYKiQepXT9liqeA5CLoiQnOYziqrr8qBL4o-_QWw.svg"
											width="30px" height="30px" />
									</c:if>
									<span style="margin-left: 10px;">${i.name }</span>
								</div>
							</td>
							<td>${i.games }</td>
							<td>${i.win }</td>
							<td>${i.lose }</td>
							<td>${i.draw }</td>
							<td>${i.winningPercentage }</td>
							<td>${i.gameBehind }</td>
							<td>${i.stream }</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</div>
</body>
</html>