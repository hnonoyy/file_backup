package controller.rank;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import util.FindHitterRanking;
import util.FindPitcherRanking;

@WebServlet("/record")
public class RecordController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		FindHitterRanking fhr = new FindHitterRanking();
		req.setAttribute("hitterRanking", fhr.execute());

		FindPitcherRanking fpr = new FindPitcherRanking();
		req.setAttribute("pitcherRanking", fpr.execute());
		req.setAttribute("mode", "record");
		req.getRequestDispatcher("/WEB-INF/view/ranks/record.jsp").forward(req, resp);
	}
}
