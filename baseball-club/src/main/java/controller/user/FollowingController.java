package controller.user;

import java.io.IOException;
import java.util.List;

import dao.FollowDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Follow;
import vo.User;

@WebServlet("/following")
public class FollowingController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User authUser = (User) req.getSession().getAttribute("authUser");
		if(authUser == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		try {
			FollowDao followDao = new FollowDao();
			List<Follow> follwers = followDao.findByFollower(authUser.getUserId());
			List<Follow> followings = followDao.findByFollowing(authUser.getUserId());
			int following = followDao.countByFollowing(authUser.getUserId());
			int follower = followDao.countByFollower(authUser.getUserId());
			
			req.setAttribute("followers", follwers);
			req.setAttribute("followings", followings);
			req.setAttribute("following", following);
			req.setAttribute("follower", follower);
			
			req.getRequestDispatcher("/WEB-INF/view/users/following.jsp").forward(req, resp);
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/error");
		}
		
		
	}
}
