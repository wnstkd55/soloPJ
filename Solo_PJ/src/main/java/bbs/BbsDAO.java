package bbs;

import java.util.ArrayList;

import common.DBConnPool;

public class BbsDAO extends DBConnPool{
	
	public String getDate() {
		String sql = "select now()";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	//게시글 번호 부여 메소드
		public int getNext() {
			//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
			String sql = "select bbsID from bbs order by bbsID desc";
			try {
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; //첫 번째 게시물인 경우
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("글번호 오류");
			}
			return -1; //데이터베이스 오류
		}
		
		//글쓰기 메소드
		public int write(String bbsTitle, String userID, String bbsContent) {
			String sql = "insert into bbs values(?, ?, ?, ?, ?, ?)";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, getNext());
				psmt.setString(2, bbsTitle);
				psmt.setString(3, userID);
				psmt.setString(4, getDate());
				psmt.setString(5, bbsContent);
				psmt.setInt(6, 1); //글의 유효번호
				return psmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("글쓰기 오류");
			}
			return -1; //데이터베이스 오류
		}
		//게시글 리스트 메소드
		public ArrayList<Bbs> getList(int pageNumber){
			String sql = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
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
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("리스트 오류");
			}
			return list;
		}
		
		//페이징 처리 메소드
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
			}
			return false;
		}
}
