package controller.study;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.vo.Soldier;
import model.vo.Student;

@WebServlet("/study/about-el")
public class AboutELController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("total", 127);
		map.put("start", 11);
		map.put("end", 20);
		
		request.setAttribute("pages", map);
		
		Soldier s = new Soldier("22-70002801", "박원화", 1111);
		request.setAttribute("soldier", s);
		
		Student std = new Student("201230012", "박효영", "물리치료", 20);
		request.setAttribute("student", std);
		
		
		String[] cates = new String[] {"일반행정", "통계", "문화/역사"};
		request.setAttribute("category", cates);
		
		List<Student> students = 
				List.of(
						new Student("201230012", "박효영", "물리치료", 20), 
						new Student("201230012", "한노아", "실용음악", 20), 
						new Student("201230012", "남예준", "경영", 20)
				);
		request.setAttribute("students", students);
		
		request.setAttribute("student", std);
		
		
		
		
		
		
		
		
		request.getRequestDispatcher("/WEB-INF/view/study/about-el.jsp").forward(request, response);
	}
}
