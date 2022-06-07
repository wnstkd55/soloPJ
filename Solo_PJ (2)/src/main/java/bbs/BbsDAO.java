package bbs;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;


import common.DBConnPool;

public class BbsDAO extends DBConnPool{
	
	public String getDate() {
		String sql = "SELECT to_char(sysdate,'yyyy-mm-dd') from bbs";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			//close();
		}
		return null; //�����ͺ��̽� ����
	}
	//�Խñ� ��ȣ �ο� �޼ҵ�
		public int getNext() {
			//���� �Խñ��� ������������ ��ȸ�Ͽ� ���� ������ ���� ��ȣ�� ���Ѵ�
			String sql = "select bbsID from bbs order by bbsID desc";
			try {
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; //ù ��° �Խù��� ���
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("�۹�ȣ ����");
			}finally {
				//close();
			}
			return -1; //�����ͺ��̽� ����
		}
		
		//�۾��� �޼ҵ�
		public int write(String bbsTitle, String userID, String bbsContent) {
			String sql = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";
			try {
//				int num = 0;
//				num = getNext();
//				
//				String title = "";
//				title = bbsTitle;
//				String id = "";
//				id = userID;
//				String cont = "";
//				cont = bbsContent;
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, getNext());
				psmt.setString(2, bbsTitle);
				psmt.setString(3, userID);
				psmt.setString(4, getDate());
				psmt.setString(5, bbsContent);
				psmt.setInt(6, 1); //���� ��ȿ��ȣ
				
				
				return psmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("�۾��� ����");
			}finally {
				//close();
			}
			return -1; //�����ͺ��̽� ����
		}
		//�Խñ� ����Ʈ �޼ҵ�
		public ArrayList<Bbs> getList(int pageNumber) throws Exception {
			String sql = "select * from (select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc) where rownum <= 10";
			
			System.out.println(sql); 
			System.out.println(pageNumber);
			
			ArrayList<Bbs> list = new ArrayList<Bbs>();
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					
					Bbs bbs = new Bbs();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					
					list.add(bbs);
				}
				
				
			}catch (SQLException e) {
				e.printStackTrace();
				System.out.println("����Ʈ ����");
			}finally {
				//close();
			}
			return list;
		}
		
		//����¡ ó�� �޼ҵ�
		public boolean nextPage(int pageNumber) {
			String sql = "select * from bbs where bbsID < ? and bbsAvailable = 1";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = psmt.executeQuery();
				if(rs.next()) {
					return true;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				//close();
			}
			return false;
		}
		public Bbs getBbs(int bbsID)throws Exception {
	        String sql="";
	        try {
	            sql="SELECT * FROM BBS WHERE bbsID = ? AND bbsAvailable = 1";
	            psmt = con.prepareStatement(sql);
	            psmt.setInt(1, bbsID);
	            rs = psmt.executeQuery();
	            while (rs.next()) {
	                Bbs bbs = new Bbs();
	                bbs.setBbsID(rs.getInt(1));
	                bbs.setBbsTitle(rs.getString(2));
	                bbs.setUserID(rs.getString(3));
	                bbs.setBbsDate(rs.getString(4));
	                bbs.setBbsContent(rs.getString(5));
	                bbs.setBbsAvailable(rs.getInt(6));
	                return bbs;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
	           // close();
	        }
	        return null; 
	    }


	    //�� �������
	    public int update(int bbsID, String bbsTitle, String bbsContent)throws Exception {
	        String sql="";
	        try {
	            sql="UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
	            psmt = con.prepareStatement(sql);
	            psmt.setString(1, bbsTitle);
	            psmt.setString(2, bbsContent);
	            psmt.setInt(3, bbsID);
	            return psmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
	        	//close();
	        }
	        return -1; 
	    }

	    //�ۻ��� ���
	    public int delete(int bbsID)throws Exception {
	        String sql="";
	        try {
	            sql="UPDATE BBS SET bbsAvailable = 0 WHERE bbsID = ?";
	            psmt = con.prepareStatement(sql);
	            psmt.setInt(1, bbsID);
	            return psmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
	           //close();
	        }
	        return -1;
	    }
}
