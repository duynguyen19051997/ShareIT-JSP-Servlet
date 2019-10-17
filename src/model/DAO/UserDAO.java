package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.User;
import util.DBConectionUtil;
import util.DefineUtil;

public class UserDAO {
	private Connection connect;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;

	public ArrayList<User> getItems() {
		ArrayList<User> listUser = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM user ORDER BY id DESC";
		try {
			st = connect.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				User objUser = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("active"));
				listUser.add(objUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}

		return listUser;
	}

	public int addItem(User user) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "INSERT INTO user (username, password, fullname, active) VALUES (?,?,?,?)";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPassword());
			pst.setString(3, user.getFullname());
			pst.setString(4, user.getActive());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
		return result;
	}

	public boolean hasUser(User user) {
		boolean check = false;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM user WHERE username = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			rs = pst.executeQuery();
			if (rs.next()) {
				check = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return check;
	}

	public User getItem(int id) {
		User objUser = null;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM user WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				objUser = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("active"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return objUser;
	}

	public int editItem(User objUser) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "UPDATE user SET password = ?, fullname = ?, active = ? WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, objUser.getPassword());
			pst.setString(2, objUser.getFullname());
			pst.setString(3, objUser.getActive());
			pst.setInt(4, objUser.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return result;
	}

	public int deleteItem(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "DELETE FROM user WHERE id  = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return result;
	}

	public User getItemByUserAndPassword(String user, String password) {
		User objUser = null;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM user WHERE username = ? AND password = ? AND active = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, user);
			pst.setString(2, password);
			pst.setString(3, "active.jpg");
			rs = pst.executeQuery();
			if (rs.next()) {
				objUser = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("active"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return objUser;
	}

	public int getNumberOfItem() {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM user";
		try {
			st = connect.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				result = rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return result;
	}

	public ArrayList<User> getItemsPagination(int offset) {
		ArrayList<User> listUser = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM user ORDER BY id DESC LIMIT ?, ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				User objUser = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("active"));
				listUser.add(objUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listUser;
	}

	public int updateActive(int id, String string) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "UPDATE user SET active = ? WHERE id = ?";
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

	public int getId(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM user WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				result = rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<User> searchItems(String name) {
		ArrayList<User> listUser = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM user WHERE username LIKE ? ORDER BY id DESC";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "%" + name + "%");
			rs = pst.executeQuery();
			while(rs.next()) {
				User objUser = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"),
						rs.getString("fullname"), rs.getString("active"));
				listUser.add(objUser);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listUser;
	}
}
