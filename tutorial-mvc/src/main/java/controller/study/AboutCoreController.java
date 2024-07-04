package controller.study;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.vo.Student;

@WebServlet("/study/about-core")
public class AboutCoreController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean result = Math.random()	> 0.5;
		
		request.setAttribute("result", result);
		
		request.setAttribute("code", (int)(Math.random()*3));
		
		
		String[] cates = new String[] {"일반행정", "통계", "문화/역사"};
		request.setAttribute("category", cates);
		request.setAttribute("categoryLength", cates.length);
		
		
		List<Student> students = 
				List.of(
						new Student("201230012", "박효영", "물리치료", 20), 
						new Student("201230028", "한노아", "실용음악", 20), 
						new Student("201230007", "남예준", "경영", 20)
				);
		request.setAttribute("students", students);
		
		
	
		request.getRequestDispatcher("/WEB-INF/view/study/about-core.jsp").forward(request, response);
	}
}
