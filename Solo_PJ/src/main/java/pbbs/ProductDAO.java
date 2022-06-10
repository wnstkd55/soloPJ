package pbbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bbs.Bbs;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ProductDAO() {//������ ����ɶ����� �ڵ����� db������ �̷������ �ֵ�����
		try {
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "hr3";
			String dbPassword = "1234";
			
			Class.forName(driverName);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			System.out.println("DB�� ���� �Ǿ����ϴ�.\n");
			
		}catch(ClassNotFoundException e) {
			System.out.println("DB ����̹� �ε� ���� :" +e.toString());
		}catch(SQLException sqle) {
			System.out.println("DB ���ӽ��� :"+sqle.toString());
		}catch(Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}
	}
	
	public ArrayList<Product> getList() {
		
		String SQL = "SELECT * FROM product";
		
		//Bbs���� ������ �� �����Ҽ� �ִ� �ν��Ͻ��� ����
		ArrayList<Product> plist = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(SQL);
			while (rs.next()) {
				Product pp = new Product();
				pp.setPcode(rs.getString(1));
				pp.setPname(rs.getString(2)); 
				pp.setRegid(rs.getString(3));
				pp.setPinfo(rs.getString(4));
				pp.setPprice(rs.getInt(5));
				plist.add(pp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return plist;
	}
	
}
