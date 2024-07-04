package controller.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.BoardDao;
import dao.CommentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Board;
import vo.User;

@WebServlet("/myboard")
public class MyBoardController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int p = req.getParameter("p") == null ? 1 : Integer.parseInt(req.getParameter("p"));

			int size = 15;
			int start = size * (p - 1) + 1;
			int end = size * p;

			BoardDao boardDao = new BoardDao();
			List<Board> board = boardDao.findByAll(start, end);

			int count = boardDao.countAll();
			int totalPages = count / size + (count % size > 0 ? 1 : 0);

			
			List<Board> boardList = new ArrayList<Board>();
			
			User authUser = (User)req.getSession().getAttribute("authUser");
			String userId = authUser.getUserId();
			for (Board one : board) {
				String writerId = one.getWriterId();
				if (writerId.equals(userId)) {
					boardList.add(one);

				}
			}
			
			req.setAttribute("boardList", boardList);
			req.setAttribute("totalPages", totalPages);

			req.getRequestDispatcher("/WEB-INF/view/users/myboard.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
