package vo;

import java.sql.Date;

public class Board {
	int boardId;
	String writerId;
	String title;
	String body;
	int views;
	Date writedAt;
	String category;
	String type;

	public Board() {
		super();
	}

	public Board(int boardId, String writerId, String title, String body, int views, Date writedAt, String category,
			String type) {
		super();
		this.boardId = boardId;
		this.writerId = writerId;
		this.title = title;
		this.body = body;
		this.views = views;
		this.writedAt = writedAt;
		this.category = category;
		this.type = type;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getWritedAt() {
		return writedAt;
	}

	public void setWritedAt(Date writedAt) {
		this.writedAt = writedAt;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
