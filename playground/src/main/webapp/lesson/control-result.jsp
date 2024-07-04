<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,java.util.ArrayList" %>
<%
	boolean valid = false;
	int n = 0;
	String control = null;
	int answer = 0;
	List<String> log = new ArrayList<>();
	if (request.getParameter("n") == null || request.getParameter("control") == null) {
		valid = false;
	} else {
		valid = true;
		n = Integer.parseInt(request.getParameter("n"));
		control = request.getParameter("control");
		answer = n;
		log.add("inintial : " + answer);
		char[] arr = control.toCharArray();
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == 'w') {
				answer += 1;
				log.add("w (+1) : " + answer);
			} else if (arr[i] == 's') {
				answer += -1;
				log.add("s (-1) : " + answer);
			} else if (arr[i] == 'd') {
				answer += 10;
				log.add("d (10) : " + answer);
			} else {
				answer += -10;
				log.add("a (-10) : " + answer);
			}
			
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수 조작하기 풀이</title>
</head>
<body>
	<a href="../overview.jsp">메인으로 돌아가기</a>
	<div style="text-align: center;">
		<h3>수 조작하기</h3>
		<%if(valid) { %>
			<p>
				전달받은 파라미터 <b>n(<%=n%>)
				</b> 과 <b>control(<%=control%>)
				</b> 값에 따라 수를 조작합니다.
			</p>
			<p>
			<%for(String one : log) { %>
				<%=one %><br/>
			<%} %>
			</p>
			<p>
				최종 조작 결과는 <b style="font-size: 1.5rem"><%=answer%></b> 입니다.
			</p>
		<%}else { %>
			<p>
				n과 control 값은 필수로 전달되어야 합니다.
			</p>
		<%} %>
	</div>
	<a href="./control.jsp">문제 다시 풀어보기</a>
</body>
</html>



