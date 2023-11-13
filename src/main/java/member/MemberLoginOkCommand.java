package member;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;
import study2.ajax3.LoginDAO;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();

		MemberVO vo = dao.getMemberMidCheck(mid);
		if(vo.getMid() == null || vo.getUserDel().equals("OK") || !vo.getMid().equals(mid)) {
			request.setAttribute("msg", "아이디를 확인하세요");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("msg", "비밀번호를 확인하세요");
			request.setAttribute("url", "memberLogin.mem");
			return;
		}
		
		if(vo.getMid() != null) {
			//로그인 성공하면 1.세션저장 2.쿠키저장 3.방문횟수(오늘방문횟수,총방문횟수)업데이트 4.포인트 업데이트 -숙제~
			//방문횟수 업데이트
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strToday = sdf.format(today);
			System.out.println(strToday);
			
			//오늘과 최종방문일이 같으면 방문횟수 증가
			if(strToday.equals(vo.getLastDate().substring(0,10))) {
				vo.setTodayCnt(vo.getTodayCnt()+1);
				if(vo.getTodayCnt() <= 5) {
					vo.setPoint(vo.getPoint()+10);
				}
			}
			else {
			//오늘과 최종방문일이 다르면 다른 날이므로 방문횟수 1
				vo.setTodayCnt(1);
				vo.setPoint(vo.getPoint()+10);
			}
			
			//접속할 때마다 총 방문 횟수 증가
			vo.setVisitCnt(vo.getVisitCnt()+1);
			
			//Date date = sdf.parse(vo.getStartDate().substring(0,10));
//			Calendar calendar = Calendar.getInstance();
//			calendar.setTime(date);
//			calendar.add(Calendar.DATE, 10);
//			String strDate = sdf.format(date);
			
			//가입 후 10일 경과 후 5번 초과 방문하면 정회원 등업
			
			try {
				//Date date1 = sdf.parse(strToday);
				Date date2 = sdf.parse(vo.getStartDate());
				long dRes = (today.getTime()- date2.getTime()) / (1000 * 60 * 60 * 24); 
				System.out.println("가입후 지난 날짜 : " + dRes);
				if(vo.getLevel()==1 && dRes <= 10 && vo.getVisitCnt() >= 5) vo.setLevel(2); 
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			if(vo.getLevel()==1 && vo.getVisitCnt() >= 5) vo.setLevel(2);
			
			//세션 저장
			String sStrLevel = "";
			if(vo.getLevel() == 0) sStrLevel = "관리자";
			else if(vo.getLevel() == 1) sStrLevel = "준회원";
			else if(vo.getLevel() == 2) sStrLevel = "정회원";
			else if(vo.getLevel() == 3) sStrLevel = "우수회원";
			
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("sStrLevel", sStrLevel);
			
			//쿠키 저장
			String idSave = request.getParameter("idSave")==null ? "off" : "on";
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);
			}
			else {
				cookieMid.setMaxAge(0);
			}
			response.addCookie(cookieMid);
			
			int res = dao.setMemberLoginUpdate(vo);
			
			if(res != 0) {
			//메세지 출력 후 회원 메인창으로 보낸다.
				request.setAttribute("msg", mid + "님 로그인 되었습니다.");
				request.setAttribute("url", "memberMain.mem");
			}
		}
		else {
			request.setAttribute("msg", "로그인 실패");
			request.setAttribute("url", "memberLogin.mem");
		}
	}
}
