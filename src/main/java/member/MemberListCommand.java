package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;

public class MemberListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberLv = request.getParameter("memberLv")==null ? 4 : Integer.parseInt(request.getParameter("memberLv"));
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		if(memberLv != 4) {
			ArrayList<MemberVO> vos = dao.getMemberLvSearch(memberLv);
			request.setAttribute("vos", vos );
		}
		else {
			ArrayList<MemberVO> vos = dao.getMemberList();
			request.setAttribute("vos", vos );
		}
		
		request.setAttribute("memberLv", memberLv);
	}

}
