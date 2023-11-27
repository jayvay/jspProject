package webMessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.ComplaintVO;
import admin.review.ReviewVO;
import common.GetConn;

public class WmDAO {

	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
  WmVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
		}
	}

	
	//메세지 리스트(전체 메세지(받은 메세지/새 메세지/보낸 메세지/휴지통)
	public ArrayList<WmVO> getMessageList(String mid, int mSw) {
		ArrayList<WmVO> vos = new ArrayList<WmVO>();
		try {
			if(mSw == 1) {	//받은 메세지 (전체 메세지 - 안 읽은 메세지, 읽은 메세지 모두)
				sql = "select *, timestampdiff(hour,receiveDate, now()) as hour_diff from webMessage where receiveId = ? and (receiveSw = 'n' or receiveSw = 'r') order by idx desc";
			}
			else if(mSw == 2) {	//새 메세지
				sql = "select *, timestampdiff(hour,receiveDate, now()) as hour_diff from webMessage where receiveId = ? and receiveSw = 'n' order by idx desc";
			}
			else if(mSw == 3) {	//보낸 메세지
				sql = "select *, timestampdiff(hour,receiveDate, now()) as hour_diff from webMessage where sendId = ? and sendSw = 's' order by idx desc";
			}
			else if(mSw == 4) {	//수신확인
				sql = "select *, timestampdiff(hour,receiveDate, now()) as hour_diff from webMessage where sendId = ? and receiveSw = 'n' order by idx desc";
			}
			else if(mSw == 5) {	//휴지통
				sql = "select *, timestampdiff(hour,receiveDate, now()) as hour_diff from webMessage where (receiveId=? and receiveSw='g') or (sendId=? and sendSw='g') order by idx desc";
			}
			else {	//메세지 작성(mSw == 0)
				return vos;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			if(mSw == 5) {
				pstmt.setString(2, mid);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WmVO vo = new WmVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setSendId(rs.getString("sendId"));
				vo.setSendSw(rs.getString("sendSw"));
				vo.setSendDate(rs.getString("sendDate"));
				vo.setReceiveId(rs.getString("receiveId"));
				vo.setReceiveSw(rs.getString("receiveSw"));
				vo.setReceiveDate(rs.getString("receiveDate"));
				vo.setHour_diff(rs.getInt("hour_diff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	//메세지 작성
	public int setWmInputOk(WmVO vo) {
		int res = 0;
		try {
			sql = "insert into webMessage values (default, ?,?,?, 's', default, ?, 'n', default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getSendId());
			pstmt.setString(4, vo.getReceiveId());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	//메세지 내용 보기
	public WmVO getWmContent(int idx, int mFlag) {
		WmVO vo = new WmVO();
		try {
			if(mFlag != 55) {	
				sql = "update webMessage set receiveSw = 'r', receiveDate = now() where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.executeUpdate();
				pstmtClose();
			}
			sql = "select * from webMessage where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo = new WmVO();
			vo.setIdx(rs.getInt("idx"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setSendId(rs.getString("sendId"));
			vo.setSendSw(rs.getString("sendSw"));
			vo.setSendDate(rs.getString("sendDate"));
			vo.setReceiveId(rs.getString("receiveId"));
			vo.setReceiveSw(rs.getString("receiveSw"));
			vo.setReceiveDate(rs.getString("receiveDate"));
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	//삭제하면 휴지통으로 보내기
	public int setWmDeleteCheck(int idx, int mSw) {
		int res = 0;
		try {
			if(mSw == 11) {
				sql = "update webMessage set receiveSw = 'g' where idx = ?";
			}
			else {
				sql = "update webMessage set sendSw = 'x' where idx = ?";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
	//휴지통에 들어 있는 자료 삭제 (receiveSw와 sendSw가 모두 'x'일 때)
	public int setWmDeleteAll(String mid) {
		int res = 0;
		try {
			sql = "update webMessage set receiveSw = 'x' where receiveId = ? and receiveSw = 'g'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "update webMessage set sendSw = 'x' where sendId = ? and sendSw = 'g'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete from webMessage where sendSw = 'x' and receiveSw = 'x'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}



	
}