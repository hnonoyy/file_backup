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

@WebServlet("/board/update-handle")
public class BoardUpdateHandleController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User authUser = (User) req.getSession().getAttribute("authUser");
			if(authUser == null) {
				resp.sendRedirect(req.getContextPath()+"/error");
				return;
			}
			
			BoardDao boardDao = new BoardDao();
			int boardId = Integer.parseInt(req.getParameter("boardId"));
			Board board = boardDao.findByBoardId(boardId);

			String title = req.getParameter("title");
			String body = req.getParameter("body");
			String type = req.getParameter("type");
			String category = req.getParameter("category");

			if (title == null || title.isBlank()) {
				title = board.getTitle();
			}
			if (body == null || body.isBlank()) {
				body = board.getBody();
			}
			if (type == null || type.isBlank()) {
				type = board.getType();
			}
			if (category == null || category.isBlank()) {
				category = board.getCategory();
			}

			Board temp = new Board(boardId, null, title, body, 0, null, category, type);

			boolean result;

			if (!board.getWriterId().equals(authUser.getUserId())) {
				result = false;
				resp.sendRedirect(req.getContextPath() + "/error");
			} else {
				result = boardDao.updateWrite(temp);
				resp.sendRedirect(req.getContextPath() + "/board/list");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
