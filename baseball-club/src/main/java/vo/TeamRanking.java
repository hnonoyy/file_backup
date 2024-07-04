package vo;

public class TeamRanking {
	int rank;
	String name;
	int games;
	int win;
	int lose;
	int draw;
	double winningPercentage;
	double gameBehind;
	String stream;
	
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

	public int getGames() {
		return games;
	}

	public void setGames(int games) {
		this.games = games;
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

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public double getWinningPercentage() {
		return winningPercentage;
	}

	public void setWinningPercentage(double winningPercentage) {
		this.winningPercentage = winningPercentage;
	}

	public double getGameBehind() {
		return gameBehind;
	}

	public void setGameBehind(double gameBehind) {
		this.gameBehind = gameBehind;
	}

	public String getStream() {
		return stream;
	}

	public void setStream(String stream) {
		this.stream = stream;
	}

	public TeamRanking() {
		super();
	}

	public TeamRanking(int rank, String name, int games, int win, int lose, int draw, double winningPercentage,
			double gameBehind, String stream) {
		super();
		this.rank = rank;
		this.name = name;
		this.games = games;
		this.win = win;
		this.lose = lose;
		this.draw = draw;
		this.winningPercentage = winningPercentage;
		this.gameBehind = gameBehind;
		this.stream = stream;
	}
	
	
}
