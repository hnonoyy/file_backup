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

@WebServlet("/login-handle")
public class LoginHandleController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			
			UserDao userDao = new UserDao();
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			User user = userDao.findById(userId);
			if (userId == null || userId.isBlank() || password == null || password.isBlank() || user == null) {
				request.getRequestDispatcher("/WEB-INF/view/users/login-error.jsp").forward(request, response);
				return;
			}


			String url = (String) request.getSession().getAttribute("url");

			if (password.equals(user.getPassword())) {
				request.getSession().setAttribute("authUser", user);
				response.sendRedirect(request.getContextPath() + url);
			} else {
				request.getRequestDispatcher("/WEB-INF/view/users/login-error.jsp").forward(request, response);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error");
		}

	}
}
