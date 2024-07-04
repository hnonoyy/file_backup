package controller.board;

import java.io.IOException;
import java.sql.Date;

import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Board;
import vo.User;

@WebServlet("/board/new-handle")
public class BoardNewHandleController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			User authUser = (User) req.getSession().getAttribute("authUser");
			if (authUser == null) {
				resp.sendRedirect(req.getContextPath() + "/error");
				return;
			}
			if (req.getParameter("title") == null || req.getParameter("title").isBlank()
					|| req.getParameter("body") == null || req.getParameter("body").isBlank()
					|| req.getParameter("type") == null || req.getParameter("type").isBlank()
					|| req.getParameter("category") == null || req.getParameter("category").isBlank()) {
				resp.sendRedirect(req.getContextPath() + "/error");
				return;
			}

			String writerId = authUser.getUserId();
			String title = req.getParameter("title");
			String body = req.getParameter("body");
			Date writedAt = new Date(System.currentTimeMillis());
			String type = req.getParameter("type");
			String category = req.getParameter("category");

			Board board = new Board(0, writerId, title, body, 0, writedAt, category, type);

			BoardDao boardDao = new BoardDao();

			boolean r = boardDao.save(board);

			if (!r) {
				resp.sendRedirect(req.getContextPath() + "/error");
				return;
			}

			if (r && type.equals("광장")) {
				resp.sendRedirect(req.getContextPath() + "/board/list");
			} else if (r && type.equals("이벤트")) {
				resp.sendRedirect(req.getContextPath() + "/board/event");
			} else if (r && type.equals("구단")) {
				resp.sendRedirect(req.getContextPath() + "/board/club");
			} else if (r && type.equals("공지사항")) {
				resp.sendRedirect(req.getContextPath() + "/board/list");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
