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
	
	public ProductDAO() {//생성자 실행될때마다 자동으로 db연결이 이루어질수 있도록함
		try {
			String driverName = "oracle.jdbc.driver.OracleDriver";
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "hr3";
			String dbPassword = "1234";
			
			Class.forName(driverName);
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			System.out.println("DB에 연결 되었습니다.\n");
			
		}catch(ClassNotFoundException e) {
			System.out.println("DB 드라이버 로딩 실패 :" +e.toString());
		}catch(SQLException sqle) {
			System.out.println("DB 접속실패 :"+sqle.toString());
		}catch(Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}
	}
	
	//bbsID 게시글 번호 가져오는 함수
		public int getNext() {
			String SQL = "SELECT pdID FROM product ORDER BY pdID DESC";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; // 첫번째 게시물인경우
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;// 데이터베이스 오류
		}
	
	//상품 등록하는 함수
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
				System.out.println("등록 오류");
			}
			return -1; // 데이터베이스 오류
		}
		
		//작품ID에 해당하는 정보 불러오기
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
		
	
	//상품 리스트
	public ArrayList<Product> getList() {
		
		String SQL = "SELECT * FROM product ORDER BY pdId desc";
		
		//Bbs에서 나오는 걸 보관할수 있는 인스턴스를 생성
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
	
	//리스트 만들기(유저ID와 판매자ID 매칭)
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
				 System.out.println("유저리스트 오류");
			 }
			return plist;
		 }
		 
			//카테고리
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
				 System.out.println("카테고리화 오류");
			 }
			return plist;
		 }
}
