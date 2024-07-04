package controller.board;

import java.io.IOException;

import dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/search")
public class BoardSearchController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			BoardDao boardDao = new BoardDao();
			String word = req.getParameter("word");
			String type = req.getParameter("type");

			if (type.equals("자유")) {
				req.setAttribute("searchList", boardDao.ListSearchByWord(word));
			} else if (type.equals("구단")) {
				req.setAttribute("searchList", boardDao.ClubSearchByWord(word));
			} else if (type.equals("이벤트")) {
				req.setAttribute("searchList", boardDao.EventSearchByWord(word));
			} else {
				resp.sendRedirect(req.getContextPath() + "/error");
				return;
			}
			
			req.setAttribute("type", type);
			req.setAttribute("word", word);
			req.getRequestDispatcher("/WEB-INF/view/board/board-search.jsp").forward(req, resp);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}
