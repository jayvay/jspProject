package webMessage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WmDeleteCheckCommand implements WmInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int mSw = request.getParameter("mSw")==null ? 0 : Integer.parseInt(request.getParameter("mSw"));	

		WmDAO dao = new WmDAO();
		
		int res = dao.setWmDeleteCheck(idx, mSw);
		
		if(res == 1) {
			request.setAttribute("msg", "메세지가 휴지통으로 이동되었습니다.");
		}
		else {
			request.setAttribute("msg", "메세지 삭제 실패");
		}
		request.setAttribute("url", "webMessage.wm?mSw=1");
	}

}
