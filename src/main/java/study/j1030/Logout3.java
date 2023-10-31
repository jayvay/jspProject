package study.j1030;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1030/logout3")
public class Logout3 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("mid");
		
		// mid회원에 대한 세션/DB처리할 내용들을 모두 처리한 후 로그아웃 되었다는 메세지를 띄울 수 있도록 한다.
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('"+mid+" 님이 로그아웃 하셨습니다.')");
		out.println("location.href= '"+request.getContextPath()+"/study/1030/login3.jsp';");
		out.println("</script>");
	}
}
