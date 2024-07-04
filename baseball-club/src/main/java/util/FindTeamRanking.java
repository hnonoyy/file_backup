package util;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import vo.TeamRanking;

public class FindTeamRanking {

	public List<TeamRanking> execute() {
		try {
			List<TeamRanking> ranks = new ArrayList<>();

			Document doc =Jsoup.connect("https://www.koreabaseball.com/Record/TeamRank/TeamRank.aspx").get();
			Elements elms 	=doc.getElementsByAttributeValue("summary", "순위, 팀명,승,패,무,승률,승차,최근10경기,연속,홈,방문");
			Element e = elms.get(0);
			Elements trs = e.getElementsByTag("tbody").get(0).getElementsByTag("tr");
			for(int i=0; i<trs.size(); i++) {
				Elements tds = trs.get(i).getElementsByTag("td");
				int rank = Integer.parseInt(tds.get(0).text());
				String name = tds.get(1).text();
				int games = Integer.parseInt(tds.get(2).text());
				int win = Integer.parseInt(tds.get(3).text());
				int lose = Integer.parseInt(tds.get(4).text());
				int draw = Integer.parseInt(tds.get(5).text());
				double wp = Double.parseDouble(tds.get(6).text());
				double gb = Double.parseDouble(tds.get(7).text());
				String stream = tds.get(9).text();

				TeamRanking r = new TeamRanking(rank, name, games, win, lose, draw, wp, gb, stream);
				
				ranks.add(r);
			}
			
			return ranks;
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

}
