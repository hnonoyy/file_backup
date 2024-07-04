package controller.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.User;

@WebServlet("/mypage")
public class MyPageController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User authUser = (User)req.getSession().getAttribute("authUser");
		if(authUser == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		String userId= authUser.getUserId();
		req.setAttribute("userId", userId);
		req.getRequestDispatcher("/WEB-INF/view/users/mypage.jsp").forward(req, resp);
	}
}
