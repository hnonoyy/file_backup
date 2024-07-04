package controller.rank;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.FindHitterRanking;

@WebServlet("/hitter-ranking")
public class HitterRankingController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		FindHitterRanking fhr = new FindHitterRanking();
		req.setAttribute("mode", "record");
		req.setAttribute("hitterRanking", fhr.execute());
		req.getRequestDispatcher("/WEB-INF/view/ranks/hitter-ranking.jsp").forward(req, resp);
	}
}
