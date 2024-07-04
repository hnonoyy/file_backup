package vo;

import java.sql.Date;

public class Match {
	String matchId;
	Date matchDate;
	String location; 
	String summary;
	
	public Match() {
		super();
	}
	
	public Match(String matchId, Date matchDate, String location, String summary) {
		super();
		this.matchId = matchId;
		this.matchDate = matchDate;
		this.location = location;
		this.summary = summary;
	}

	public String getMatchId() {
		return matchId;
	}

	public void setMatchId(String matchId) {
		this.matchId = matchId;
	}

	public Date getMatchDate() {
		return matchDate;
	}

	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	
	
}
