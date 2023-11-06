package guest;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GuestDelete")
public class GuestDelete extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		GuestDAO dao = new GuestDAO();
		
		int res = dao.setGuestDelete(idx);
		
		if(res != 0) {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('해당 방명록이 삭제되었습니다.');");
			out.print("location.href='" + request.getContextPath() + "/GuestList';");
			out.print("</script>");
 		}
		else {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('방명록 삭제 실패! 다시 시도하세요.');");
			out.print("location.href='" + request.getContextPath() + "/GuestList';");
			out.print("</script>");
		}
	}
}
