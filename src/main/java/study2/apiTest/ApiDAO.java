package study2.apiTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.ComplaintVO;
import admin.review.ReviewVO;
import common.GetConn;

public class ApiDAO {

	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
  ApiVO vo = null;
	
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

	//
	public int setCrimeInput(ApiVO vo) {
		int res = 0;
		try {
			sql = "insert into crime values (default, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getYear());
			pstmt.setString(2, vo.getPolice());
			pstmt.setInt(3, vo.getRobbery());
			pstmt.setInt(4, vo.getMurder());
			pstmt.setInt(5, vo.getTheft());
			pstmt.setInt(6, vo.getViolence());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	public int setSearchYear(int year) {
		int res = 0;
		try {
			sql = "select * from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			if(rs.next()) res = 1;
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	public String setCrimeDeleteOk(int year) {
		String str = "삭제 실패";
		try {
			sql = "delete from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.executeUpdate();
			str = "1";
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return str;
	}

	//전체 범죄 자료 리스트
	public ArrayList<ApiVO> getCrimeList(int year) {
		ArrayList<ApiVO> vos = new ArrayList<ApiVO>();
		try {
			sql = "select * from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ApiVO vo = new ApiVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setYear(rs.getInt("year"));
				vo.setPolice(rs.getString("police"));
				vo.setRobbery(rs.getInt("robbery"));
				vo.setMurder(rs.getInt("murder"));
				vo.setTheft(rs.getInt("theft"));
				vo.setViolence(rs.getInt("violence"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	//자료 분석(총점/평균) 해서 출력하기
	public ApiVO getCrimeAnalyze(int year) {
		ApiVO vo = new ApiVO();
		try {
			sql = "select year,sum(robbery) as totRobbery,sum(murder) as totMurder,sum(theft) as totTheft,sum(violence) as totViolence, "
					+ "avg(robbery) as avgRobbery,avg(murder) as avgMurder,avg(theft) as avgTheft,avg(violence) as avgViolence "
					+ "from crime where year = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setYear(rs.getInt("year"));
				vo.setTotRobbery(rs.getInt("totRobbery"));
				vo.setTotMurder(rs.getInt("totMurder"));
				vo.setTotTheft(rs.getInt("totTheft"));
				vo.setTotViolence(rs.getInt("totViolence"));
				vo.setAvgRobbery(rs.getInt("avgRobbery"));
				vo.setAvgMurder(rs.getInt("avgMurder"));
				vo.setAvgTheft(rs.getInt("avgTheft"));
				vo.setAvgViolence(rs.getInt("avgViolence"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	//경찰서 이름 검색처리
	public ArrayList<ApiVO> getPoliceCheck(String police) {
		ArrayList<ApiVO> vos = new ArrayList<ApiVO>();
		try {
			sql = "select * from crime where police like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+police+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ApiVO vo = new ApiVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setYear(rs.getInt("year"));
				vo.setPolice(rs.getString("police"));
				vo.setRobbery(rs.getInt("robbery"));
				vo.setMurder(rs.getInt("murder"));
				vo.setTheft(rs.getInt("theft"));
				vo.setViolence(rs.getInt("violence"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	//경찰서별 통계처리
	public ApiVO getAnalyzePolice(String police) {
		ApiVO vo = new ApiVO();
		try {
			sql = "select year,sum(robbery) as totRobbery,sum(murder) as totMurder,sum(theft) as totTheft,sum(violence) as totViolence, "
					+ "avg(robbery) as avgRobbery,avg(murder) as avgMurder,avg(theft) as avgTheft,avg(violence) as avgViolence "
					+ "from crime where police like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+police+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setYear(rs.getInt("year"));
				vo.setTotRobbery(rs.getInt("totRobbery"));
				vo.setTotMurder(rs.getInt("totMurder"));
				vo.setTotTheft(rs.getInt("totTheft"));
				vo.setTotViolence(rs.getInt("totViolence"));
				vo.setAvgRobbery(rs.getInt("avgRobbery"));
				vo.setAvgMurder(rs.getInt("avgMurder"));
				vo.setAvgTheft(rs.getInt("avgTheft"));
				vo.setAvgViolence(rs.getInt("avgViolence"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	//통합검색
	public ArrayList<ApiVO> getYearPoliceCheck(int year, String police, String yearOrder) {
		ArrayList<ApiVO> vos = new ArrayList<ApiVO>();
		try {
			sql = "select * from crime where year=? and police like ? " + yearOrder;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.setString(2, "%"+police+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ApiVO vo = new ApiVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setYear(rs.getInt("year"));
				vo.setPolice(rs.getString("police"));
				vo.setRobbery(rs.getInt("robbery"));
				vo.setMurder(rs.getInt("murder"));
				vo.setTheft(rs.getInt("theft"));
				vo.setViolence(rs.getInt("violence"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	public ApiVO getAnalyzeTotal(int year, String police, String yearOrder) {
		ApiVO vo = new ApiVO();
		try {
			sql = "select year,sum(robbery) as totRobbery,sum(murder) as totMurder,sum(theft) as totTheft,sum(violence) as totViolence, "
					+ "avg(robbery) as avgRobbery,avg(murder) as avgMurder,avg(theft) as avgTheft,avg(violence) as avgViolence "
					+ "from crime where year=? and police like ? " + yearOrder;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.setString(2, "%"+police+"%");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setYear(rs.getInt("year"));
				vo.setTotRobbery(rs.getInt("totRobbery"));
				vo.setTotMurder(rs.getInt("totMurder"));
				vo.setTotTheft(rs.getInt("totTheft"));
				vo.setTotViolence(rs.getInt("totViolence"));
				vo.setAvgRobbery(rs.getInt("avgRobbery"));
				vo.setAvgMurder(rs.getInt("avgMurder"));
				vo.setAvgTheft(rs.getInt("avgTheft"));
				vo.setAvgViolence(rs.getInt("avgViolence"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	
	
}