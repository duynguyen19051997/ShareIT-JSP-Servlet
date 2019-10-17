package model.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.bean.aboutMe;
import util.DBConectionUtil;

public class aboutMeDAO {
	private Connection connect;
	private Statement st;
	private ResultSet rs;
	
	public aboutMe myInfor() {
		aboutMe me = null;
		connect = DBConectionUtil.getConnection();
		String sql = "SELECT * FROM aboutme";
		try {
			st = connect.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				me = new aboutMe(rs.getString("me"), rs.getString("email"), rs.getString("facebook"), rs.getInt("phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return me;
	}
}
