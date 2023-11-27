package webMessage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WmInputOkCommand implements WmInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sendId = request.getParameter("sendId")==null ? "" : request.getParameter("sendId");
		String receiveId = request.getParameter("receiveId")==null ? "" : request.getParameter("receiveId");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		WmVO vo = new WmVO();
		vo.setSendId(sendId);
		vo.setReceiveId(receiveId);
		vo.setTitle(title);
		vo.setContent(content);
		
		WmDAO dao = new WmDAO();
		int res = dao.setWmInputOk(vo);

		if(res == 1) {
			request.setAttribute("msg", "메세지를 전송하였습니다");
			request.setAttribute("url", "webMessage.wm?mSw=1");
		}
		else {
			request.setAttribute("msg", "메세지 전송 실패");
			request.setAttribute("url", "webMessage.wm?mSw=0");
		}
	}

}
