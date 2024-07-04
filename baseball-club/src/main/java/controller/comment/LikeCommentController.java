package controller.comment;

import java.io.IOException;
import java.sql.SQLException;

import dao.CommentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Comment;
import vo.User;

@WebServlet("/comment-like")
public class LikeCommentController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User authUser = (User) req.getSession().getAttribute("authUser");
			if (authUser == null) {
				resp.sendRedirect(req.getContextPath() + "/error");
				return;
			}

			CommentDao commentDao = new CommentDao();
			int commentId = Integer.parseInt(req.getParameter("commentId"));
			Comment comment = commentDao.findById(commentId);
			boolean r = commentDao.plusLike(commentId);
			if (r) {
				resp.sendRedirect(req.getContextPath() + "/board?boardId=" + comment.getBoardId());
			} else {
				resp.sendRedirect(req.getContextPath() + "/error");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/error");
		}
	}
}
