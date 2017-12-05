package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.History;
import model.User;
import utility.ConnectionPool;
import utility.DBUtility;

public class HistoryDAO {
	
	public static int insert(History history){
		 ConnectionPool pool = ConnectionPool.getInstance();
	        Connection connection = pool.getConnection();
	        PreparedStatement ps = null;

	        String query
	                = "INSERT INTO history (user_id, search_type, params) "
	                + "VALUES (?, ?, ?)";
	        try {
	            ps = connection.prepareStatement(query);
	            ps.setInt(1, history.getUser().getId());
	            ps.setString(2, history.getSearchType());
	            ps.setString(3, history.getListOfInputs());
	            return ps.executeUpdate();
	        } catch (SQLException e) {
	            System.out.println(e);
	            return 0;
	        } finally {
	            DBUtility.closePreparedStatement(ps);
	            pool.freeConnection(connection);
	        }
	}
	
	public static List<History> getHistory(User user){
		List<History> listOfHistory = new ArrayList<History>();
		try {

			ConnectionPool pool = ConnectionPool.getInstance();
			Connection connection = pool.getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			String query = "SELECT * FROM history WHERE user_id = ?";
			try {
				ps = connection.prepareStatement(query);
				ps.setInt(1, user.getId());
				rs = ps.executeQuery();
				while (rs.next()) {
					History history = new History();
					history.setListOfInputs(rs.getString("params"));
					history.setSearchType(rs.getString("search_type"));
					history.setTimeStamp(rs.getTimestamp("timestamp"));
					history.setUser(user);
					listOfHistory.add(history);
				}

			} catch (SQLException e) {
				System.out.println(e);
			} finally {
				DBUtility.closeResultSet(rs);
				DBUtility.closePreparedStatement(ps);
				pool.freeConnection(connection);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return listOfHistory;
		
	}
}
