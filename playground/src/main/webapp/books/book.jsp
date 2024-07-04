<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>도서 등록</title>
</head>
	<style>
  		body, h1, h2, h3, h4, h5, h6, p, span, button {
    	font-family: 'Jua'!important;
 		}
 		div{
 			text-align: center;
 			width: 100%;
 			
 		}
 		div.left{
 			text-align: center;
 			position:relative;
 			width: 50%;
        	float: left;
 		}
 		div.rigth{
 			text-align: center;
 			position:relative;
 			width: 50%;
        	float: rigth;
 		}
 		img{ 
 			opacity: 0.5;
 		}
 		header{
 			background-image: url("https://i.pinimg.com/564x/b2/28/3c/b2283cbfcef9129c109086c859d8e13a.jpg");	
 			background-size: cover;
 			background-repeat:no-repeat;
 			height: 300px; 
 			opacity: 0.7;
 		}
 		input {
			border-style: hidden; 
			padding: 10px;
			
		}
		input::-webkit-outer-spin-button,
		input::-webkit-inner-spin-button {
 			-webkit-appearance: none;
  			margin: 0;
  
		}	
		button {
			border: none;
			color: white;
			padding: 16px 32px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			transition-duration: 0.4s;
			cursor: pointer;
			border-radius: 20px;
			position:fixed;
			top: 680px;
			left: 900px;
		}
		.button1 {
		  	background-color: white; 
		  	color: #404554 ; 
		  	border: 2px solid #79a4c2;
		}
	</style>
<body>
	<header></header>
	<h1 style = "color: #404554; text-align: center;">	
	📖 중고도서 등록 📖
	</h1>
	<hr/>
	<div>
		<p style="font-size: large;"> 📢 판매할 책 정보를 입력해주세요</p>
		<form action="<%=request.getContextPath()%>/books/book-result.jsp">
			<div class="left">
				<p style="text-indent: 70%; "> 책제목
					<input type="text" name="title"/>
				</p>
				<p style="text-indent: 70%;"> 글쓴이
					<input type="text" name="author" />
				</p>	
				<p style="text-indent: 70%;"> 출판사
					<input type="text" name="publisher" />
				</p>
			</div>
			<div class="right">
				<p style="text-align: left; text-indent: 50px; padding-top: 15px "> 정가
					<input type="number" name="price" min="0" max="999999" style="text-align: right;"/>원
				</p>
				<p style="text-align: left; text-indent: 50px;">판매가
					<input type="number" name="saleprice" min="0" max="999999" style="text-align: right;"/>원
				</p>
				<p style="text-align: left; text-indent: 50px; padding-top: 10px; padding-bottom: 50px"> 상품상태
					<input type="radio" name="status" value="최상" /> 
					<label for="최상">최상</label>
					<input type="radio" name="status" value="상" />
					<label for="상">상</label>
					<input type="radio" name="status" value="중" />
					<label for="중">중</label>
				</p>
			</div>
			<div class="left">
				<button class="button button1" type="submit">등록하기</button>
			</div>
		</form>
	</div>
</body>
</html>