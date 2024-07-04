package controller.hr;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.dao.EmployeesDao;
import model.dao.JobDao;
import model.vo.Employees;
import model.vo.Job;
import oracle.net.ns.SessionAtts;

@WebServlet("/hr/employees")
public class EmployeesController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EmployeesDao employeesDao = new EmployeesDao();
		String jobId = request.getParameter("jobId");
		try {
			List<Employees> employees = employeesDao.findAll();

			if(jobId != null) {
				employees = employeesDao.findByJobId(jobId);
			}
			request.setAttribute("employees", employees);
		
		} catch (Exception e) {
			System.out.println(e);
		}
		request.getRequestDispatcher("/WEB-INF/view/hr/employees.jsp").forward(request, response);
	}
	
}
