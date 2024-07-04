package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * 구구단 랜덤 단을 HTML 로 응답을 보내주는 서블릿을 만든다음
 * /gugudan.h2 에 매핑
 */
@WebServlet("/gugudan.hy")
public class GuguDan extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");

		PrintWriter out = resp.getWriter();

		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>구구단</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2 style='color:#FFB8B8'> 오늘 배울 구구단은 무엇일까요? </h2>");
		int r = 1 + (int) (Math.random() * 9);
		out.println("<p><b> 오늘은 " + r + "단 입니다.</b></p>");
		for (int i = 1; i <= 9; i++) {
			out.println("<p>" + r + " X " + i + " = " + r * i + "</p>"); //개행테크<br>
		}
		out.println("<p>잘 할 수 있어요🤗</p>");
		out.println("<p>");
		out.println("<a href='./fortune.hy'>운세 확인하러 가기</a>");
		out.println("</p>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
