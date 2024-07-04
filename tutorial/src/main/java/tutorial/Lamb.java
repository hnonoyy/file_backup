package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/lamb")
public class Lamb extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();

		String n = req.getParameter("n");
		String k = req.getParameter("k");
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>양꼬치 계산</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h2 style='color:#9e444e;text-align:center;'> 양꼬치 계산기 </h2>");
		

		if (n == null || k == null) {
			out.println("<p> k값과 n값은 반드시 입력되어야 합니다! </p>");
		} else {
			out.println("<div style =\"text-align:center;\">");
			out.println("<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyiogWsJHYRVtG0B1dR8-Zju5od9BeZN1Qgg&s' width='200' height='200'/");
			out.println("</div>");
			
			int nI = Integer.parseInt(req.getParameter("n"));
			int kI = Integer.parseInt(req.getParameter("k"));
			int price = 0;
			price = nI * 12000 + kI * 2000 - (nI / 10 * 2000);
			
			out.println("<p style ='text-align:center; font-size:120%;'><b><br/> 양꼬치🍢"+n+"인분 <br/> 음료수 🥂 "+ kI +"병</b></p>");
			String.format("%,d", price);
			out.println("<p style='color:#ca3131;''text-align:center;''font-size:150%;><b> 계산금액 : 총 "+ String.format("%,d", price) +"원</b></p>");
		}

	}
}
