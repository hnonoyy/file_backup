package controller.board;

import java.io.IOException;

import dao.BoardDao;
import dao.CommentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Board;
import vo.User;

@WebServlet("/board/delete")
public class BoardDeleteController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User authUser = (User) req.getSession().getAttribute("authUser");
			if (authUser == null) {
				resp.sendRedirect(req.getContextPath() + "/error");
				return;
			}

			BoardDao boardDao = new BoardDao();
			int boardId = Integer.parseInt(req.getParameter("boardId"));
			Board found = boardDao.findByBoardId(boardId);
			CommentDao commentDao = new CommentDao();
			String type = found.getType();
			if(type.equals("구단")) {
				type="club";
			}else if(type.equals("광장")) {
				type="list";
			}else if(type.equals("이벤트")) {
				type= "event";
			}else {
				type = "list";
			}
			
			if (found == null || found.getWriterId() == null || !found.getWriterId().equals(authUser.getUserId())) {
				resp.sendRedirect(req.getContextPath() + "/error");
				return;
			} else {
				boolean deleteComment = commentDao.deleteCommentByBoard(boardId);
				boolean deleteBoard = boardDao.deleteWriteView(boardId);
				if (deleteComment && deleteBoard) {
					resp.sendRedirect(req.getContextPath() + "/board/"+type);
				} else {
					resp.sendRedirect(req.getContextPath() + "/error");
					return;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
