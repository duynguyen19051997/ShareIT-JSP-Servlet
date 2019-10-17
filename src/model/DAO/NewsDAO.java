package model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Category;
import model.bean.News;
import util.DBConectionUtil;
import util.DefineUtil;

public class NewsDAO {
	private Connection connect;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;

	public ArrayList<News> getItemsPublicByCatIdPagination(int catId, int offset) {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.cat_id = ? AND n.active = ? ORDER BY n.id DESC LIMIT ?, ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, catId);
			pst.setString(2, "active.jpg");
			pst.setInt(3, offset);
			pst.setInt(4, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"), rs.getInt("view"), 
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}
	
	public ArrayList<News> getItemsByCatId(int cat_id){
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.cat_id = ? AND n.active = ? ORDER BY n.id DESC";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, cat_id);
			pst.setString(2, "active.jpg");
			rs = pst.executeQuery();
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}
	
	public int addItem(News objNews) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "INSERT INTO news (name, preview, detail, date_create, creat_by , picture, cat_id, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, objNews.getName());
			pst.setString(2, objNews.getPreview());
			pst.setString(3, objNews.getDetail());
			pst.setTimestamp(4, objNews.getDate_create());
			pst.setString(5, objNews.getCreat_by());
			pst.setString(6, objNews.getPicture());
			pst.setInt(7, objNews.getObjCat().getId());
			pst.setString(8, objNews.getActive());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
		return result;
	}
	
	public ArrayList<News> getItemsLatest() {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id ORDER BY n.id DESC LIMIT 3";
		try {
			st = connect.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}
	
	public ArrayList<News> getItems() {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id ORDER BY n.id DESC";
		try {
			st = connect.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}
	
	public ArrayList<News> getItemsPublic() {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.active = ? AND n.cat_id = c.id ORDER BY n.id DESC";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "active.jpg");
			rs = pst.executeQuery();
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}

	public int updateActive(int id, String status) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "UPDATE news SET active = ? WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, status + ".jpg");
			pst.setInt(2, id);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
		return result;
	}

	public int getNumberOfItem() {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM news WHERE active = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "active.jpg");
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

	public ArrayList<News> getItemsPagination(int offset) {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id ORDER BY n.id DESC LIMIT ?, ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}

	public int deleteItem(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "DELETE FROM news WHERE id = ?";
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
	
	public int getCatId(int cat_id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM news WHERE cat_id = ? AND active = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, cat_id);
			pst.setString(2, "active.jpg");
			rs = pst.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cat_id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public int getId(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM news WHERE id = ? AND active = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, "active.jpg");
			rs = pst.executeQuery();
			if(rs.next()) {
				result = rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public News getItem(int id) {
		News objNews = null;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.id = ? AND n.active = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, "active.jpg");
			rs = pst.executeQuery();
			while (rs.next()) {
				objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return objNews;
	}
			
	public int editItem(News objNews) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "UPDATE news SET name = ?, "
				+ "preview = ?, detail = ?, creat_by = ?, picture = ?, cat_id = ?, active = ? "
				+ "WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, objNews.getName());
			pst.setString(2, objNews.getPreview());
			pst.setString(3, objNews.getDetail());
			pst.setString(4, objNews.getCreat_by());
			pst.setString(5, objNews.getPicture());
			pst.setInt(6, objNews.getObjCat().getId());
			pst.setString(7, objNews.getActive());
			pst.setInt(8, objNews.getId());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
		return result;
	}

	public ArrayList<News> searchItems(String name) {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.name LIKE ? ORDER BY n.id DESC";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "%" + name + "%");
			rs = pst.executeQuery();
			while(rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}

	public ArrayList<News> getPicture(int cat_id) {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE cat_id = ? ORDER BY n.id DESC";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, cat_id);
			rs = pst.executeQuery();
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}

	public int getNumberOfItem(int cat_id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT COUNT(*) AS count FROM news WHERE active = ? AND cat_id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "active.jpg");
			pst.setInt(2, cat_id);
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

	public ArrayList<News> getItemsPublicPagination(int offset) {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.active = ? ORDER BY n.id DESC LIMIT ?, ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "active.jpg");
			pst.setInt(2, offset);
			pst.setInt(3, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}

	public ArrayList<News> getItemsPublicByViewMax() {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.active = ? ORDER BY n.view DESC LIMIT 6";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "active.jpg");
			rs = pst.executeQuery();
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}

	public News getItemsPublicMaxViewByCatId(int catId) {
		News objNews = null;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.active = ? AND n.cat_id = ? ORDER BY n.view DESC";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "active.jpg");
			pst.setInt(2, catId);
			rs = pst.executeQuery();
			while (rs.next()) {
				objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return objNews;
	}

	public News getItemPublicById(int id) {
		News objNews = null;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.active = ? AND n.id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "active.jpg");
			pst.setInt(2, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return objNews;
	}

	public void increaseView(int id, int i) {
		connect = DBConectionUtil.getConnection();
		String sql = "UPDATE news SET view = ? WHERE id = ?";
		try {
			pst = connect.prepareStatement(sql);
			pst.setInt(1, i);
			pst.setInt(2, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(pst, connect);
		}
	}

	public ArrayList<News> getNewsPublicRelated(int id, int cat_id) {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.active = ? AND n.cat_id = ? AND n.id != ? ORDER BY n.view DESC LIMIT 2";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "active.jpg");
			pst.setInt(2, cat_id);
			pst.setInt(3, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}

	public ArrayList<News> getItemsPublicBySearch(String search) {
		ArrayList<News> listNews = new ArrayList<>();
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT n.*, c.* FROM news AS n INNER JOIN cat_list AS c ON n.cat_id = c.id WHERE n.active = ? AND n.name LIKE ? ORDER BY n.id DESC";
		try {
			pst = connect.prepareStatement(sql);
			pst.setString(1, "active.jpg");
			pst.setString(2, "%" + search + "%");
			rs = pst.executeQuery();
			while(rs.next()) {
				News objNews = new News(rs.getString("n.name"), rs.getString("n.preview"), rs.getString("n.detail"),
						rs.getString("n.creat_by"), rs.getString("n.picture"), rs.getTimestamp("n.date_create"),
						rs.getString("n.active"), rs.getInt("n.id"),
						new Category(rs.getInt("c.id"), rs.getInt("c.parent_id"), rs.getString("c.name")));
				listNews.add(objNews);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConectionUtil.close(rs, pst, connect);
		}
		return listNews;
	}

	public int deleteItemByCatId(int id) {
		int result = 0;
		connect = DBConectionUtil.getConnection();
		String sql = "DELETE FROM news WHERE cat_id = ?";
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

	/*
	 * public static void main(String[] args) { NewsDAO tt = new NewsDAO();
	 * System.out.println(tt.updateActive(1, "disactive")); }
	 */
}
