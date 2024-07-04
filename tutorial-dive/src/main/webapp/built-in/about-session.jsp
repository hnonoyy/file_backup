<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession httpSession = request.getSession();
	String id = httpSession.getId(); // 서버가 세션을 만들며 부여한 식별값
	boolean isNew = httpSession.isNew();  // 새 세션인지 확인
	int interval = httpSession.getMaxInactiveInterval(); // 비활성화 상태에서 최대 유지시간
	long current = System.currentTimeMillis(); // 현재시간
	long creationTime = httpSession.getCreationTime(); // 이 클라이언트이 세션이 만들어진 시간
	long lastAccessedTime = httpSession.getLastAccessedTime(); 
	// 세션이 마지막으로 갱신됐던 시간(이 사용자가 이번 요청 직전에 요청을 보냈던 시간)
	
	// 세션(맵형 저장소) 스토리지를 사용하는 방법 setAttribute / getAttribute / removeAttribute
	httpSession.setAttribute("visited", "on");
	httpSession.setAttribute("count", 1);
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session :: built-in Objects</title>
</head>
<body>
<%@ include file="/nav.jsp" %>
	<h2>HttpSession session</h2>
	<p>
		세션은 서버가 사용자의 브라우저를 식별하고 사용자의 상태를 추적할 수 있게 하는 개별 저장소다. 
		한번 만들어진 세션은 30분 유지시간(디폴트값)을 갖게된다.
		이 유지시간 안에 이 세션을 사용하고 있던 사용자가 서버에 요청을 보내지 않는다면 이 세션은 파괴된다.
	</p>
	<ul>
		<li> isNew : <%= isNew %></li>
		<li> session id : <%= id %> </li>
		<li> MaxInactiveInterval : <%= interval %> </li>
		<li> creationTime : <%=creationTime %></li>
		<li> elapsedTime : <%=current - creationTime %></li>
		<li> lastAccessedTime : <%=lastAccessedTime %> </li>
		<li> ?? : <%= current - lastAccessedTime %></li>
	</ul>
</body>
</html>