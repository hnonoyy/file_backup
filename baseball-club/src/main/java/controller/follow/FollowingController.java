package controller.follow;

import java.io.IOException;
import java.sql.SQLException;

import dao.FollowDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Follow;
import vo.User;

@WebServlet("/following-handle")
public class FollowingController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User authUser = (User) req.getSession().getAttribute("authUser");
		if (authUser == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		try {
			FollowDao followDao = new FollowDao();
			String followerId = authUser.getUserId();
			String followingId = req.getParameter("userId");
			Follow follow = new Follow(0, followingId, followerId);
			
			boolean r = followDao.saveFollow(follow);
			
			if(r) {
				resp.sendRedirect(req.getContextPath() + "/profile?userId="+followingId);
			}else {
				resp.sendRedirect(req.getContextPath() + "/error");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/error");
		}

	}

}
