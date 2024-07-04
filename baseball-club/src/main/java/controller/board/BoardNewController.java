package controller.board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.User;

@WebServlet("/board/new")
public class BoardNewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User authUser = (User)req.getSession().getAttribute("authUser");
		if(authUser == null) {
			resp.sendRedirect(req.getContextPath()+"/login?url=/board/new");
			return;
		}
		req.setAttribute("authUser", authUser);
		
		req.getRequestDispatcher("/WEB-INF/view/board/new.jsp").forward(req, resp);
	
	}
}
