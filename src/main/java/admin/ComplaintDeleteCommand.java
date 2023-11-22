package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

public class ComplaintDeleteCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		dao.setBoardDelete(idx);

		System.out.println("idx : " + idx);
		request.setAttribute("msg", "신고글이 삭제되었습니다.");
		request.setAttribute("url", "adminComplaintList.ad");
		
	}
}
