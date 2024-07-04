<%@page import="oracle.net.aso.f"%>
<%@page import="java.util.List"%>
<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String authUser = (String)session.getAttribute("auth_user_id");
	Feed found;
	
	if(request.getParameter("no") == null){
		found = null;
	}else{
		int no = Integer.parseInt(request.getParameter("no"));
		
		FeedDao feedDao = new FeedDao();
		feedDao.increaseReadCntByNo(no);
		found = feedDao.findByNo(no);
	}
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열린공간 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
	<%if(found == null){%>
		<script>
			window.alert("존재하지 않는 글입니다.");
			history.go(-1);
		</script>
	<%}else{ %>
	<%@ include file="/common/header.jsp"%>
		<div style="width: 840px; margin: auto;">
		<h2>의견보기</h2>
			<div style="display: flex ; justify-content: flex-end; align-items: center; ">
				<a class="no_deco_link"
					href="<%=application.getContextPath()%>/index.jsp"> <img
					class="img-st" alt="🏠"
					src="https://e7.pngegg.com/pngimages/370/221/png-clipart-black-house-art-one-line-home-icon-icons-logos-emojis-home-icons.png"></a>
				&nbsp; 열린공간 &gt; <span style="color: hotpink;"> &nbsp; 의견 상세보기</span>
			</div>
			<div>
				<h3 style="text-align: left; border-bottom: 1px solid #ccc; padding : 8px;"><%=found.title() %></h3>
				<div style="float:left; text-indent: 10px">
					<span>작성자</span> <span><%=found.writerId() == null ? "탈퇴한회원" : found.writerId()%></span>
				</div>
				<div style="float: right;">
					<span>작성일</span> <span><%=found.writedAt() %></span> |
					<span>조회</span> <span><%=found.readCnt() %></span>
				</div>
				<p style="padding: 60px 10px 30px 10px; border-bottom: 1px solid #ccc;">
					<%=found.body().replaceAll("\n", "<br/>") %>
				</p>
				
			</div>
			<div style="text-align: right;">
				<%if(found.writerId() != null && found.writerId().equals(authUser)){ %>
					<a href="<%=application.getContextPath()%>/feed/delete-handle.jsp?no=<%=found.no()%>">
						<button class="bt bt2">삭제</button></a>
					<a href="<%=application.getContextPath()%>/feed/update.jsp?no=<%=found.no()%>">
					<button class="bt bt2">수정</button></a>
				<%} %>
				<a href="<%=application.getContextPath()%>/feed/list.jsp">
					<button type="button" class="bt bt2" >목록</button></a>
			</div>
		</div>	
	
	
	
	<%} %>
</body>
</html>