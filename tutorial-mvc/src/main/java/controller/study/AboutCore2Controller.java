package controller.study;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.vo.Student;

@WebServlet("/study/about-core-2")
public class AboutCore2Controller extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		request.setAttribute("message", "<h2>hihi</h2>");
		request.setAttribute("body", "<script>window.alert('ㅋㅋㅋㅋ')</script>");

		List<Student> students = 
				List.of(
						new Student("201230012", "박효영", "물리치료", 21), 
						new Student("201238528", "한노아", "실용음악", 22), 
						new Student("201224507", "남예준", "경영", 23)
				);
		request.setAttribute("students", students);
		
		
	
		request.getRequestDispatcher("/WEB-INF/view/study/about-core-2.jsp").forward(request, response);
	}
}
