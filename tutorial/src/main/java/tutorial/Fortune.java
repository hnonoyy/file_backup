package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Fortune extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); //text/plain => 응답을 글씨로 하겠다는 말 text/plain;charset=UTF-8 한글
		
		PrintWriter out = resp.getWriter();
		
		int number = 1+(int)(Math.random()*9); //1~9

		String[] colors = "빨강,주황,노랑,초록,파랑".split(",");
		String color = colors[(int)(Math.random()*colors.length)];
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>오늘의 운세</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<img src='https://media.bunjang.co.kr/product/181699861_1_1657437469_w360.jpg' width='400' height='350'/>");
		if(Math.random()>0.5) {
			out.println("<h2 style='color:#ffe6a8'>오늘은 기회와 도전이 가득한 날!</h2>");
		}else {
			out.println("<h2 style='color:#a6c3e3;'>오늘은 행복과 만남이 가득한 날!</h2>");
			
		}
		
		out.println("<p>행운의 숫자는 ["+number+"] 이고, 색깔은 "+color+"색이니 참고하세요.</p>");
		out.println("<p>오늘 하루 기쁨의 순간들을 즐기세요.</p>");
		out.println("<p>");
		out.println("<a href='./gugudan.hy'>구구단 배우기</a>");
		out.println("</p>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
