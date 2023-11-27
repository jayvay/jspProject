package webMessage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WmDeleteOneCommand implements WmInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int mSw = request.getParameter("mSw")==null ? 0 : Integer.parseInt(request.getParameter("mSw"));
		
		WmDAO dao = new WmDAO();
		int res = dao.setWmDeleteCheck(idx, mSw);

		response.getWriter().write(res + "");
	}

}
