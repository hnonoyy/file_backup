package vo;

public class BoardandComment {
	Board board;
	int commentCount;
	
	
	public BoardandComment() {
		super();
	}

	public BoardandComment(Board board, int commentCount) {
		super();
		this.board = board;
		this.commentCount = commentCount;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	
	
	
	
	
}
