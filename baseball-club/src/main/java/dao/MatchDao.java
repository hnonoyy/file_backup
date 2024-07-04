package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.datasource.impl.OracleDataSource;
import vo.Match;

public class MatchDao {

	public List<Match> findByMonth(String month) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn
					.prepareStatement("select * from matches where to_char(match_date,'MM') = ?");
			stmt.setString(1, month);

			ResultSet rs = stmt.executeQuery();
			List<Match> matches = new ArrayList<Match>();
			while (rs.next()) {
				Match one = new Match(rs.getString(1), rs.getDate(2), rs.getString(3), rs.getString(4));
				matches.add(one);
			}
			return matches;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public List<Match> findByTeam(String teamName) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn
					.prepareStatement("select * from matches where SUMMARY like ?");
			stmt.setString(1, "%"+teamName+"%");

			ResultSet rs = stmt.executeQuery();
			List<Match> matches = new ArrayList<Match>();
			while (rs.next()) {
				Match one = new Match(rs.getString(1), rs.getDate(2), rs.getString(3), rs.getString(4));
				matches.add(one);
			}
			return matches;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public List<Match> findByMonthAndTeam(String month,String teamName) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn
					.prepareStatement("select * from matches where to_char(match_date,'MM') = ? and SUMMARY like ?");
			stmt.setString(1, month);
			stmt.setString(2, "%"+teamName+"%");

			ResultSet rs = stmt.executeQuery();
			List<Match> matches = new ArrayList<Match>();
			while (rs.next()) {
				Match one = new Match(rs.getString(1), rs.getDate(2), rs.getString(3), rs.getString(4));
				matches.add(one);
			}
			return matches;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public List<Match> findByWeek(Date start, Date end) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn
					.prepareStatement("select * from matches where match_date between ? and ?");
			stmt.setDate(1, start);
			stmt.setDate(2, end);

			ResultSet rs = stmt.executeQuery();
			List<Match> matches = new ArrayList<Match>();
			while (rs.next()) {
				Match one = new Match(rs.getString(1), rs.getDate(2), rs.getString(3), rs.getString(4));
				matches.add(one);
			}
			return matches;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	
	public List<Match> searchMatch(String word) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn
					.prepareStatement("select * from matches where summary like ? or location like ?");
			stmt.setString(1, "%"+word+"%");
			stmt.setString(2, "%"+word+"%");
			
			ResultSet rs = stmt.executeQuery();
			List<Match> matches = new ArrayList<Match>();
			while (rs.next()) {
				Match one = new Match(rs.getString(1), rs.getDate(2), rs.getString(3), rs.getString(4));
				matches.add(one);
			}
			return matches;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public List<Match> findByToday(Date today) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn
					.prepareStatement("select * from matches where match_date=?");
			stmt.setDate(1, today);

			ResultSet rs = stmt.executeQuery();
			List<Match> matches = new ArrayList<Match>();
			while (rs.next()) {
				Match one = new Match(rs.getString(1), rs.getDate(2), rs.getString(3), rs.getString(4));
				matches.add(one);
			}
			return matches;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
}
