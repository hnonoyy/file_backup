package controller.user;

import java.io.IOException;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.User;

@WebServlet("/modify-handle")
public class ModifyHandleController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User authUser = (User) req.getSession().getAttribute("authUser");
		if (authUser == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}

		try {
			UserDao userDao = new UserDao();
			String password = req.getParameter("password");
			String nickname = req.getParameter("nickname");
			String email = req.getParameter("email");
			String club = req.getParameter("club");
			if (password == null || password.isBlank()) {
				password = authUser.getPassword();
			}
			if (nickname == null || nickname.isBlank()) {
				nickname = authUser.getNickname();
			}
			if (email == null || email.isBlank()) {
				email = authUser.getEmail();
			}
			if (club == null || club.isBlank()) {
				club = authUser.getClub();
			}

			User temp = new User(authUser.getUserId(), password, nickname, authUser.getBirth(), authUser.getGender(),
					email, club, "user");

			boolean r = userDao.updateUser(temp);
			if (r) {
				req.getSession().setAttribute("authUser", temp);
				resp.sendRedirect(req.getContextPath() + "/index");
			} else {
				resp.sendRedirect(req.getContextPath() + "/error");
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/error");
		}

	}
}
