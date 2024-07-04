package controller.match;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import dao.MatchDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Match;

@WebServlet("/schedule")
public class ScheduleController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			MatchDao matchDao = new MatchDao();
			Date thisWeek = null;
			LocalDate startDate = null;
			LocalDate endDate = null;
			if (req.getParameter("week") == null) {
				LocalDate today = LocalDate.now();
				int weekValue = today.getDayOfWeek().getValue();
				if (weekValue == 1) {
					startDate = today.plusDays(0);
				} else if (weekValue == 2) {
					startDate = today.plusDays(-1);
				} else if (weekValue == 3) {
					startDate = today.plusDays(-2);
				} else if (weekValue == 4) {
					startDate = today.plusDays(-3);
				} else if (weekValue == 5) {
					startDate = today.plusDays(-4);
				} else if (weekValue == 6) {
					startDate = today.plusDays(-5);
				} else if (weekValue == 7) {
					startDate = today.plusDays(-6);
				}
				endDate = startDate.plusDays(7);
			} else {
				thisWeek = Date.valueOf(req.getParameter("week"));
				startDate = thisWeek.toLocalDate();
			}
			
			int weekValue = startDate.getDayOfWeek().getValue();
			if (weekValue == 1) {
				startDate = startDate.plusDays(0);
			} else if (weekValue == 2) {
				startDate = startDate.plusDays(-1);
			} else if (weekValue == 3) {
				startDate = startDate.plusDays(-2);
			} else if (weekValue == 4) {
				startDate = startDate.plusDays(-3);
			} else if (weekValue == 5) {
				startDate = startDate.plusDays(-4);
			} else if (weekValue == 6) {
				startDate = startDate.plusDays(-5);
			} else if (weekValue == 7) {
				startDate = startDate.plusDays(-6);
			}
			endDate = startDate.plusDays(7);
			List<Match> matches = matchDao.findByWeek(Date.valueOf(startDate), Date.valueOf(endDate));

			req.setAttribute("thisWeek", startDate);
			req.setAttribute("endDate", endDate);
			req.setAttribute("lastWeek", startDate.minusWeeks(1));
			req.setAttribute("nextWeek", startDate.plusWeeks(1));
			req.setAttribute("matches", matches);
			req.setAttribute("mode", "schedule");
			req.getRequestDispatcher("/WEB-INF/view/matches/schedule.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/error");
		}

	}
}
