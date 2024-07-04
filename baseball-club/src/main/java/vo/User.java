package vo;

import java.sql.Date;

public class User {
	String userId;
	String password;
	String nickname;
	Date birth;
	String gender;
	String email;
	String club;
	String role;
	
	public User() {
		super();
	}

	public User(String userId, String password, String nickname, Date birth, String gender, String email, String club,
			String role) {
		super();
		this.userId = userId;
		this.password = password;
		this.nickname = nickname;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.club = club;
		this.role = role;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getClub() {
		return club;
	}

	public void setClub(String club) {
		this.club = club;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	
	
	
	
}
