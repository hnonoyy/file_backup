package controller.user;

import java.io.IOException;
import java.sql.SQLException;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.User;

@WebServlet("/modify")
public class ModifyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User authUser = (User) req.getSession().getAttribute("authUser");
		if (authUser == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		req.getRequestDispatcher("/WEB-INF/view/users/modify.jsp").forward(req, resp);

	}
}
