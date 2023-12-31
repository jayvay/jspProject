package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
/* @WebServlet("/mapping/Test5.do") */
 @WebServlet("*.do") 
public class Test5Controller extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("이곳은 서블릿 : 확장자 do 입니다.");
		
		String uri = request.getRequestURI();
		
		//System.out.println("uri : " + uri);
		
		String comm = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		System.out.println("comm : " + comm);
		
		String viewPage = "/WEB-INF/study2/mapping";
		
		if(comm.equals("/test5")) {
			viewPage += "/test5.jsp";
		}
		else if(comm.equals("/test5_2")) {
			viewPage += "/test5_2.jsp";
		}
		else if(comm.equals("/test5_3")) {
			viewPage += "/test5_3.jsp";
		}
		else if(comm.equals("/test5_4")) {
			int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
			String op = request.getParameter("op")==null ? "+" : request.getParameter("op");
			int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
			
			Test5Service t5 = new Test5Service();
			
			int res = t5.calc(su1, op, su2);
			
			request.setAttribute("su1", su1);
			request.setAttribute("op", op);
			request.setAttribute("su2", su2);
			request.setAttribute("res", res);
			
			viewPage += "/test5.jsp";
		}
		else if(comm.equals("/test5_5")) {
			int dan = (request.getParameter("dan")==null || request.getParameter("dan").equals("")) ? 1 : Integer.parseInt(request.getParameter("dan"));
			
			Test5_5Service t5_5Service = new Test5_5Service();
			String str = t5_5Service.gugudan(dan);
			
			request.setAttribute("str", str);
			
			viewPage += "/test5_5.jsp";
		}
				
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
