<%@ page import="oracle.jdbc.proxy.annotation.OnError"%>
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
	}else {
		books = bookDao.findByTitle();
		mode = "도서명순(가나다순)";
	}
	
	String categoryN = request.getParameter("categoryId");
	int categoryId = Integer.parseInt(categoryN);
	if(categoryN.equals("101000000")){
		books = bookDao.findByCategoryId(categoryId);
		mode = "일반행정";
		name = "categoryId";
	}else if(categoryN.equals("102000000")){
		books = bookDao.findByCategoryId(categoryId);
		mode = "문화/관광";
		name = "categoryId";
	}else if(categoryN.equals("103000000")){
		books = bookDao.findByCategoryId(categoryId);
		mode = "역사/사료";
		name = "categoryId";
	}else if(categoryN.equals("104000000")){
		books = bookDao.findByCategoryId(categoryId);
		mode = "연구/논문";
		name = "categoryId";
	}else if(categoryN.equals("105000000")){
		books = bookDao.findByCategoryId(categoryId);
		mode = "통계";
		name = "categoryId";
	}else{
		categoryN = "101000000";
		name = "categoryId";
	}
	
	// 전체 페이지 수 계산
	int pageSize = 9;
	int lastP = books.size() / pageSize + (books.size() % pageSize > 0 ? 1 : 0);
	
	
	int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
	// 데이터 몇 개씩 묶음 처리할거냐에 계산이 달라짐 10개씩 처리한다고 가정
	int formIndex = (p-1) * pageSize;
	int toIndex =  p * pageSize;
	//toIndex 만약 어떤 상태라면 이걸 마지막 인덱스번호 + 1로 바꿔야한다./ 마지막 페이지 터지는 것만 막아놓음
	if(p==lastP){
		toIndex = books.size();
	}
	// 페이지 수를 초과하면 터진다 이거 어떻게 할거야...?
			
	List<Book> extractBooks = books.subList(formIndex, toIndex);
	
	
	/*
	int blockEnd = 0;
	while(blockEnd < p){
		blockEnd += 10;
	}
	*/
	int blockEnd = (int)Math.ceil(p/10.0) * 10;
	int blockStart = blockEnd -9;
	
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
					class="no-deco-link "> 도서명순(가나다순) </a> |
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?sort=rentalCnt"
					class="no-deco-link">대여베스트순 </a> |
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?sort=bookId"
					class="no-deco-link">도서번호순</a>
		</div>
		<div>
			전체 <b style="color: hotpink"><%=books.size() %></b> 개가 검색되었습니다.
		</div>
		<div>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=101000000">일반행정</a>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=102000000">문화/관광</a>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=103000000">역사/사료</a>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=104000000">연구/논문</a>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?categoryId=105000000">통계</a>
		</div>
	</div>
	<div>
	<% for(Book one : extractBooks){ %>
		<div class="default-list">
			<div style="text-align: center;">
				<p><small> 도서번호 : <%=one.bookId() %></small></p>
				<img alt="book" src="<%=one.imageUrl()%>" class="default-img">
				<p class="cn"><%=one.categoryName() %></p>
			</div>
			<div style="text-indent: 50px">
				<a href="<%=application.getContextPath() %>/book/book-detail.jsp?bookId=<%=one.bookId() %>"
				class="no-deco-link">
					<b><%=one.title() %></b>
				</a>
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
				<dl>
					<dt>책소개</dt>
					<dd style="font-size: small; text-indent: 0; padding: 10px"><%=one.description() %></dd>
				</dl>
			</div>
		</div>
	<%} %>
	<p style="text-align: center; margin: 50px;">
		<% if(blockStart != 1) {%>
			<a href="<%=application.getContextPath() %>/book/book-list.jsp?p=<%=blockStart - 1%>&sort=<%=name %>" class="no-deco-link">
				<span style="margin :0 10px">&lt;</span>
			</a>
		<%} else {%>
			<span style="margin :0 10px; color:#ddd ">&lt;</span>
		<%} %>
		<%for(int i= blockStart; i<= blockEnd; i++){ %>
			<%if(i!=p){ %>
				<a href="<%=application.getContextPath() %>/book/book-list.jsp?p=<%=i%>&sort=<%=name %>"
					class="no-deco-link" style="margin :0 10px">
					<%=i %>
				</a>
			<%}else{ %>
				<b style="color: #8e8ac8; margin :0 10px"><%=i %></b>
			<%} %>
		<%} %>
		<%if(blockEnd != lastP){ %>
			<a href="<%=application.getContextPath()%>/book/book-list.jsp?p=<%= blockEnd + 1 %>&sort=<%=name %>" class="no-deco-link">
				<span style="margin :0 10px" >&gt;</span>
			</a>	
		<%}else{ %>
			<span style="margin :0 10px; color:#ddd ">&gt;</span>
		<%} %>
	</p>	
	</div>	
</body>
</html>