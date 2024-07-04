package controller.comment;

import java.io.IOException;

import dao.CommentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Comment;
import vo.User;

@WebServlet("/comment-delete")
public class DeleteCommentController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User authUser = (User) req.getSession().getAttribute("authUser");
		if (authUser == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		try {
			CommentDao commentDao = new CommentDao();
			int commentId = Integer.parseInt(req.getParameter("commentId"));
			Comment comment = commentDao.findById(commentId);
			if (comment.getWriterId().equals(authUser.getUserId())) {
				commentDao.deleteComment(commentId);
				resp.sendRedirect(req.getContextPath() + "/board?boardId="+comment.getBoardId());
			}else {
				resp.sendRedirect(req.getContextPath() + "/error");
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/error");
		}

	}
}
