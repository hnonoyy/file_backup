<%@page import="java.util.Comparator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model.GameResult"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Rank"%>
<%@ page errorPage="/baseball/error.jsp" %>
<%
	String[] tempGuess = request.getParameterValues("guess"); 
	
	int[] guess = new int[3];
	guess[0] = Integer.parseInt(tempGuess[0]);
	guess[1] = Integer.parseInt(tempGuess[1]);
	guess[2] = Integer.parseInt(tempGuess[2]);
	
	int[] target = (int[])session.getAttribute("target");
	List<Integer> targetList = new ArrayList<>();
	targetList.add(target[0]);
	targetList.add(target[1]);
	targetList.add(target[2]);
	
	int strike = 0;
	int ball = 0;
	for(int i=0; i<guess.length;i++){
		if(targetList.contains(guess[i])){
			int idx = targetList.indexOf(guess[i]);
			if(idx == i){
				strike ++;
			}else{
				ball++;
			}
		}
	}
			
	List<GameResult> log = (List<GameResult>)session.getAttribute("log");
	GameResult history = new GameResult(guess,strike,ball);
	log.add(history);
	
	boolean isEnd = strike == 3 ? true:false;
	int result = -1;
	if(isEnd){
		String ip = request.getRemoteAddr();
		int turn = log.size();
		long elapsed = System.currentTimeMillis() - (long)session.getAttribute("startTime");
		
		Rank r = new Rank(ip,turn,elapsed);
		List<Rank> ranks = (List<Rank>)application.getAttribute("ranks");
		ranks.add(r);
		
		ranks.sort(new Comparator<Rank>() {
		     public int compare(Rank one, Rank other) {
		        if(one.turn() < other.turn()) {
		           return -1;
		        } else if(one.turn() > other.turn() ) {
		           return 1;
		        } else {
		           if(one.elapsed() < other.elapsed()) {
		             return -1;
		           }else if(one.elapsed() > other.elapsed()) {
		                return 1;
		            }else {
		                return 0;
		            }
		        }
		     }
		});
		result = ranks.indexOf(r);
	}
	long current = System.currentTimeMillis();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숫자야구</title>
</head>
<body>
	<div style="text-align: center;">
		<h1>숫.자.야.구</h1>
		<p>
			제시한 숫자 <b style="font-size: 18pt;"> [<%= guess[0] %>][<%= guess[1] %>][<%= guess[2] %>] </b>의 결과를 알려드립니다.
			
		</p>
		<% if(strike ==0 && ball==0){ %>
			<p style="font-size : 60pt ">
				<b style="color:#ff4047 ;">out</b>
			</p>
		<%} else{%>
			<p style="font-size: 50pt">
				<b style="color: #ffb6b6;"><%=strike %>S</b>
				<b style="color: #155eb6;"><%=ball %>B</b>
			</p>
		<% } %>
		<p>
			<% if (isEnd) {%>
				<b>승리하셨습니다.</b> 
				<b><%=result+1 %>위 등극!</b>
				<a href="<%=request.getContextPath()%>/baseball/ready.jsp">게임을 다시 시작하시겠습니까?</a>
			<% } else { %>
				<a href="<%=request.getContextPath()%>/baseball/game.jsp">다시 숫자를 입력해보시겠어요?</a>
			<% } %>
		</p>
		
		
		
		
	</div>
</body>
</html>