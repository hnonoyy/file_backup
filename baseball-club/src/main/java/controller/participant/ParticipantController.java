package controller.participant;

import java.io.IOException;
import java.sql.Date;

import dao.ParticipantDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Participant;
import vo.User;

@WebServlet("/participant/*")
public class ParticipantController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			User authUser = (User)req.getSession().getAttribute("authUser");

			if(authUser == null) {
				resp.sendRedirect(req.getContextPath()+"/login");
				return;
			}
			
			int eventId = Integer.parseInt(req.getParameter("boardId"));
			String userId = authUser.getUserId();
			Date joinAt = new Date(System.currentTimeMillis());
			
			ParticipantDao participantDao = new ParticipantDao();
			Participant participant = new Participant();
			
			participant.setParticipantsId(0);
			participant.setUserId(userId);
			participant.setEventId(eventId);
			participant.setJoinAt(joinAt);
			
			participantDao.saveParticipant(participant);
			
			resp.sendRedirect(req.getContextPath()+"/board?boardId="+eventId);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
