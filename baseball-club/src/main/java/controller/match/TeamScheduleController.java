package controller.match;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import dao.MatchDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Match;

@WebServlet("/schedule-team")
public class TeamScheduleController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			MatchDao matchDao = new MatchDao();
			String month = req.getParameter("month");
			String previous = null;
			String next = null;
			if (req.getParameter("month") == null) {
				switch (LocalDate.now().getMonth()) {
				case JANUARY:
					month = "01";
					previous = "12";
					next = "02";
					break;
				case FEBRUARY:
					month = "02";
					previous = "01";
					next = "03";
					break;
				case MARCH:
					month = "03";
					previous = "02";
					next = "04";
					break;
				case APRIL:
					month = "04";
					previous = "03";
					next = "05";
					break;
				case MAY:
					month = "05";
					previous = "04";
					next = "06";
					break;
				case JUNE:
					month = "06";
					previous = "05";
					next = "07";
					break;
				case JULY:
					month = "07";
					previous = "06";
					next = "08";
					break;
				case AUGUST:
					month = "08";
					previous = "07";
					next = "09";
					break;
				case SEPTEMBER:
					month = "09";
					previous = "08";
					next = "10";
					break;
				case OCTOBER:
					month = "10";
					previous = "09";
					next = "11";
					break;
				case NOVEMBER:
					month = "11";
					previous = "10";
					next = "12";
					break;
				case DECEMBER:
					month = "12";
					previous = "11";
					next = "01";
					break;
				}
			}

			if (month.equals("01")) {
				previous = "12";
				next = "02";
			} else if (month.equals("02")) {
				previous = "01";
				next = "03";
			} else if (month.equals("03")) {
				previous = "02";
				next = "04";
			} else if (month.equals("04")) {
				previous = "03";
				next = "05";
			} else if (month.equals("05")) {
				previous = "04";
				next = "06";
			} else if (month.equals("06")) {
				previous = "05";
				next = "07";
			} else if (month.equals("07")) {
				previous = "06";
				next = "08";
			} else if (month.equals("08")) {
				previous = "07";
				next = "09";
			} else if (month.equals("09")) {
				previous = "08";
				next = "10";
			} else if (month.equals("10")) {
				previous = "09";
				next = "11";
			} else if (month.equals("11")) {
				previous = "10";
				next = "12";
			} else if (month.equals("12")) {
				previous = "11";
				next = "01";
			}
			
			String teamName = req.getParameter("teamName");
			if (teamName == null) {
				teamName = "LG";
			}
			
			List<Match> matches = matchDao.findByMonthAndTeam(month, teamName);
			req.setAttribute("teamName", teamName);
			req.setAttribute("size", matches.size());
			req.setAttribute("month", month);
			req.setAttribute("previous", previous);
			req.setAttribute("next", next);
			req.setAttribute("matches", matches);
			req.setAttribute("mode", "schedule");
			req.getRequestDispatcher("/WEB-INF/view/matches/schedule-team.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect(req.getContextPath() + "/error");
		}

	}
}
