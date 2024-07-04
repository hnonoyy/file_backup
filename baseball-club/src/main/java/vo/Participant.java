package vo;

import java.sql.Date;

public class Participant {

	int participantsId;
	int eventId;
	String userId;
	Date joinAt;

	public Participant() {
		super();
	}

	public Participant(int participantsId, int eventId, String userId, Date joinAt) {
		super();
		this.participantsId = participantsId;
		this.eventId = eventId;
		this.userId = userId;
		this.joinAt = joinAt;
	}

	public int getParticipantsId() {
		return participantsId;
	}

	public void setParticipantsId(int participantsId) {
		this.participantsId = participantsId;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getJoinAt() {
		return joinAt;
	}

	public void setJoinAt(Date joinAt) {
		this.joinAt = joinAt;
	}

}
