package controller.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.BoardDao;
import dao.CommentDao;
import dao.FollowDao;
import dao.ParticipantDao;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Board;
import vo.User;

@WebServlet("/withdraw-handle")
public class UserWithdrawHandleController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User authUser = (User) req.getSession().getAttribute("authUser");
		if (authUser == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		try {
			UserDao userDao = new UserDao();
			BoardDao boardDao = new BoardDao();
			FollowDao followDao = new FollowDao();
			CommentDao commentDao = new CommentDao();
			ParticipantDao participantDao = new ParticipantDao();
			boolean r = false;
			if (authUser.getPassword().equals(req.getParameter("password"))) {
				boolean e = participantDao.deleteParticipantByUser(authUser.getUserId());
				boolean a = commentDao.deleteCommentByUser(authUser.getUserId());

				List<Board> boards = boardDao.findByWriterId(authUser.getUserId());
				for (Board one : boards) {
					commentDao.deleteCommentByBoard(one.getBoardId());
				}
				boolean b = boardDao.deleteByWriterId(authUser.getUserId());
				boolean c = followDao.deleteUser(authUser.getUserId());
				boolean d = userDao.deleteUser(authUser.getUserId());

				if (a && b && c && d && e) {
					r = true;
				}
			}

			if (r) {
				req.getSession().invalidate();
				resp.sendRedirect(req.getContextPath() + "/login");
			} else {
				resp.sendRedirect(req.getContextPath() + "/error");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/error");
		}

	}
}
