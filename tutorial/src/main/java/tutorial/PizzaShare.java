package tutorial;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/pizza")
public class PizzaShare extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		String query = req.getQueryString(); // ? 뒷부분 전체 문자열을 추출
		System.out.println("query : "+query); // 없으면 null 이 뜬다.
		// 특정이름으로 넘어온 벨류를 확인하려면??? split 를 직접할 필요없다.
		// WAS가 queryString을 분석을 해서 Map 형태로 처리를 해두기 때문에  
		req.getParameterMap();
		PrintWriter out = resp.getWriter();
		String slice = req.getParameter("slice");	// 이름(키)만 주고 해당하는 이름의 값을 얻어낼 수 있다. 없으면 null	
													// 전부 String 으로 저장을 하고 있다.
		System.out.println(slice);
		String n =req.getParameter("n");
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<title>피자나눠먹기</title>");
		out.println("</head>");
		out.println("<body>");
			
		if(slice == null || n == null) {
			out.println("<h2 style='color:#d51b21'> 🍕 slice 값과 n값이 반드시 전달되어야합니다 🍕 </h2>");
			
		}else {
			out.println("<div style =\"text-align:center\">");
			out.println("<img src='https://i.pinimg.com/236x/71/b1/16/71b11619e8e0895e907adba614452c1e.jpg' width='200' height='250'/");
			out.println("</div>");
			int iSlice = Integer.parseInt(slice);
			int iN = Integer.parseInt(n);
			
			int answer = 0;
			
			if(iN % iSlice == 0){
                answer = iN / iSlice;
            }else{
                answer = (iN / iSlice) + 1;
            }
			out.println("<p><br/> "+iN+"명이 "+iSlice+"조각으로 나눴을 때 <br/> 한조각 이상 먹으려면..? <br/> 🍕 정답은 🍕</p>");
			out.println("<p style=\"text-align: center; color: #f7a433 ; font-size:150%;\"> 최소 "+answer+"판을 시켜야합니다.🤤 </p>");
			
			out.println("<a href='./fortune.hy'>운세 확인하러 가기</a>");
			out.println("</body>");
			out.println("</html>");
			out.close();
		}
		
	}
}
