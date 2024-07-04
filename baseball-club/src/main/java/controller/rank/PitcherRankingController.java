package controller.rank;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.FindPitcherRanking;

@WebServlet("/pitcher-ranking")
public class PitcherRankingController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		FindPitcherRanking fpr = new FindPitcherRanking();
		req.setAttribute("pitcherRanking", fpr.execute());
		req.setAttribute("mode", "record");
		req.getRequestDispatcher("/WEB-INF/view/ranks/pitcher-ranking.jsp").forward(req, resp);
	}
}
