<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${empty title }">
		<title>핏투게더</title>
	</c:when>
	<c:otherwise>
		<title>${title }::핏투게더</title>
	</c:otherwise>
</c:choose>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css?<%=System.currentTimeMillis() %>" />
</head>
<body>
	<div>
	<c:forEach var="one" items="${picher }">
		<p>
		순위 ${one.rank }
		이름 ${one.name }
		팀명 ${one.team }
		평균자책점 ${one.era }
		게임수 ${one.game }
		승 ${one.win }
		패 ${one.lose }
		세이브 ${one.save }
		홀드 ${one.hold }
		이닝 ${one.ip }
		피안타 ${one.hit }
		홈런 ${one.hr }
		볼넷 ${one.bb }
		삼진 ${one.so }
		실점 ${one.r }
		이닝당 볼넷허용률 ${one.whip }
		</p>
	</c:forEach>
		
	</div>
	<div class="my-3">
		<%@ include file="/WEB-INF/view/common/nav.jsp" %>
	</div>
	<div class="container px-1">
		<div>
			<h1 class="text-center">핏투게더</h1>
		</div>
	</div>
	<div>
		<a href="<%=application.getContextPath() %>/events/design" 
		class="no-deco-link ">행사등록</a>
	</div>
	<div>
		<a href="<%=application.getContextPath() %>/events" 
		class="no-deco-link ">행사목록</a>
	</div>
</body>
</html>