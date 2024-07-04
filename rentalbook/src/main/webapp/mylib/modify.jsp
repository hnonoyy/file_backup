<%@page import="rentalbook.vo.User"%>
<%@page import="rentalbook.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
boolean auth = (boolean) session.getAttribute("auth");
String authUserId = (String) session.getAttribute("auth_user_id");

UserDao userDao = new UserDao();
User authUser = userDao.findByUserId(authUserId);

//findByUserId
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 | 동네도서관</title>
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/common/style.css" />
</head>
<body>
	<%@ include file="/common/header.jsp"%>
	<%
	if (!auth) {
	%>
	<script>
			window.alert("도서관회원으로 로그인 후 사용하세요");
			location.href="<%=application.getContextPath()%>
		/member/login.jsp";
	</script>
	<%
	} else {
	%>
	<div style="width: 840px; margin: auto;">
		<h2>회원정보수정</h2>
		<div style="display: flex ; justify-content: flex-end; align-items: center; ">
			<a class="no_deco_link"
				href="<%=application.getContextPath()%>/index.jsp"> <img
				class="img-st" alt="🏠"
				src="https://e7.pngegg.com/pngimages/370/221/png-clipart-black-house-art-one-line-home-icon-icons-logos-emojis-home-icons.png"></a>
			&nbsp; 마이페이지 &gt; <span style="color: hotpink;"> &nbsp; 정보수정</span>
		</div>
		<div
			style="text-align: left; margin-bottom: 10px; font-size: 0.8rem;">
			<span style="color: red;">*</span> 비밀번호와 닉네임만 변경가능합니다.
		</div>
		<form action="<%=application.getContextPath()%>/mylib/modify-handle.jsp">
			<table style="border-collapse: collapse; width: 100%; color: #444;">
				<tr style="text-indent: 10px">
					<td class="tb1" style="border-top-color: gray;">회원상태</td>
					<td class="tb2" style="border-top-color: gray;">정회원(정상)</td>
				</tr>
				<tr style="text-indent: 10px">
					<td class="tb1">아이디</td>
					<td class="tb2"><%=authUser.userId()%></td>
				</tr>
				<tr>
					<td class="tb1">닉네임</td>
					<td class="tb2"><input type="text"
						style="padding: 6px 10px; border: inactiveborder;" name="nickname" placeholder="<%=authUser.nickname()%>" />
					</td>
				</tr>
				<tr>
					<td class="tb1"> 비밀번호</td>
					<td class="tb2"><input type="password"
						style="padding: 6px 10px; border: inactiveborder;" name="password" />
						<span style="color: gray; font-size: 0.8rem">변경시에만 입력해주세요</span>
					</td>
				</tr>
				<tr>
					<td class="tb1"> 비밀번호확인</td>
					<td class="tb2"><input type="password"
						style="padding: 6px 10px; border: inactiveborder;"
						name="password_check" /></td>
				</tr>
				<tr style="text-indent: 10px">
					<td class="tb1" style="border-bottom-color: gray;">성별</td>
					<td class="tb2" style="border-bottom-color: gray;">
					<%=authUser.gender()%>
					</td>
				</tr>
			</table>
			<div style="text-align: center; margin-top: 10px"
				class="no-deco-link">
				<button type="submit" class="bt bt2">수정</button>
				<a href="<%=application.getContextPath()%>/mylib/drop.jsp">
					<button type="button" class="bt bt2">회원탈퇴</button>
				</a>
			</div>
		</form>
	</div>
	<%
	}
	%>
</body>
</html>
