package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.Board;
import model.vo.Events;
import model.vo.SportsCenter;
import oracle.jdbc.datasource.impl.OracleDataSource;

public class BoardDao {

	public int countAll() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM BOARD");

			ResultSet rs = stmt.executeQuery();

			if(rs.next()) {
				int cnt = rs.getInt("COUNT(*)");
				return cnt;
			}else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public boolean save(Board newBoard) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL,?,?,?,?,?,?)");
			stmt.setString(1, newBoard.getWriteId());
			stmt.setString(2, newBoard.getTitle());
			stmt.setString(3, newBoard.getBody());
			stmt.setDate(4, newBoard.getWriteAt());
			stmt.setInt(5, newBoard.getReadCnt());
			stmt.setString(6, newBoard.getCategory());

			int r = stmt.executeUpdate();
			return r == 1 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Board> findByAll() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOARD ORDER BY WRITE_AT DESC");

			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setNo(rs.getInt("no"));
				one.setWriteId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setWriteAt(rs.getDate("write_at"));
				one.setReadCnt(rs.getInt("readcnt"));
				one.setCategory(rs.getString("category"));
				board.add(one);
			}

			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Board findByNo(int no) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOARD WHERE NO=?");
			stmt.setInt(1, no);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Board one = new Board();
				one.setNo(rs.getInt("no"));
				one.setWriteId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setWriteAt(rs.getDate("write_at"));
				one.setReadCnt(rs.getInt("readcnt"));
				one.setCategory(rs.getString("category"));
				return one;

			} else {
				return null;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Board> findByWriterId(String writerId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn
					.prepareStatement("SELECT * FROM BOARD WHERE WRITER_ID=? ORDER BY WRITED_AT DESC");
			stmt.setString(1, writerId);

			ResultSet rs = stmt.executeQuery();

			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setNo(rs.getInt("no"));
				one.setWriteId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setWriteAt(rs.getDate("write_at"));
				one.setReadCnt(rs.getInt("readcnt"));
				one.setCategory(rs.getString("category"));
				board.add(one);

			}

			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean deleteWriteView(int no) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM BOARD WHERE NO=?");
			stmt.setInt(1, no);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateWrite(Board board) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("UPDATE BOARD SET TITLE=?, BODY=? WHERE NO=?");
			stmt.setString(1, board.getTitle());
			stmt.setString(2, board.getBody());
			stmt.setInt(3, board.getNo());

			int r = stmt.executeUpdate();
			return r == 1 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean increaseReadCntByNo(int no) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			// 식별키로 조회하고,
			PreparedStatement stmt = conn.prepareStatement("UPDATE BOARD SET READCNT=READCNT+1 WHERE NO=?");
			stmt.setInt(1, no);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public List<Board> findByTitleLikeOrBodyLikeOrCategory(String pattern) throws SQLException{
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOARD WHERE TITLE LIKE ? OR body LIKE ? OR CATEGORY LIKE ? ORDER BY WRITE_AT ASC");
			stmt.setString(1, "%"+pattern+"%");
			stmt.setString(2, "%"+pattern+"%");
			stmt.setString(3, "%"+pattern+"%");
			ResultSet rs = stmt.executeQuery();
			
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setNo(rs.getInt("no"));
				one.setWriteId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setWriteAt(rs.getDate("write_at"));
				one.setReadCnt(rs.getInt("readcnt"));
				one.setCategory(rs.getString("category"));
				board.add(one);
			}

			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public List<Board> findAll(int start, int end) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//3.35.208.47:1521/xe");
		ods.setUser("fit_together");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.
					prepareStatement("SELECT * FROM (SELECT ROWNUM RN, g.* FROM (SELECT * FROM BOARD ORDER BY TITLE)g) WHERE RN BETWEEN ? AND ?");
			stmt.setInt(1, start);
			stmt.setInt(2, end);
			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while(rs.next()) {
				Board one = new Board();
				one.setNo(rs.getInt("no"));
				one.setWriteId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setWriteAt(rs.getDate("write_at"));
				one.setReadCnt(rs.getInt("readcnt"));
				one.setCategory(rs.getString("category"));
				board.add(one);
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
