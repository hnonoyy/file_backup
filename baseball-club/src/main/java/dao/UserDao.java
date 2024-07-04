package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.datasource.impl.OracleDataSource;
import vo.User;

public class UserDao {

	public boolean saveUser(User user) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("insert into users values(?,?,?,?,?,?,?,?)");
			stmt.setString(1, user.getUserId());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getNickname());
			stmt.setDate(4, user.getBirth());
			stmt.setString(5, user.getGender());
			stmt.setString(6, user.getEmail());
			stmt.setString(7, user.getClub());
			stmt.setString(8, user.getRole());

			int r = stmt.executeUpdate();

			return r >=0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public User findById(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select * from users where user_id=?");
			stmt.setString(1, userId);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8));
			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public boolean deleteUser(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("delete from users where user_id=?");
			stmt.setString(1, userId);
			
			int r = stmt.executeUpdate();

			return r >=0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	public boolean updateUser(User user) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("update users set password=?, nickname=?, email=?, FAVORITE_CLUB=? where user_id=?");
			stmt.setString(1, user.getPassword());
			stmt.setString(2, user.getNickname());
			stmt.setString(3, user.getEmail());
			stmt.setString(4, user.getClub());
			stmt.setString(5, user.getUserId());

			int r = stmt.executeUpdate();

			return r >=0  ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	

}
