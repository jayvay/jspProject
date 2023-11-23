package study2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.apiTest.ApiDAO;
import study2.apiTest.ApiVO;

public class YearPoliceCheckCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int year = request.getParameter("year")==null ? 0 : Integer.parseInt(request.getParameter("year"));
		String police = request.getParameter("police")==null ? "" : request.getParameter("police");
		String yearOrder = request.getParameter("yearOrder")==null ? "" : request.getParameter("yearOrder");
		
		if(yearOrder.equals("d")) yearOrder = "order by police desc";
		else if(yearOrder.equals("a")) yearOrder = "order by police";
		
		ApiDAO dao = new ApiDAO();
		
		ArrayList<ApiVO> vos = dao.getYearPoliceCheck(year, police, yearOrder);
		System.out.println("vos : " + vos);
		
		ApiVO analyzeVo = dao.getAnalyzeTotal(year, police, yearOrder);
		
		request.setAttribute("vos", vos);
		request.setAttribute("year", year);
		request.setAttribute("police", police);
		request.setAttribute("analyzeVo", analyzeVo);
	}

}
