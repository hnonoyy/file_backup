package util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import vo.Hitter;

public class FindHitterRanking {
	
	public List<Hitter> execute(){
		
		try {
			List<Hitter> hitters = new ArrayList<>();
			
			Document p1 =Jsoup.connect("https://www.koreabaseball.com/Record/Player/HitterBasic/Basic1.aspx").get();
			Document p2 =Jsoup.connect("https://www.koreabaseball.com/Record/Player/HitterBasic/Basic2.aspx").get();
			Elements p11 = p1.getElementsByAttributeValue("summary", "선수 기본기록으로 경기,타석,타수,득점,안타,2루타, 3루타 등을 표시합니다");
			Elements p22 = p2.getElementsByAttributeValue("summary", "선수 기본기록으로 타율, 볼넷, 고의사구, 삼진, 병살, 장타율, 출루율 등을 표시합니다");
			Element page1 = p11.get(0);
			Element page2 = p22.get(0);
			
			
			Elements trs1 = page1.getElementsByTag("tbody").get(0).getElementsByTag("tr");
			Elements trs2 = page2.getElementsByTag("tbody").get(0).getElementsByTag("tr");
			for(int i=0; i<trs1.size(); i++) {
				Elements tds1 = trs1.get(i).getElementsByTag("td");
				Elements tds2 = trs2.get(i).getElementsByTag("td");
				int rank = Integer.parseInt(tds1.get(0).text());
				String name = tds1.get(1).text();
				String teamName = tds1.get(2).text();
				double avg = Double.parseDouble(tds1.get(3).text());
				int game = Integer.parseInt(tds1.get(4).text());
				int pa = Integer.parseInt(tds1.get(5).text());
				int atBats = Integer.parseInt(tds1.get(6).text());
				int score = Integer.parseInt(tds1.get(7).text());
				int hit = Integer.parseInt(tds1.get(8).text());
				int homerun = Integer.parseInt(tds1.get(11).text());
				int rbi = Integer.parseInt(tds1.get(13).text());
				int bb = Integer.parseInt(tds2.get(4).text());
				int so = Integer.parseInt(tds2.get(7).text());
				double ops = Double.parseDouble(tds2.get(11).text());
				
				Hitter one = new Hitter(rank , name, teamName, avg, game, pa, atBats, score, hit, homerun, rbi, bb, so,ops);
				hitters.add(one);
			}
			
			
			
			return hitters;
			
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
}
