package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.datasource.impl.OracleDataSource;
import vo.Comment;
import vo.User;

public class CommentDao {

	public boolean saveComment(Comment comment) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn
					.prepareStatement("insert into comments values(comments_seq.nextval,?,?,?,?,?)");
			stmt.setString(1, comment.getWriterId());
			stmt.setString(2, comment.getBody());
			stmt.setDate(3, comment.getWritedAt());
			stmt.setInt(4, comment.getLike());
			stmt.setInt(5, comment.getBoardId());

			int r = stmt.executeUpdate();

			return r >= 0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean deleteCommentByUser(String userId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("delete from comments where writer_id=?");
			stmt.setString(1, userId);

			int r = stmt.executeUpdate();

			return r >= 0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public List<Comment> findByBoardId(int boardId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select * from comments where board_id=?");
			stmt.setInt(1, boardId);

			ResultSet rs = stmt.executeQuery();
			List<Comment> comments = new ArrayList<>();
			while (rs.next()) {
				Comment one = new Comment(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5),
						rs.getInt(6));
				comments.add(one);
			}
			return comments;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public boolean deleteComment(int commentId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("delete from comments where comment_id=?");
			stmt.setInt(1, commentId);

			int r = stmt.executeUpdate();
			return r == 1 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean updateComment(Comment comment) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("update comments set body=? where comment_id=?");
			stmt.setString(1, comment.getBody());
			stmt.setInt(2, comment.getCommentId());
			int r = stmt.executeUpdate();

			return r >= 0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean plusLike(int commentId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("update comments set likes=likes+1 where comment_id=?");
			stmt.setInt(1, commentId);
			int r = stmt.executeUpdate();

			return r >= 0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean minusLike(int commentId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("update comments set likes=likes-1 where comment_id=?");
			stmt.setInt(1, commentId);
			int r = stmt.executeUpdate();

			return r >= 0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Comment findById(int commentId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select * from comments where comment_id=?");
			stmt.setInt(1, commentId);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				return new Comment(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5),
						rs.getInt(6));

			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	
	public int countComment(int boardId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {

			PreparedStatement stmt = conn.prepareStatement("select count(*) from comments where board_id=?");
			stmt.setInt(1, boardId);
			
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

	
	public boolean deleteCommentByBoard(int boardId) throws SQLException {
		OracleDataSource ods = new OracleDataSource();
		ods.setURL("jdbc:oracle:thin:@//13.125.210.77:1521/xe");
		ods.setUser("baseball_club");
		ods.setPassword("oracle");
		try (Connection conn = ods.getConnection()) {
			PreparedStatement stmt = conn.prepareStatement("delete from comments where board_id=?");
			stmt.setInt(1, boardId);

			int r = stmt.executeUpdate();

			return r >= 0 ? true : false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	
}
