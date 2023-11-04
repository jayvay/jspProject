package guest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/GuestInput")
public class GuestInput extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String visitDate = request.getParameter("visitDate")==null ? "" : request.getParameter("visitDate");
		String hostIp = request.getRemoteAddr();
		
		GuestVO vo = new GuestVO();
		vo.setName(name);
		vo.setContent(content);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setHostIp(hostIp);
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.getGuestInput(vo);
		
		if(res != 0) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('방명록 등록 성공! 다시 시도하세요.');");
			out.print("location.href='" + request.getContextPath() + "/GuestList';");
			out.print("</script>");
 		}
		else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('방명록 등록 실패! 다시 시도하세요.');");
			out.print("location.href='" + request.getContextPath() + "/guest/guestInput.jsp';");
			out.print("</script>");
		}
	}
}
