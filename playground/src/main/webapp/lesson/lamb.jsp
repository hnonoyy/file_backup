<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>양꼬치 계산</title>
</head>
<body>
<a href="../overview.jsp">메인으로 돌아가기</a>
	<div style="text-align: center;">
		<h2>양꼬치 계산하기</h2>
		<p>
			양꼬치는 1인분에 12,000원 음료수는 2,000원입니다.<br/>
			입력한 값을 이용해 결과를 알려드립니다.<br/>
			양꼬치 10인분을 먹으면 음료수 하나는 서비스 입니다.<br/>
		</p>
		 <form action="./lamb-result.jsp">
			<p>
			 	양꼬치를 몇 인분 먹었나요?<br/>
			 	<input type="number" style="text-align: center;" name ="n"/>	 	
			</p>
			<p>
				음료수는 몇 개를 먹었나요? <br/>
				<input type="number" style="text-align: center;" name ="k"/>
			</p>
		 	<p>
		 		<button type="submit">결과보기</button>
		 		<button type="reset">재작성하기</button>
		 	</p>
		 </form>
	</div>
</body>
</html>