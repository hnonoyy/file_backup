<%@page import="java.util.ArrayList"%>
<%@page import="rentalbook.vo.Book"%>
<%@page import="rentalbook.dao.BookDao"%>
<%@page import="rentalbook.vo.Favorite"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)session.getAttribute("auth_user_id");
	FavoriteDao favoriteDao = new FavoriteDao();
	List<Favorite> favorites = favoriteDao.findByUserId(userId);
	
	BookDao bookDao = new BookDao();
	List<Book> books= new ArrayList<>();
	
	for(Favorite f : favorites){
		Book one = bookDao.findByBookId(f.bookId());
		books.add(one);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기목록 | 동네도서관</title>
<link rel="icon" href="/favicon.ico" type="image/x-icon"> 
<link rel="stylesheet" href="<%=application.getContextPath()%>/common/style.css"/>
</head>
<body>
<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
	<h2>즐겨찾기</h2>
		<div style="display: flex ; justify-content: flex-end; align-items: center; ">
			<a class="no_deco_link"
				href="<%=application.getContextPath()%>/index.jsp"> <img
				class="img-st" alt="🏠"
				src="https://e7.pngegg.com/pngimages/370/221/png-clipart-black-house-art-one-line-home-icon-icons-logos-emojis-home-icons.png"></a>
			&nbsp; 마이페이지 &gt; <span style="color: hotpink;"> &nbsp; 즐겨찾기한 도서목록</span>
		</div>
		
		<div>
			도서 <b style="color: hotpink"><%=favorites.size() %></b> 권을 즐겨찾기 중입니다.
		</div>
		<form action="<%=application.getContextPath()%>/mylib/delete-favorite.jsp">
			<table class="default-table">
				<thead>
					<tr class="border-bottom">
						<th style="">분류</th>
						<th>도서제목</th>
						<th style="width: 30%">즐겨찾기한 날짜</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < favorites.size(); i++) {
					%>
					<tr class="border-bottom">
						<td><input type="checkbox" name="no" value="<%=favorites.get(i).no() %>"/></td>
						<td class="text-center"><%=books.get(i).categoryName()%></td>
						<td class="text-center"><a
							href="<%=application.getContextPath()%>/book/view.jsp?bookId=<%=favorites.get(i).bookId()%>"
							class="no-deco-link" target="_blank"> <%=books.get(i).title()%>
						</a></td>
						<td class="text-center"><%=favorites.get(i).createdAt()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<button type="submit" style="margin-top: 20px;">즐겨찾기 해제</button>
		</form>
	</div>	
</body>
</html>