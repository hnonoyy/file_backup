package controller.rank;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.FindTeamRanking;

@WebServlet("/team-ranking")
public class TeamRankingController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FindTeamRanking ftr = new FindTeamRanking();
		req.setAttribute("teamRanking", ftr.execute());
		req.setAttribute("mode", "team-ranking");
		req.getRequestDispatcher("/WEB-INF/view/ranks/team-ranking.jsp").forward(req, resp);
	}
}
