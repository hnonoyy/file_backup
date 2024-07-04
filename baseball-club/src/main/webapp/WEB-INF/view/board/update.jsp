<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그공놀 | 글 수정</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/css/style.css">
</head>
<body>

	<div>
		<%@ include file="/WEB-INF/view/common/header.jsp"%>
	</div>
	<div style="padding: 8px; margin: auto; width: 1140px;">
		<div class="board">
			<div class="board_box">
				<span>게시글 수정</span>
				<form
					action="${pageContext.servletContext.contextPath }/board/update-handle"
					method="post">
					<input type="hidden" name="boardId" value="${board.boardId }">
					<div>
						<div>
							<select name="type" id="boardType">
								<option selected disabled>${board.type }</option>
								<option value="광장">광장</option>
								<option value="구단">구단</option>
								<option value="이벤트">이벤트</option>
								<option value="거래">거래</option>
								<c:if test="${authUser.userId.equals('manager') }">
									<option value="공지사항">공지사항</option>
								</c:if>
							</select>
						</div>
						<div>
							<select name="category" id="boardCategory">
								<option selected disabled>${board.category }</option>
							</select>
						</div>
						<div>
							<input type="text" name="title" placeholder="${board.title }">
						</div>
					</div>
					<div>
						<span>내용</span>
						<textarea name="body">${board.body }</textarea>
					</div>
					<div>
						<button type="submit">수정</button>
					</div>
				</form>

			</div>
		</div>
		<script>
			document.getElementById("boardType").addEventListener(
					"change",
					function(evt) {
						var options = [];
						var type = evt.target.value;
						switch (type) {
						case "광장":
							options = [ "건의", "야구질문", "야구밖질문" ];
							break;
						case "구단":
							options = [ "기아", "두산", "롯데", "삼성", "SSG", "엔씨",
									"LG", "KT", "키움", "한화" ];
							break;
						case "이벤트":
							options = [ "공식", "자체", "후기" ];
							break;
						case "공지사항":
							options = [ "공지사항" ];
							break;
						}

						var elm = document.getElementById("boardCategory");
						elm.innerHTML = "";
						for (var i = 0; i < options.length; i++) {
							var html = "<option value=\"" + options[i]+"\">"
									+ options[i] + "</option>";
							elm.innerHTML += html;
						}

					});
		</script>
	</div>
</body>
</html>