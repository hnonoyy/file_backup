package controller.hr;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.JobDao;
import model.vo.Job;

@WebServlet("/hr/job")
public class JabController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JobDao jobDao = new JobDao();

		try {
			List<Job> jobs = jobDao.findByJobs();
			request.setAttribute("jobs", jobs);
			
			//request.getRequestDispatcher("/WEB-INF/view/hr/job.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
			//request.getRequestDispatcher("/WEB-INF/view/hr/error.jsp").forward(request, response);
		}
		request.getRequestDispatcher("/WEB-INF/view/hr/job.jsp").forward(request, response);
	}
	
}
