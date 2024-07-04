<%@page import="java.sql.Date"%>
<%@page import="rentalbook.vo.Favorite"%>
<%@page import="rentalbook.dao.FavoriteDao"%>
<%@page import="rentalbook.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String authUserId = (String)session.getAttribute("auth_user_id");
	int bookId = Integer.parseInt(request.getParameter("bookId"));
	
	
	FavoriteDao favoriteDao = new FavoriteDao();

		BookDao bookDao = new BookDao();
		bookDao.descreseRentalCnt(bookId);
		response.sendRedirect(application.getContextPath()+"/book/book-detail.jsp?bookId="+bookId);

		out.println("<script>");
		out.println("window.alert(\"즐겨찾기 해지에 실패하였습니다.\");");
		out.println("history.go(-1);");
		out.println("</script>");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>