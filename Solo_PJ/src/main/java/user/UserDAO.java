package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import common.DBConnPool;


public class UserDAO extends DBConnPool{
	
	public int login(String userID, String userPassword) {
		
		
		try {
			
			String sql = "select userPassword from user01 where userID = ?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userID);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}else
					return 0;
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return -2;
	}
	
	public int join(User user) {
		
		try {
			String sql = "insert into user01 values(?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1,user.getUserID());
			psmt.setString(2, user.getUserPassword());
			psmt.setString(3, user.getUserName());
			psmt.setString(4, user.getUserGender());
			psmt.setString(5, user.getUserEmail());
			
			return psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	
	
}
