package util;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import vo.Pitcher;

public class FindPitcherRanking {

	public List<Pitcher> execute() {
		try {
			List<Pitcher> picher = new ArrayList<>();
			
			Document doc =Jsoup.connect("https://www.koreabaseball.com/Record/Player/PitcherBasic/Basic1.aspx").get();
			
			Elements elms 	=doc.getElementsByAttributeValue("summary", "선수 기본기록으로 경기,타석,타수,득점,안타,2루타, 3루타 등을 표시합니다");
			Element e = elms.get(0);
			Elements prs = e.getElementsByTag("tbody").get(0).getElementsByTag("tr");
			
			
			for(int i=0; i<prs.size(); i++) {
				Elements tds = prs.get(i).getElementsByTag("td");
				int rank = Integer.parseInt(tds.get(0).text());
				String name = tds.get(1).text();
				String team = tds.get(2).text();
				double era =  Double.parseDouble(tds.get(3).text());
				int game = Integer.parseInt(tds.get(4).text());
				int win = Integer.parseInt(tds.get(5).text());
				int lose = Integer.parseInt(tds.get(6).text());
				int save = Integer.parseInt(tds.get(7).text());
				int hold = Integer.parseInt(tds.get(8).text());
				String ip = tds.get(10).text();
				int hit = Integer.parseInt(tds.get(11).text());
				int hr = Integer.parseInt(tds.get(12).text());
				int bb = Integer.parseInt(tds.get(13).text());	
				int so = Integer.parseInt(tds.get(15).text());
				int r = Integer.parseInt(tds.get(16).text());
				double whip = Double.parseDouble(tds.get(18).text());
				
				Pitcher one = new Pitcher(rank,name,team,era,game,win,lose,save,hold,ip,hit,hr,bb,so,r,whip);
				picher.add(one);
			}
			return picher;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	
	}
	
}
