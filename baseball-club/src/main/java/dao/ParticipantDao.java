package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.datasource.impl.OracleDataSource;
import vo.Participant;

public class ParticipantDao {

	public boolean saveParticipant(Participant participant) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn
					.prepareStatement("INSERT INTO PARTICIPANTS VALUES (PARTICIPANTS_SEQ.NEXTVAL,?, ?, ?)");

			stmt.setInt(1, participant.getEventId());
			stmt.setString(2, participant.getUserId());
			stmt.setDate(3, participant.getJoinAt());

			int r = stmt.executeUpdate();
			return r == 1 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Participant> findByEventId(int eventId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM PARTICIPANTS WHERE EVENT_ID=?");
			stmt.setInt(1, eventId);

			ResultSet rs = stmt.executeQuery();
			List<Participant> participants = new ArrayList<>();
			while (rs.next()) {
				Participant one = new Participant();

				one.setParticipantsId(rs.getInt("participants_id"));
				one.setEventId(rs.getInt("event_id"));
				one.setUserId(rs.getString("user_id"));
				one.setJoinAt(rs.getDate("join_at"));
				participants.add(one);
			}

			return participants;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Participant> findByUserId(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM PARTICIPANTS WHERE EVENT_ID=?");
			stmt.setString(1, userId);

			ResultSet rs = stmt.executeQuery();
			List<Participant> participants = new ArrayList<>();
			while (rs.next()) {
				Participant one = new Participant();

				one.setParticipantsId(rs.getInt("participants_id"));
				one.setEventId(rs.getInt("event_id"));
				one.setUserId(rs.getString("user_id"));
				one.setJoinAt(rs.getDate("join_at"));
				participants.add(one);
			}

			return participants;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean cancelParticipant(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM participants WHERE USER_ID=?");
			stmt.setString(1, userId);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public int countCapacity(int eventId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select count(*) from participants where event_id=?");
			stmt.setInt(1, eventId);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	public boolean deleteParticipantByUser(String userId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn
					.prepareStatement("delete PARTICIPANTS where user_id=?");

			stmt.setString(1, userId);

			int r = stmt.executeUpdate();
			return r >= 0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
