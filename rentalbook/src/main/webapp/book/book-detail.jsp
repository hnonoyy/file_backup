<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="rentalbook.vo.Favorite"%>
<%@page import="rentalbook.vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	Book found;
	if(request.getParameter("bookId") == null){
		found = null;
	}else{
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		
		BookDao bookDao = new BookDao();
		found = bookDao.findByBookId(bookId);
	}
	
	int bookId = Integer.parseInt(request.getParameter("bookId"));
	boolean isFavorited = false;
	
	String authUserId=(String)session.getAttribute("auth_user_id");
	FavoriteDao favoriteDao = new FavoriteDao();
	
	List<Favorite> favoriteList = favoriteDao.findByUserId(authUserId);
	for(Favorite one : favoriteList){
		if(one.bookId() == bookId){
			isFavorited = true;
			break;
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서검색 | 동네도서관</title>
<link rel="icon"  href="<%=application.getContextPath()%>/favicon.ico">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
	<h2>도서검색</h2>
		<div style="display: flex ; justify-content: flex-end; align-items: center; ">
			<a class="no_deco_link"
				href="<%=application.getContextPath()%>/index.jsp"> <img
				class="img-st" alt="🏠"
				src="https://e7.pngegg.com/pngimages/370/221/png-clipart-black-house-art-one-line-home-icon-icons-logos-emojis-home-icons.png"></a>
			&nbsp; 도서검색 &gt; <span style="color: hotpink;"> &nbsp; 상세보기 </span>
		</div>
		<div class="bdt">
			<b><%=found.title() %></b>
		</div>
		
		<div class="bdb">
			<div style="text-align: center;">
				<img alt="book" src="<%=found.imageUrl()%>" class="default-img">
				<%if(found.categoryName().equals("일반행정")){%>
					<p class="cn1">
						<%=found.categoryName() %>
					</p>
				<%}else if(found.categoryName().equals("문화/관광")){%>
					<p class="cn2">
						<%=found.categoryName() %>
					</p>
				<%}else if(found.categoryName().equals("역사/사료")){%>
					<p class="cn3">
						<%=found.categoryName() %>
					</p>
				<%}else if(found.categoryName().equals("연구/논문")){%>
					<p class="cn4">
						<%=found.categoryName() %>
					</p>
				<%}else if(found.categoryName().equals("통계")){%>
					<p class="cn5">
						<%=found.categoryName() %>
					</p>
				<%}%>
			</div>
			
			<div style="text-indent: 50px">
				<dl class="default-dl">
					<dt> ♡ <%=found.rentalCnt() %></dt>
				</dl>
				<dl class="default-dl">
					<dt>도서번호</dt>
					<dd><%=found.bookId() %></dd>
				</dl>
				<dl class="default-dl">
					<dt>분류번호</dt>
					<dd><%=found.categoryId() %></dd>
				</dl>
				<dl class="default-dl">
					<dt>출판사</dt>
					<dd><%=found.publisher() %></dd>
				</dl>
				<dl class="default-dl">
					<dt>페이지수</dt>
					<dd><%=found.pages() %></dd>
				</dl>
			</div>
		</div>
		<div class="bd-t">
			<span>책소개</span>
		</div>
		<div class="bd-des">
			<p style="font-size:0.9rem; text-indent: 0; padding: 5px"><%=found.description() == null ? "설명없음" : found.description()%></p>
		</div>
	</div>
	<div class="button-style1">
	<%if(!isFavorited) { %>
		<a href="<%=application.getContextPath()%>/book/add-favorite.jsp?bookId=<%=found.bookId()%>">
			<button type="button" class="bt-s bt-s2">찜</button>
		</a>
	<%}else{ %>
		<a href="<%=application.getContextPath()%>/book/add-favorite.jsp?bookId=<%=found.bookId()%>">
			<button type="button" class="bt-s1">찜완료</button>
		</a>
	</div>
	<%} %>
	<div class="button-style2">
		<button type="button" onclick="history.go(-1)" class="bt bt2">목록</button>	
	</div>

</body>
</html>