package controller.user;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.User;

@WebServlet("/join-handle")
public class JoinHandleController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			if (request.getParameter("userId") == null || request.getParameter("userId").isBlank()
					|| request.getParameter("password") == null || request.getParameter("password").isBlank()
					|| request.getParameter("nickname") == null || request.getParameter("nickname").isBlank()
					|| request.getParameter("birth") == null || request.getParameter("birth").isBlank()
					|| request.getParameter("gender") == null || request.getParameter("gender").isBlank()
					|| request.getParameter("email") == null || request.getParameter("email").isBlank()
					|| request.getParameter("club") == null || request.getParameter("club").isBlank()) {
				response.sendRedirect(request.getContextPath() + "/error");
				return;
			}
			UserDao userDao = new UserDao();
			String userId = request.getParameter("userId");
			String password = request.getParameter("password");
			String nickname = request.getParameter("nickname");
			Date birth = Date.valueOf(request.getParameter("birth"));
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String club = request.getParameter("club");
			User user = new User(userId, password, nickname, birth, gender, email, club, "user");

			if (userDao.findById(userId) != null) {
				response.sendRedirect(request.getContextPath() + "/error");
				return;
			} else {
				userDao.saveUser(user);
				response.sendRedirect(request.getContextPath() + "/login");
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error");
		}
	}
}
