/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
import utility.ConnectionPool;
import utility.DBUtility;

/**
 * @author Abhishek
 *
 */
public class LoginDAO {
	 
	 public static User login(User user) {
	        
			try {
				ConnectionPool pool = ConnectionPool.getInstance();
				Connection connection = pool.getConnection();
				PreparedStatement ps = null;
				ResultSet rs = null;
				String query = "SELECT * FROM login "
				        + "WHERE username = ? AND password = ?";
				try {
				    ps = connection.prepareStatement(query);
				    ps.setString(1, user.getUsername());
				    ps.setString(2, user.getPassword());
				    rs = ps.executeQuery();
				    if (rs.next()) {
				    	user.setId(rs.getInt("id"));
				    	user.setName(rs.getString("name"));
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
			return user;
	    }
}
