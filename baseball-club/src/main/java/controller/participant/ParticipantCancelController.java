package controller.participant;

import java.io.IOException;
import java.util.List;

import dao.ParticipantDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vo.Participant;
import vo.User;

@WebServlet("/participant/cancel")
public class ParticipantCancelController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			User authUser = (User)req.getSession().getAttribute("authUser");
			if(authUser == null) {
				resp.sendRedirect(req.getContextPath()+"/error");
				return;
			}
			String userId = authUser.getUserId();
			int eventId = Integer.parseInt(req.getParameter("boardId"));
			
			ParticipantDao participantDao = new ParticipantDao();
			
			
			participantDao.cancelParticipant(userId);
			
			resp.sendRedirect(req.getContextPath()+"/board?boardId="+eventId);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
}
