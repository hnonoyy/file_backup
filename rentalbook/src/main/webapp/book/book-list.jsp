<%@ page import="rentalbook.vo.Book"%>
<%@ page import="java.util.List"%>
<%@ page import="rentalbook.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sort = request.getParameter("sort") == null ? "title" : request.getParameter("sort");
	
	BookDao bookDao = new BookDao();
	List<Book> books = null;
	String mode = null;
	String name = null;

	String categoryN = request.getParameter("categoryId") == null ? "-1" : request.getParameter("categoryId");
	int categoryId = categoryN.equals("-1") ? -1 : Integer.parseInt(categoryN);

	if (categoryId == -1) {
		if (sort.equals("title")) {
			books = bookDao.findByTitle();
			mode = "도서명순(가나다순)";
			name = "title";
		} else if (sort.equals("rentalCnt")) {
			books = bookDao.findByRentalCnt();
			mode = "대여베스트순";
			name = "rentalCnt";
		} else if (sort.equals("bookId")) {
			books = bookDao.findByOrderBookId();
			mode = "도서번호순";
			name = "bookId";	
		} else {
			books = bookDao.findByTitle();
			mode = "도서명순(가나다순)";
			name = "title";
		}
	} else {
		books = bookDao.findByCategoryId(categoryId);
		if (categoryId == 101000000) {
			mode = "일반행정";
		} else if (categoryId == 102000000) {
			mode = "문화/관광";
		} else if (categoryId == 103000000) {
			mode = "역사/사료";
		} else if (categoryId == 104000000) {
			mode = "연구/논문";
		} else if (categoryId == 105000000) {
			mode = "통계";
		} else {
			books = bookDao.findByTitle();
		}
		name = "categoryId";
	}
	
	// 전체 페이지 수 계산
	int pageSize = 9;
	int lastP = books.size() / pageSize + (books.size() % pageSize > 0 ? 1 : 0);
	
	int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
	int formIndex = (p-1) * pageSize;
	int toIndex = Math.min(p * pageSize, books.size());
	
	List<Book> extractBooks = books.subList(formIndex, toIndex);
	
	int blockEnd = (int)Math.ceil(p/10.0) * 10;
	int blockStart = blockEnd - 9;
	
	if(blockEnd > lastP){
		blockEnd = lastP;
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
			&nbsp; 도서검색 &gt; <span style="color: hotpink;"> &nbsp; <%=mode %></span>
		</div>
		<div style="text-align: right;">
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?sort=title"
					class="no-deco-link"> 도서명순(가나다순) </a> |
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?sort=rentalCnt"
					class="no-deco-link">대여베스트순 </a> |
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?sort=bookId"
					class="no-deco-link">도서번호순</a>
		</div>
		<div>
			전체 <b style="color: hotpink"><%=books.size() %></b> 개가 검색되었습니다.
		</div>
		<div class="div-style">
			<span style="font-weight: bold; color: #2f2d2e;" >카테고리</span>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=101000000"
			class="no-deco-link category-button cn1">일반행정</a>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=102000000"
			class="no-deco-link category-button cn2">문화/관광</a>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=103000000"
			class="no-deco-link category-button cn3">역사/사료</a>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=104000000"
			class="no-deco-link category-button cn4">연구/논문</a>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=105000000"
			class="no-deco-link category-button cn5">통계</a>
		</div>
	</div>
	<div>
	<% for(Book one : extractBooks){ %>
		<div class="default-list">
			<div style="text-align: center; margin: 5px">
				<p class="default-p"><small> 도서번호 : <%=one.bookId() %></small></p>
				<img alt="book" src="<%=one.imageUrl()%>" class="default-img">
				<%if(one.categoryName().equals("일반행정")){%>
					<p class="cn1">
						<%=one.categoryName() %>
					</p>
				<%}else if(one.categoryName().equals("문화/관광")){%>
					<p class="cn2">
						<%=one.categoryName() %>
					</p>
				<%}else if(one.categoryName().equals("역사/사료")){%>
					<p class="cn3">
						<%=one.categoryName() %>
					</p>
				<%}else if(one.categoryName().equals("연구/논문")){%>
					<p class="cn4">
						<%=one.categoryName() %>
					</p>
				<%}else if(one.categoryName().equals("통계")){%>
					<p class="cn5">
						<%=one.categoryName() %>
					</p>
				<%}%>
			</div>
			<div style="text-indent: 50px">
				<div class="title-line">
					<a href="<%=application.getContextPath() %>/book/book-detail.jsp?bookId=<%=one.bookId() %>"
					class="no-deco-link">
						<b><%=one.title() %></b>
					</a>
				</div>
				<dl class="default-dl">
					<dt>출판사</dt>
					<dd><%=one.publisher() %></dd>
				</dl>
				<dl class="default-dl">
					<dt>대여횟수</dt>
					<dd><%=one.rentalCnt() %></dd>
				</dl>
				<dl class="default-dl">
					<dt>페이지수</dt>
					<dd><%=one.pages() %></dd>
				</dl>
			</div>
		</div>
	<%} %>
	<p style="text-align: center; margin: 50px;">
		<% if(blockStart != 1) {%>
			<a href="<%=application.getContextPath() %>/book/book-list.jsp?p=<%=blockStart - 1%>&sort=<%=name %>&categoryId=<%=categoryN%>" class="no-deco-link">
				<span style="margin :0 10px">&lt;</span>
			</a>
		<%} else {%>
			<span style="margin :0 10px; color:#ddd ">&lt;</span>
		<%} %>
		<%for(int i= blockStart; i<= blockEnd; i++){ %>
			<%if(i!=p){ %>
				<a href="<%=application.getContextPath() %>/book/book-list.jsp?p=<%=i%>&sort=<%=name %>&categoryId=<%=categoryN%>"
					class="no-deco-link" style="margin :0 10px">
					<%=i %>
				</a>
			<%}else{ %>
				<b style="color: #8e8ac8; margin :0 10px"><%=i %></b>
			<%} %>
		<%} %>
		<%if(blockEnd != lastP){ %>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?p=<%= blockEnd + 1 %>&sort=<%=name %>&categoryId=<%=categoryN%>" class="no-deco-link">
				<span style="margin :0 10px" >&gt;</span>
			</a>	
		<%}else{ %>
			<span style="margin :0 10px; color:#ddd ">&gt;</span>
		<%} %>
	</p>	
	</div>	
</body>
</html>
