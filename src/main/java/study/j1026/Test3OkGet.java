package study.j1026;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Test3OkGet")	//경로
public class Test3OkGet extends HttpServlet {
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name"); //test3.jsp에 있는 form태그 안에 name
		int age = Integer.parseInt(request.getParameter("age"));
		String flag = request.getParameter("flag");
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("flag : " + flag);
		
		PrintWriter out = response.getWriter();
		out.print("<p>성명 : " + name + "</p>");
		out.print("<p>나이 : " + age + "</p>");
		out.print("<p>flag : " + flag + "</p>");
//		out.print("<p><a href='/javaProject/study/1026/test3.jsp'>돌아가기</a></p>");
		out.print("<p><a href='" + request.getContextPath() + "/study/1026/test3.jsp'>돌아가기</a></p>");
//		out.print("<p><a href='" + request.getContextPath() + "/Test2'>돌아가기</a></p>");
	}
}
