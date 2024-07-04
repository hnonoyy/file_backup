package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import dao.BoardDao;
import dao.MatchDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Board;
import vo.Match;

@WebServlet("/search")
public class SearchController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			MatchDao matchDao = new MatchDao();
			BoardDao boardDao = new BoardDao();
			String word = req.getParameter("word");
			if(word.isEmpty() || word.isBlank()) {
				resp.sendRedirect(req.getContextPath()+"/index");
				return;
			}
			
			List<Match> matches = matchDao.searchMatch(word);
			List<Board> boards = boardDao.searchBoard(word);
			
			
			req.setAttribute("matchsize", matches.size());
			req.setAttribute("boardsize", boards.size());
			req.setAttribute("word", word);
			req.setAttribute("matches", matches);
			req.setAttribute("boards", boards);
			
			req.getRequestDispatcher("/WEB-INF/view/search.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath()+"/error");
		}
		

	}
}
