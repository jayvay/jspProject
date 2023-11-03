package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/deleteOk")
public class DeleteOk extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		LoginDAO dao = new LoginDAO();
		
		int res = dao.setDeleteOk(mid);
		
		PrintWriter out = response.getWriter();
		if(res != 0) {
			session.invalidate();
			dao.connClose();
			out.print("<script>");
			out.print("alert('" + mid + "님 탈퇴 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('탈퇴 실패');");
			out.print("location.href='"+request.getContextPath()+"/study/database/memberMain.jsp';");
			out.print("</script>");
		}
	}
}
