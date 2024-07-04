package vo;

public class Follow {
	int followId;
	String followingId;
	String followerId;
	
	public Follow() {
		super();
	}

	public Follow(int followId, String followingId, String followerId) {
		super();
		this.followId = followId;
		this.followingId = followingId;
		this.followerId = followerId;
	}

	public int getFollowId() {
		return followId;
	}

	public void setFollowId(int followId) {
		this.followId = followId;
	}

	public String getFollowingId() {
		return followingId;
	}

	public void setFollowingId(String followingId) {
		this.followingId = followingId;
	}

	public String getFollowerId() {
		return followerId;
	}

	public void setFollowerId(String followerId) {
		this.followerId = followerId;
	}
	
	
	
	
}
