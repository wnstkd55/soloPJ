package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bbs.Bbs;
import user.User;

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
	
	//bbsID �Խñ� ��ȣ �������� �Լ�
		public int getNext() {
			String SQL = "SELECT pdID FROM product ORDER BY pdID DESC";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; // ù��° �Խù��ΰ��
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;// �����ͺ��̽� ����
		}
	
	//��ǰ ����ϴ� �Լ�
		public int register(String pdName, String rgID, int pdPrice, String pdPic, String pdExp, String pdCate) {
			String SQL = "INSERT INTO product VALUES(?,?,?,?,?,?,?)";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, pdName);
				pstmt.setString(3, rgID);
				pstmt.setInt(4, pdPrice);
				pstmt.setString(5, pdPic);
				pstmt.setString(6, pdExp);
				pstmt.setString(7, pdCate);
				
				return pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("��� ����");
			}
			return -1; // �����ͺ��̽� ����
		}
		
		//��ǰID�� �ش��ϴ� ���� �ҷ�����
		public Product getProduct(int pdId) {
			String SQL = "SELECT * FROM product WHERE pdID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, pdId);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					Product pp = new Product();
					pp.setPdId(rs.getInt(1));
					pp.setPdName(rs.getString(2));
					pp.setRgId(rs.getString(3));
					//bbs.setBbsTitle(rs.getString(4));
					pp.setPdPrice(rs.getInt(4));
					pp.setPdPic(rs.getString(5));
					pp.setPdExp(rs.getString(6));
					pp.setPdCate(rs.getString(7));

					return pp;

				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}	
		
	
	//��ǰ ����Ʈ
	public ArrayList<Product> getList() {
		
		String SQL = "SELECT * FROM product ORDER BY pdId desc";
		
		//Bbs���� ������ �� �����Ҽ� �ִ� �ν��Ͻ��� ����
		ArrayList<Product> plist = new ArrayList<Product>();
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(SQL);
			while (rs.next()) {
				Product pp = new Product();
				pp.setPdId(rs.getInt(1));
				pp.setPdName(rs.getString(2));
				pp.setRgId(rs.getString(3)); 
				pp.setPdPrice(rs.getInt(4));
				pp.setPdPic(rs.getString(5));
				pp.setPdExp(rs.getString(6));
				pp.setPdCate(rs.getString(7));
				plist.add(pp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return plist;
	}
	
	//����Ʈ �����(����ID�� �Ǹ���ID ��Ī)
		 public ArrayList<Product> SpInfoList(String userId){
			 String SQL = "SELECT * FROM product where rgID = ?";
			 ArrayList<Product> plist = new ArrayList<Product>();
			 try {
				 pstmt = conn.prepareStatement(SQL);
				 pstmt.setString(1, userId);
				 rs = pstmt.executeQuery();
				 
				 while(rs.next()) {
					 Product pp = new Product();
					 pp.setPdId(rs.getInt(1));
					 pp.setPdName(rs.getString(2));
					pp.setRgId(rs.getString(3)); 
					pp.setPdPrice(rs.getInt(4));
					pp.setPdPic(rs.getString(5));
					pp.setPdExp(rs.getString(6));
					pp.setPdCate(rs.getString(7));
					plist.add(pp);
				 }
			 }catch(Exception e) {
				 e.printStackTrace();
				 System.out.println("��������Ʈ ����");
			 }
			return plist;
		 }
		 
			//ī�װ�
		 public ArrayList<Product> category(String pdCate){
			 String SQL = "SELECT * FROM product WHERE pdCate = ? ORDER BY pdid desc";
			 ArrayList<Product> plist = new ArrayList<Product>();
			 try {
				 pstmt = conn.prepareStatement(SQL);
				 pstmt.setString(1, pdCate);
				 rs = pstmt.executeQuery();
				 
				 while(rs.next()) {
					 Product pp = new Product();
					 pp.setPdId(rs.getInt(1));
					 pp.setPdName(rs.getString(2));
					pp.setRgId(rs.getString(3)); 
					pp.setPdPrice(rs.getInt(4));
					pp.setPdPic(rs.getString(5));
					pp.setPdExp(rs.getString(6));
					pp.setPdCate(rs.getString(7));
					plist.add(pp);
				 }
			 }catch(Exception e) {
				 e.printStackTrace();
				 System.out.println("ī�װ�ȭ ����");
			 }
			return plist;
		 }
}
