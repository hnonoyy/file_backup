<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="./parkingfee-error.jsp" %>
<%
	int time = Integer.parseInt(request.getParameter("time")); // 총이용시간(단위 분)
	String use = request.getParameter("use");
	/*
		무료회차 : 30분 /  기본 30분 : 1500 , 10분당 500원, (열차이용객 30% 할인) 
	*/
	int fee = 0;
	int sale = 0;
	
	if (time > 30) {
		fee = 1500;
		int overTime = (time - 30);
		fee += overTime / 10 * 500 + (overTime % 10 > 0 ? 500 : 0);
		if(use.equals("yes")){
			sale = (int)(fee*0.3);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주차요금 계산</title>
</head>
<body>
	<div style="text-align: center;">
		<h2>주차요금 계산결과</h2>
		<p>
			총 이용시간 <b><%=time%></b> 분에 해당하는 요금 계산결과입니다.
		</p>
		<p>
			사용시간에 따른 금액 (￦<%=String.format("%,d", fee) %>) - 열차사용에 따른 할인 금액 (￦<%=String.format("%,d", sale) %>)
		</p>
		<p>
			최종요금 (￦<%=String.format("%,d", fee-sale) %>)
		</p>
	</div>
</body>
</html>
























