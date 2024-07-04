package listener;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import model.Rank;

public class PlaygroundListener implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {

		System.out.println("숫자야구를 시작합니다?!");

		ServletContext application = sce.getServletContext();
		List<Rank> list = new ArrayList<>();
		application.setAttribute("ranks", new ArrayList<Rank>());
	}

}
