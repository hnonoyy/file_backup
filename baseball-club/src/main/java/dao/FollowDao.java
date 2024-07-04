package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.datasource.impl.OracleDataSource;
import vo.Follow;
import vo.User;

public class FollowDao {
	
	public boolean saveFollow(Follow follow) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("insert into follow values(follow_seq.nextval,?,?)");
			stmt.setString(1, follow.getFollowingId());
			stmt.setString(2, follow.getFollowerId());

			int r = stmt.executeUpdate();

			return r >=0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public boolean deleteFollow(int followId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("delete from follow where follow_id=?");
			stmt.setInt(1, followId);
			
			int r = stmt.executeUpdate();

			return r == 1 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public Follow findById(int followId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select * from follow where follow_id=?");
			stmt.setInt(1, followId);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return new Follow(rs.getInt(1), rs.getString(2), rs.getString(3));
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public List<Follow> findByFollower(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select * from follow where following_id=?");
			stmt.setString(1, userId);

			ResultSet rs = stmt.executeQuery();
			List<Follow> follows = new ArrayList<Follow>();
			while (rs.next()) {
				Follow one = new Follow(rs.getInt(1), rs.getString(2), rs.getString(3));
				follows.add(one);
			} 
			
			return follows;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public List<Follow> findByFollowing(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select * from follow where follower_id=?");
			stmt.setString(1, userId);

			ResultSet rs = stmt.executeQuery();
			List<Follow> follows = new ArrayList<Follow>();
			while (rs.next()) {
				Follow one = new Follow(rs.getInt(1), rs.getString(2), rs.getString(3));
				follows.add(one);
			} 
			
			return follows;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public int countByFollowing(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select count(*) from follow where follower_id=?");
			stmt.setString(1, userId);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}
	
	
	public int countByFollower(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select count(*) from follow where following_id=?");
			stmt.setString(1, userId);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}
	
	
	public boolean deleteUser(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("delete from follow where following_id=? or follower_id=?");
			stmt.setString(1, userId);
			stmt.setString(2, userId);
			
			int r = stmt.executeUpdate();

			return r >= 0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	
	public boolean deleteUnfollow(String followerId, String followingId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("delete from follow where follower_id=? and following_id=?");
			stmt.setString(1, followerId);
			stmt.setString(2, followingId);
			
			int r = stmt.executeUpdate();

			return r == 1 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
}
