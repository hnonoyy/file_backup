package vo;

public class Hitter {
	int rank;
	String name;
	String teamName;
	double average;
	int game;
	int pa;
	int atBats;
	int score;
	int hit;
	int homerun;
	int rbi;
	int bb;
	int so;
	double ops;
	
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

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public double getAverage() {
		return average;
	}

	public void setAverage(double average) {
		this.average = average;
	}

	public int getGame() {
		return game;
	}

	public void setGame(int game) {
		this.game = game;
	}

	public int getPa() {
		return pa;
	}

	public void setPa(int pa) {
		this.pa = pa;
	}

	public int getAtBats() {
		return atBats;
	}

	public void setAtBats(int atBats) {
		this.atBats = atBats;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getHomerun() {
		return homerun;
	}

	public void setHomerun(int homerun) {
		this.homerun = homerun;
	}

	public int getRbi() {
		return rbi;
	}

	public void setRbi(int rbi) {
		this.rbi = rbi;
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

	public double getOps() {
		return ops;
	}

	public void setOps(double ops) {
		this.ops = ops;
	}

	public Hitter() {
		super();
	}

	public Hitter(int rank, String name, String teamName, double average, int game, int pa, int atBats, int score,
			int hit, int homerun, int rbi, int bb, int so, double ops) {
		super();
		this.rank = rank;
		this.name = name;
		this.teamName = teamName;
		this.average = average;
		this.game = game;
		this.pa = pa;
		this.atBats = atBats;
		this.score = score;
		this.hit = hit;
		this.homerun = homerun;
		this.rbi = rbi;
		this.bb = bb;
		this.so = so;
		this.ops = ops;
	}
	

	

	
	
	
	
}
