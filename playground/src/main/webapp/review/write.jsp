<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;">
		<h2>리뷰 &#128172; </h2>
		<form action="<%=request.getContextPath()%>/review/write-result.jsp">
			<p style="border-style: groove; height: 50px; width: 200px; align-content: center;
			margin-left: auto; margin-right: auto;"> 
				<input style="padding: 10px; border: graytext;" type="text" name="writer" placeholder="작성자"/>
			</p>
			<p style="border-style: groove; margin-left: auto; margin-right: auto; 
			align-content: center; height: 250px; width: 200px;">
				<input style="padding: 10px; border: graytext;" type="text" placeholder="내용을 입력해주세요" name="message"/>
			</p>
			<p> 평점(1 ~ 5점) <br/>
				<input type="range" name="score" min="1" max="5" />
			</p>
			<button type="submit" style="background-color: white; border-color: scrollbar;">리뷰남기기</button>
		</form>
	</div>
	
</body>
</html>