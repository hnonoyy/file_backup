package controller.follow;

import java.io.IOException;
import java.sql.SQLException;

import dao.FollowDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.User;

@WebServlet("/following-delete")
public class UnfollowController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		User authUser = (User) req.getSession().getAttribute("authUser");
		if (authUser == null) {
			resp.sendRedirect(req.getContextPath() + "/error");
			return;
		}

		try {
			FollowDao followDao = new FollowDao();
			String followingId = req.getParameter("userId");
			if (followingId == null) {
				resp.sendRedirect(req.getContextPath() + "/error");
				return;
			}
			boolean r = followDao.deleteUnfollow(authUser.getUserId(), followingId);
			if (r) {
				resp.sendRedirect(req.getContextPath()+"/profile?userId="+followingId);
			} else {
				resp.sendRedirect(req.getContextPath() + "/error");
			}

		} catch (SQLException e) {
			resp.sendRedirect(req.getContextPath() + "/error");
			e.printStackTrace();
		}

	}
}
