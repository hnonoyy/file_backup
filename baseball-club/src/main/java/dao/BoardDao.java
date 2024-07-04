package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.datasource.impl.OracleDataSource;
import vo.Board;

public class BoardDao {

	public int countAll() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM BOARDS");

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				int cnt = rs.getInt("COUNT(*)");
				return cnt;
			} else {
				return -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<Board> findByAll(int start, int end) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement(
					"SELECT * FROM (SELECT ROWNUM RN, g.* FROM (SELECT * FROM BOARDS ORDER BY WRITED_AT desc)g) WHERE RN BETWEEN ? AND ?");
			stmt.setInt(1, start);
			stmt.setInt(2, end);
			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();

			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean save(Board board) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn
					.prepareStatement("INSERT INTO BOARDS VALUES(BOARD_SEQ.NEXTVAL,?,?,?,?,?,?,?)");
			stmt.setString(1, board.getWriterId());
			stmt.setString(2, board.getTitle());
			stmt.setString(3, board.getBody());
			stmt.setInt(4, board.getViews());
			stmt.setDate(5, board.getWritedAt());
			stmt.setString(6, board.getCategory());
			stmt.setString(7, board.getType());

			int r = stmt.executeUpdate();
			return r == 1 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Board> findAll() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOARDS ORDER BY WRITE_AT DESC");

			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);
			}

			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Board findByBoardId(int boardId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOARDS WHERE BOARD_ID=?");
			stmt.setInt(1, boardId);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
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
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn
					.prepareStatement("SELECT * FROM BOARDS WHERE WRITER_ID=? ORDER BY WRITED_AT DESC");
			stmt.setString(1, writerId);

			ResultSet rs = stmt.executeQuery();

			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);

			}

			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean deleteWriteView(int boardId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM BOARDS WHERE BOARD_ID=?");
			stmt.setInt(1, boardId);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean deleteByWriterId(String boardId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM BOARDS WHERE WRITER_ID=?");
			stmt.setString(1, boardId);

			int r = stmt.executeUpdate();

			return r >= 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateWrite(Board board) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");

		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn
					.prepareStatement("UPDATE BOARDS SET TITLE=?, BODY=?, TYPE=?, CATEGORY=? WHERE BOARD_ID=?");
			stmt.setString(1, board.getTitle());
			stmt.setString(2, board.getBody());
			stmt.setString(3, board.getType());
			stmt.setString(4, board.getCategory());
			stmt.setInt(5, board.getBoardId());

			int r = stmt.executeUpdate();
			return r == 1 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean increaseViews(int boardId) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("UPDATE BOARDS SET VIEWS=VIEWS+1 WHERE BOARD_ID=?");
			stmt.setInt(1, boardId);

			int r = stmt.executeUpdate();

			return r == 1 ? true : false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public List<Board> searchBoardByType(String type) throws Exception {

		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM BOARDS WHERE TYPE=? ORDER BY WRITED_AT DESC");
			stmt.setString(1, type);
			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));

				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Board> searchBoard(String word) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn
					.prepareStatement("select * from boards where title like ? or category like ? or type like ?");
			stmt.setString(1, "%" + word + "%");
			stmt.setString(2, "%" + word + "%");
			stmt.setString(3, "%" + word + "%");
			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);

			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Board> findEventByView() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement(
					"select * from (SELECT * FROM BOARDS where type='이벤트' ORDER BY views DESC) where ROWNUM between 1 and 5");

			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Board> findClubByView() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement(
					"select * from (SELECT * FROM BOARDS where type='구단' ORDER BY views DESC) where ROWNUM between 1 and 5");

			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Board> findPlazaByView() throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement(
					"select * from (SELECT * FROM BOARDS where type='광장' ORDER BY views DESC) where ROWNUM between 1 and 5");

			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Board> ListSearchByWord(String word) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement(
					"select * from boards where type='광장' and (title like ? or writer_id like ? or body like ?) order by writed_at");
			stmt.setString(1, "%" + word + "%");
			stmt.setString(2, "%" + word + "%");
			stmt.setString(3, "%" + word + "%");

			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Board> ClubSearchByWord(String word) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement(
					"select * from boards where type='구단' and (title like ? or writer_id like ? or body like ?) order by writed_at");
			stmt.setString(1, "%" + word + "%");
			stmt.setString(2, "%" + word + "%");
			stmt.setString(3, "%" + word + "%");

			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Board> EventSearchByWord(String word) throws Exception {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement(
					"select * from boards where type='이벤트' and (title like ? or writer_id like ? or body like ?) order by writed_at");
			stmt.setString(1, "%" + word + "%");
			stmt.setString(2, "%" + word + "%");
			stmt.setString(3, "%" + word + "%");

			ResultSet rs = stmt.executeQuery();
			List<Board> board = new ArrayList<>();
			while (rs.next()) {
				Board one = new Board();
				one.setBoardId(rs.getInt("board_id"));
				one.setWriterId(rs.getString("writer_id"));
				one.setTitle(rs.getString("title"));
				one.setBody(rs.getString("body"));
				one.setViews(rs.getInt("views"));
				one.setWritedAt(rs.getDate("writed_at"));
				one.setCategory(rs.getString("category"));
				one.setType(rs.getString("type"));
				board.add(one);
			}
			return board;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
