package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

public class ComplaintInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		int partIdx = request.getParameter("partIdx")==null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String cpMid = request.getParameter("cpMid")==null ? "" : request.getParameter("cpMid");
		String cpContent = request.getParameter("cpContent")==null ? "" : request.getParameter("cpContent");
		String cpContentEtc = request.getParameter("cpContentEtc")==null ? "" : request.getParameter("cpContentEtc");
		System.out.println("cpContentEtc : " + cpContentEtc);
		
		ComplaintVO vo = new ComplaintVO();
		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setCpMid(cpMid);
		vo.setCpContent(cpContent + " : " + cpContentEtc);
		
		BoardDAO dao = new BoardDAO();
		
		dao.setComplaintInputOk(vo);

	}

}
