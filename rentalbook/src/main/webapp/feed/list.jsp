<%@page import="rentalbook.vo.Feed"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	FeedDao feedDao = new FeedDao();
	List<Feed> feeds = feedDao.findAll();
	
	
	int pageSize = 9;
	int lastP = feeds.size() / pageSize +(feeds.size() % pageSize > 0 ? 1: 0); 
	
	
	int p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
	int formIndex = (p-1) * pageSize;
	int toIndex = Math.min(p * pageSize, feeds.size());
	
	List<Feed> extractFeeds = feeds.subList(formIndex, toIndex);
	
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
<title>열린공간 | 동네도서관</title>
<link rel="icon"  href="<%=application.getContextPath()%>/favicon.ico">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
	<h2>의견모아</h2>
		<div style="display: flex ; justify-content: flex-end; align-items: center; ">
			<a class="no_deco_link"
				href="<%=application.getContextPath()%>/index.jsp"> <img
				class="img-st" alt="🏠"
				src="https://e7.pngegg.com/pngimages/370/221/png-clipart-black-house-art-one-line-home-icon-icons-logos-emojis-home-icons.png"></a>
			&nbsp; 열린공간 &gt; <span style="color: hotpink;"> &nbsp; 의견모아</span>
		</div>
		<div>
			총 <b style="color: hotpink"><%=feeds.size() %></b> 건의 의견이 등록되어 있습니다. 
		</div>
		<table class="default-table">
			<thead>
				<tr class="border-bottom">
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>등록일</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<% for(Feed one : extractFeeds) {%>
				<tr class="border-bottom">
					<td class="text-center"><%=one.no() %></td>
					<td>
					<a href="<%=application.getContextPath()%>/feed/view.jsp?no=<%=one.no()%>"
					class="no-deco-link ">
					 <%=one.title() %></a> 
					</td>
					<td class="text-center"><%=one.writerId() == null ? "탈퇴한회원" : one.writerId() %></td>
					<td class="text-center"><%=one.writedAt() %></td>
					<td class="text-center"><%=one.readCnt() %></td>
				</tr>
				<%} %>				
			</tbody>
		</table>
		<div style="text-align: right; margin: 10px">
				<a href="<%=application.getContextPath()%>/feed/write.jsp">
					<button type="button" class="bt bt2">의견쓰기</button>
				</a>
		</div>
			<p style="text-align: center; margin: 50px;">
		<% if(blockStart != 1) {%>
			<a href="<%=application.getContextPath() %>/feed/list.jsp?p=<%=blockStart - 1%>" class="no-deco-link">
				<span style="margin :0 10px">&lt;</span>
			</a>
		<%} else {%>
			<span style="margin :0 10px; color:#ddd ">&lt;</span>
		<%} %>
		<%for(int i= blockStart; i<= blockEnd; i++){ %>
			<%if(i!=p){ %>
				<a href="<%=application.getContextPath() %>/feed/list.jsp?p=<%=i%>"
					class="no-deco-link" style="margin :0 10px">
					<%=i %>
				</a>
			<%}else{ %>
				<b style="color: #8e8ac8; margin :0 10px"><%=i %></b>
			<%} %>
		<%} %>
		<%if(blockEnd != lastP){ %>
			<a href="<%=application.getContextPath()%>/feed/list.jsp?p=<%= blockEnd + 1 %>" class="no-deco-link">
				<span style="margin :0 10px" >&gt;</span>
			</a>	
		<%}else{ %>
			<span style="margin :0 10px; color:#ddd ">&gt;</span>
		<%} %>
	</p>
	</div>
</body>
</html>