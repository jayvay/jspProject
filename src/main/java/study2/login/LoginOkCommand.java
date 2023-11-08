package study2.login;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		
		if(vo.getName() != null) {
			// 회원 인증 성공....
			// 1.자주 사용하는 변수(객체)를 세션에 저장(아이디,성명, 닉네임), 2.쿠키에 아이디 저장 또는 제거,
			// 3.DB에 처리할 내용들(최종방문일, 포인트누적, 오늘 방문일 수 누적...)
			
			// 방문 포인트 처리하기?(최종접속일/방문 카운트도 함께 업데이트 처리)
			// 하루의 방문 포인트는 매번 10포인트씩 주기로 한다. 단, 하루에 최대 50포인트까지만 줌.
			
			// 날짜 비교
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strToday = sdf.format(today);
			
			if(strToday.equals(vo.getLastDate().substring(0,10))) {
				// 오늘 다시 방문한 경우
				vo.setTodayCount(vo.getTodayCount()+1);
				if(vo.getTodayCount() <= 5) vo.setPoint(vo.getPoint()+10);
			}
			else {
				// 오늘 처음 방문한 경우
				vo.setTodayCount(1);
				vo.setPoint(vo.getPoint()+10);
			}
			
			// 3.DB작업(변경된 내용들을 DB에 저장(갱신))
			dao.setLoginUpdate(vo);
			
			// 1.세션처리
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("sTodayCount", vo.getTodayCount());
			
			// 2.쿠키저장
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
			
			// 메세지 처리
			request.setAttribute("msg", vo.getName()+"님 로그인 되었습니다.");
			request.setAttribute("url", "memberMain.lo");
		}
		else {
			request.setAttribute("msg", "로그인 실패~~~");
			request.setAttribute("url", "login.lo");
		}
	}

}
