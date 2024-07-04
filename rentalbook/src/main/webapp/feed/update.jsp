<%@page import="rentalbook.vo.Feed"%>
<%@page import="rentalbook.dao.FeedDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String authUser = (String)session.getAttribute("auth_user_id");
	
	int no = Integer.parseInt(request.getParameter("no"));
		
	FeedDao feedDao = new FeedDao();
		
	Feed feed = feedDao.findByNo(no);


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
	<%@ include file="/common/header.jsp"%>
	<div style="width: 840px; margin: auto;">
		<h2>의견남기기</h2>
		<div style="display: flex ; justify-content: flex-end; align-items: center; ">
			<a class="no_deco_link"
				href="<%=application.getContextPath()%>/index.jsp"> <img
				class="img-st" alt="🏠"
				src="https://e7.pngegg.com/pngimages/370/221/png-clipart-black-house-art-one-line-home-icon-icons-logos-emojis-home-icons.png"></a>
			&nbsp; 열린공간 &gt; <span style="color: hotpink;"> &nbsp; 의견남기기</span>
		</div>
		<div
			style="text-align: left; margin-bottom: 10px; font-size: 0.8rem;">
			<span style="color: red;">*</span> 개인정보를 포함한 내용은 게시할 수 없으며 통보없이 삭제 될 수 있습니다.
		</div>
		<form action="<%=application.getContextPath()%>/feed/update-handle.jsp">
			<input type="hidden" name="no" value="<%=feed.no()%>">
			<table style="border-collapse: collapse; width: 100%; color: #444;">
				<tr >
					<td class="write-td1" style="border-top-color: gray;">작성자</td>
					<td class="tb2" style="border-top-color: gray; text-indent: 10px"><%=feed.writerId() %></td>
				</tr>
				<tr>
					<td class="write-td1">제목</td>
					<td class="tb2">
						<input class="write-td2" type="text" name="title" value="<%=feed.title() %>" />
					</td>
				</tr>
				<tr>
					<td class="tb2" style="padding: 12px;" colspan="2">
					<textarea name="body" class="text-td"><%=feed.body()%></textarea>
					</td>
				</tr>
				
			</table>
			<div style="text-align: center; margin-top: 10px"
				class="no-deco-link">
				<button type="submit" class="bt bt2">수정</button>
				<a href="<%=application.getContextPath()%>/feed/update-handle.jsp?no=<%=feed.no()%>">
					<button type="button" class="bt bt2">취소</button>
				</a>
			</div>
		</form>
	</div>
</body>
</html>