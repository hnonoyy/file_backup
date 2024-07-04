package vo;

import java.sql.Date;

public class Comment {
	int commentId;
	String writerId;
	String body;
	Date writedAt;
	int like;
	int boardId;
	
	public Comment() {
		super();
	}

	public Comment(int commentId, String writerId, String body, Date writedAt, int like, int boardId) {
		super();
		this.commentId = commentId;
		this.writerId = writerId;
		this.body = body;
		this.writedAt = writedAt;
		this.like = like;
		this.boardId = boardId;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public Date getWritedAt() {
		return writedAt;
	}

	public void setWritedAt(Date writedAt) {
		this.writedAt = writedAt;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	
	
	
	
}
