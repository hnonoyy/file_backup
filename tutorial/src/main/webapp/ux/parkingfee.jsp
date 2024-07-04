<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주차요금 계산</title>
</head>
<body>
	<div style="text-align: center;">
	<h2>주차요금</h2>
	<p>
		요금 정산을 위해 이용한 시간(단위/분)을 입력해주세요
	</p>
	<form action="./parkingfee-result.jsp">
		<p>
			이용시간<br/>
			<input type="number" name="time" />
		</p>
		<p>
			열차사용유무<br/>
			<%-- 
				1. type radio는 name이 같은 radio 들끼리 그룹 처리된다. 
				2. radio 계열은 별도의 value 지정을 해줘야 구분된다.
			--%>
			<input type="radio" name="use" value="yes"/> 예 
			<input type="radio" name="use" value="no"/> 아니오
 		</p>
		<button type="submit"> 요금 정산 </button>
	</form>
	</div>
</body>
</html>