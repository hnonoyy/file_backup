<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | 동네도서관</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon"> 
<link rel="stylesheet" href="<%=application.getContextPath()%>/common/style.css"/>
</head>
<body>
<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
	<h2>마이페이지</h2>
		<div style="display: flex ; justify-content: flex-end; align-items: center; ">
			<a class="no_deco_link"
				href="<%=application.getContextPath()%>/index.jsp"> <img
				class="img-st" alt="🏠"
				src="https://e7.pngegg.com/pngimages/370/221/png-clipart-black-house-art-one-line-home-icon-icons-logos-emojis-home-icons.png"></a>
			&nbsp; 회원정보 &gt; <span style="color: hotpink;"> &nbsp; 마이페이지</span>
		</div>
		<p style="text-align: center;">
			<a href="<%=application.getContextPath()%>/mylib/modify.jsp"
			class="no_deco_link">정보수정</a>
		</p>
		<p style="text-align: center;">
			<a href="<%=application.getContextPath()%>/mylib/favorites.jsp"
			class="no_deco_link">내 즐겨찾기 목록</a>
		</p>
	</div>	
</body>
</html>