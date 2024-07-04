<%@page import="model.GameResult"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int[] target = (int[])session.getAttribute("target");
	List<GameResult> log = (List<GameResult>)session.getAttribute("log");
	/*
	if(application.getAttribute("StartTime")==null){
		application.setAttribute("StartTime", System.currentTimeMillis());
	}
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자야구</title>
</head>
<body>
	<div style="text-align: center">
		<h1>숫.자.야.구</h1>
		<%if(target == null) { %>
			<h3>죄송합니다, 오류입니다.</h3>
			<p>
				이용에 불편을 드린 점 진심으로 사과드리며, 다시 한번 정상적인 경로로 접근해주세요.
			</p>
			<p>
				<a href="<%=request.getContextPath()%>/baseball/ready.jsp">시작화면으로</a>
			</p>
		<%}else{ %>
			<p>
				각 자리에 숫자(<b>0 ~ 9</b> 까지)를 입력하여 <b>제시</b>해주세요.
			</p>
			<form action="<%=request.getContextPath()%>/baseball/result.jsp">
				<p>
					<input type="number" name="guess" min="0" max="9" 
						style="width: 80px; height: 80px; text-align: center; font-size: 20pt" />
					<input type="number" name="guess" min="0" max="9"
						style="width: 80px; height: 80px; text-align: center; font-size: 20pt" />
					<input type="number" name="guess" min="0" max="9"
						style="width: 80px; height: 80px; text-align: center; font-size: 20pt" />
				</p>
				<p>
					<button type="submit" 
						style="width: 90px; height: 40px;">제시하기</button>
				</p>
			</form>
			<%for(GameResult one : log){ %>
				<p> 선택한 숫자 : <%= one.guess()[0] %><%= one.guess()[1] %><%= one.guess()[2] %>
				<b style="color: #ffb6b6;"> <%= one.strike() %>S </b> <b style="color: #155eb6;"> <%=one.ball() %> B </b>
				</p>
			<%} %>
		<%} %>

	</div>
</body>
</html>