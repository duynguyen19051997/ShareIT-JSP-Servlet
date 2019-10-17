package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Category;
import util.DBConectionUtil;
import util.DefineUtil;

public class CatDAO {
	private Connection connect;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;

	public ArrayList<Category> getItemsParent_Id(){
		ArrayList<Category> listCat = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM cat_list WHERE parent_id > 0 ORDER BY id DESC";
		try {
			st = connect.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Category objCat = new Category(rs.getInt("id"), rs.getInt("parent_id"), rs.getInt("sort"),
						rs.getString("name"), rs.getString("create_by"));
				listCat.add(objCat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listCat;
	}
	
	public ArrayList<Category> getItems() {
		ArrayList<Category> listCat = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM cat_list ORDER BY id DESC";
		try {
			st = connect.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Category objCat = new Category(rs.getInt("id"), rs.getInt("parent_id"), rs.getInt("sort"),
						rs.getString("name"));
				listCat.add(objCat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listCat;
	}
	
	public int getNumberOfItem() {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM cat_list";
		try {
			st = connect.createStatement();
			rs = st.executeQuery(sql);
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

	public ArrayList<Category> getItemsPagination(int offset) {
		ArrayList<Category> listCat = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM cat_list ORDER BY id DESC LIMIT ?, ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Category objCat = new Category(rs.getInt("id"), rs.getInt("parent_id"), rs.getInt("sort"), rs.getString("name"), rs.getString("create_by"));
				listCat.add(objCat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listCat;
	}
	
	public int addItem(Category objCat) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "INSERT INTO cat_list (name, parent_id, sort, create_by) VALUES (?, ?, ?, ?)";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, objCat.getName());
			pst.setInt(2, objCat.getParent_id());
			pst.setInt(3, objCat.getSort());
			pst.setString(4, objCat.getCreate_by());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
		return result;
	}

	public Category getItem(int id) {
		Category objCat = new Category();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * from cat_list WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if(rs.next()) {
				objCat = new Category(rs.getInt("id"), rs.getInt("parent_id"), rs.getInt("sort"), rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return objCat;
	}

	public int editItem(Category objCat) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "UPDATE cat_list SET name = ?, parent_id = ? , sort = ?, create_by = ? WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, objCat.getName());
			pst.setInt(2, objCat.getParent_id());
			pst.setInt(3, objCat.getSort());
			pst.setString(4, objCat.getCreate_by());
			pst.setInt(5, objCat.getId());
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
		String sql = "DELETE FROM cat_list WHERE id = ?";
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
	
	public int deleteItemsByParent_id(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "DELETE FROM cat_list WHERE parent_id = ?";
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

	public ArrayList<Category> searchItems(String name) {
		ArrayList<Category> listCat = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * from cat_list WHERE name LIKE ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "%" + name + "%");
			rs = pst.executeQuery();
			while(rs.next()) {
				Category objCat = new Category(rs.getInt("id"), rs.getInt("parent_id"), rs.getInt("sort"), rs.getString("name"));
				listCat.add(objCat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listCat;
	}

	public int getId(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM cat_list WHERE id = ?";
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

	public ArrayList<Category> getItemByPid(int parentId) {
		ArrayList<Category> listCat = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM cat_list WHERE parent_id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, parentId);
			rs = pst.executeQuery();
			while(rs.next()) {
				Category objCat = new Category(rs.getInt("id"), rs.getInt("parent_id"), rs.getInt("sort"),
						rs.getString("name"), rs.getString("create_by"));
				listCat.add(objCat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listCat;
	}
}
