package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
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

@WebServlet("/index")
public class IndexController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			BoardDao boardDao = new BoardDao();
			List<Board> plaza = boardDao.findPlazaByView();
			List<Board> club = boardDao.findClubByView();
			List<Board> event = boardDao.findEventByView();
			
			MatchDao matchDao = new MatchDao();
			Date today = Date.valueOf(LocalDate.now());
			List<Match> todayMatch = matchDao.findByToday(today);
			
			request.setAttribute("plaza", plaza);
			request.setAttribute("club", club);
			request.setAttribute("event", event);
			request.setAttribute("todayMatch", todayMatch);
			
			request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}
