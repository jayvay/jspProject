package study.j1030;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1030/LoginOk3")
public class LoginOk3 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String mSw = "";
		
		//DB에 가서 회원 인증 처리 한다. (이곳에서는 아이디는 admin, 비밀번호는 1234 로 체크한다)
		if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
			mSw = "Ok";
		}
		else {
			mSw = "No";
		}
		
		response.sendRedirect(request.getContextPath()+"/study/1030/main3.jsp?mid="+mid+"&mSw="+mSw+"&nickName="+nickName);
	}

}
