package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Comment;
import util.DBConectionUtil;
import util.DefineUtil;

public class CommentDAO {
	private Connection connect;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;

	public int addComment(Comment objCom) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "INSERT INTO comment(content, email, news_id, active)" + "VALUES(?, ?, ?, ?)";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, objCom.getMessage());
			pst.setString(2, objCom.getEmail());
			pst.setInt(3, objCom.getNew_id());
			pst.setString(4, objCom.getActive());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
		return result;
	}

	public ArrayList<Comment> getItems(int news_id) {
		ArrayList<Comment> listCmt = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM comment WHERE news_id = ? AND active = ? ORDER BY id DESC";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, news_id);
			pst.setString(2, "active.jpg");
			rs = pst.executeQuery();
			while (rs.next()) {
				Comment objCmt = new Comment(rs.getString("email"), rs.getString("content"), rs.getString("active"),
						rs.getInt("id"), rs.getInt("news_id"), rs.getTimestamp("date_create"));
				listCmt.add(objCmt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCmt;
	}

	public Comment getItemById(int id) {
		Comment cmt = null;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM comment WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				cmt = new Comment(rs.getString("email"), rs.getString("content"), rs.getString("active"),
						rs.getInt("id"), rs.getInt("news_id"), rs.getTimestamp("date_create"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return cmt;
	}

	public int getNumberOfItemsPublic(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM comment WHERE news_id = ? AND active = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, "active.jpg");
			rs = pst.executeQuery();
			if (rs.next()) {
				result = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return result;
	}

	public int getNumberOfItem() {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM comment ORDER BY id DESC";
		try {
			st = connect.createStatement();
			rs = st.executeQuery(sql);
			if (rs.next()) {
				result = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, st, connect);
		}
		return result;
	}

	public ArrayList<Comment> getItemsPagination(int offset) {
		ArrayList<Comment> listCmt = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM comment ORDER BY id DESC LIMIT ?, ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Comment objCmt = new Comment(rs.getString("email"), rs.getString("content"), rs.getString("active"),
						rs.getInt("id"), rs.getInt("news_id"), rs.getTimestamp("date_create"));
				listCmt.add(objCmt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listCmt;
	}

	public int updateActive(int id, String string) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "UPDATE comment SET active = ? WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, string + ".jpg");
			pst.setInt(2, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
		return result;
	}

	public int deleteItem(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "DELETE FROM comment WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
		return result;
	}

	public int deleteItemByNewsId(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "DELETE FROM comment WHERE news_id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
		return result;
	}
}
