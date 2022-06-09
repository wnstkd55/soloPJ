package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bbs.Bbs;



public class UserDAO {
	//dao:�����ͺ��̽� ���� ��ü�� ���ڷ�
	//���������� db���� ȸ������ �ҷ����ų� db�� ȸ�������� ������
	private Connection conn; //connection db�� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;
	private ResultSet rs;
	//Oracle�� ���� ���ִ� �κ�
	public UserDAO() {//������ ����ɶ����� �ڵ����� db������ �̷������ �ֵ�����
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
	 public int login(String userID, String userPassword) {
		 String SQL = "SELECT userPassword FROM USER01 WHERE userID = ?";
		 
		 try {
			 //pstmt: prepared statement ������ sql������ db�� �����ϴ� �������� �ν��Ͻ�������
			 pstmt = conn.prepareStatement(SQL);
			 //sql������ ���� ��ŷ����� �����ϴ°� pstmt�� �̿��� �ϳ��� ������ �̸� �غ��ؼ� (����ǥ���)
			 //����ǥ�� �ش��ϴ� ������ ���� ���̵��, �Ű������� �̿� 1)�����ϴ��� 2)��� ��������
			 pstmt.setString(1, userID);
			 //rs:result set�� �������
			 rs = pstmt.executeQuery();
			 //����� �����Ѵٸ� ����
			 if(rs.next()) {
				 //�н����� ��ġ�Ѵٸ� ����
				 if(rs.getString(1).equals(userPassword)) {
					 return 1;//�α״ϼ���
				 }else
					 return 0;//��� ����ġ
			 }return -1;//���̵� ����
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }return -2;//�����ͺ��̽� ������ �ǹ�
	 }
	 
	 public int join(User user) {
		 String SQL = "INSERT INTO USER01 VALUES (?,?,?,?,?,?)";
		 try {
			 pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1, user.getUserID());
			 pstmt.setString(2, user.getUserPassword());
			 pstmt.setString(3, user.getUserName());
			 pstmt.setString(4, user.getUserEmail());
			 pstmt.setString(5, user.getUserAddress());
			 pstmt.setString(6, user.getUserRole());
			 return pstmt.executeUpdate();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 return -1;//DB����
	 }
	 
	 public ArrayList<User> getUList(String userID){
		 String SQL = "SELECT * FROM USER01 WHERE USERID = ?";
		 ArrayList<User> ulist = new ArrayList<User>();
		 try {
			 pstmt = conn.prepareStatement(SQL);
			 pstmt.setString(1,"USERID");
			 rs = pstmt.executeQuery();
			 
			 while(rs.next()) {
				 User user = new User();
				 user.setUserID(rs.getString(1));
				 user.setUserPassword(rs.getString(2));
				 user.setUserName(rs.getString(3));
				 user.setUserEmail(rs.getString(4));
				 user.setUserAddress(rs.getString(5));
				 user.setUserRole(rs.getString(6));
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
			 System.out.println("��������Ʈ ����");
		 }
		return ulist;
	 }
 }