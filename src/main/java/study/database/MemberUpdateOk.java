package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/memberUpdateOk")
public class MemberUpdateOk extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		//비밀번호 체크하기
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid, pwd);
				
		PrintWriter out = response.getWriter();
		if(vo.getMid() == null) {
			out.print("<script>");
			out.print("alert('비밀번호가 틀렸습니다. 비밀번호를 다시 확인하세요.');");
			out.print("location.href='"+request.getContextPath()+"/study/database/memberUpdate.jsp';");
			out.print("</script>");
			return;
		}
		
		vo = new LoginVO();
		vo.setMid(mid);
//		vo.setPwd(pwd);
		vo.setName(name);
		
		int res = dao.setUpdateOk(vo);
		
		if(res != 0) {
			HttpSession session = request.getSession();
			session.setAttribute("sName", name);
			out.print("<script>");
			out.print("alert('" + mid + "님 정보가 수정 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/database/memberMain.jsp';");
			out.print("</script>");
		}
		else {
			out.print("<script>");
			out.print("alert('정보 수정 실패');");
			out.print("location.href='"+request.getContextPath()+"/study/database/memberMain.jsp';");
			out.print("</script>");
		}
	}
}
