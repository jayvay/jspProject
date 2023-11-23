package study2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Array;

import study2.apiTest.ApiDAO;
import study2.apiTest.ApiVO;

public class PoliceCheckCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String police = request.getParameter("police")==null ? "" : request.getParameter("police");
		
		ApiDAO dao = new ApiDAO();
		
		ArrayList<ApiVO> vos = dao.getPoliceCheck(police);
		
		ApiVO analyzeVo = dao.getAnalyzePolice(police);

		request.setAttribute("vos", vos);		
		request.setAttribute("analyzeVo", analyzeVo);		
		request.setAttribute("police", police);		
	}
}
