package study.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/loginOk")
public class LoginOk extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName() != null) {
			// 회원 인증 성공
			/* 1.자주 사용하는 변수나 객체를 세션에 저장한다.(아이디, 성명, 닉네임) 
			   2.쿠키에 아이디 저장 또는 제거 
				 3.DB에 처리할 내용들(최종 방문일, 포인트 누적, 오늘 방문일 수 누적) 
			*/
			
			//1.세션처리
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint());
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("sTodayCount", vo.getTodayCount());
			
			//2.쿠키저장
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
			
			//숙제 : 방문포인트 처리하기(최종접속일/방문카운트도 함께 업데이트 처리)
			//하루의 방문포인트는 매번 10p 씩 주기로 한다. 단, 최대 50포인트까지만 인정한다.
			
			//3.DB작업
			String lastDate = LocalDateTime.now().toString().substring(0,16);
			//하루 방문 카운트 업데이트
//			if(vo.getLastDate() < lastDate)
//				vo.setTodayCount();

			//최종접속일 업데이트
//			vo.setLastDate(LastDate);
			
			//하루 방문 포인트 업데이트
			int point = vo.getPoint();
			if(vo.getTodayCount()<=5) {
				point += 10;
				vo.setPoint(point);
			}
//			dao.pointPlus(vo);
			
			
			//정상 로그인 체크 이후에 모든 처리가 끝나면 정상 처리 메세지 출력 후 memberMain.jsp로 보낸다.
			out.print("<script>");
			out.print("alert('" + mid + "님, 로그인 되었습니다.');");
			out.print("location.href='" + request.getContextPath() + "/study/database/memberMain.jsp';");
			out.print("</script>");
		}
		else { 
			//회원 인증 실패시 다시 로그인 창으로 보낸다.
			out.print("<script>");
			out.print("alert('존재하지 않는 회원입니다.');");
			out.print("location.href='" + request.getContextPath() + "/study/database/login.jsp';");
			out.print("</script>");
		}
	}
}
