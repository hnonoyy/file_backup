package vo;

public class Pitcher {

	int rank;
	String name;
	String team;
	double era;
	int game;
	int win;
	int lose;
	int save;
	int hold;
	String ip;
	int hit;
	int hr;
	int bb;
	int so;
	int r;
	double whip;

	public Pitcher() {
		super();
	}
	

	public Pitcher(int rank, String name, String team, double era, int game, int win, int lose, int save, int hold,
			String ip, int hit, int hr, int bb, int so, int r, double whip) {
		super();
		this.rank = rank;
		this.name = name;
		this.team = team;
		this.era = era;
		this.game = game;
		this.win = win;
		this.lose = lose;
		this.save = save;
		this.hold = hold;
		this.ip = ip;
		this.hit = hit;
		this.hr = hr;
		this.bb = bb;
		this.so = so;
		this.r = r;
		this.whip = whip;
	}


	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public double getEra() {
		return era;
	}

	public void setEra(double era) {
		this.era = era;
	}

	public int getGame() {
		return game;
	}

	public void setGame(int game) {
		this.game = game;
	}

	public int getWin() {
		return win;
	}

	public void setWin(int win) {
		this.win = win;
	}

	public int getLose() {
		return lose;
	}

	public void setLose(int lose) {
		this.lose = lose;
	}

	public int getSave() {
		return save;
	}

	public void setSave(int save) {
		this.save = save;
	}

	public int getHold() {
		return hold;
	}

	public void setHold(int hold) {
		this.hold = hold;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getHr() {
		return hr;
	}

	public void setHr(int hr) {
		this.hr = hr;
	}

	public int getBb() {
		return bb;
	}

	public void setBb(int bb) {
		this.bb = bb;
	}

	public int getSo() {
		return so;
	}

	public void setSo(int so) {
		this.so = so;
	}

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}

	public double getWhip() {
		return whip;
	}

	public void setWhip(double whip) {
		this.whip = whip;
	}

}
