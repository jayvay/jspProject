package study.j1026;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1026/Test5")
public class Test5 extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String flag = request.getParameter("flag");
		
		System.out.println("name : " + name);
		System.out.println("age : " + age);
		System.out.println("flag : " + flag);
	}

//	doGet이나 doPost보다 service 메소드가 우선된다	
//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		
//		System.out.println("이곳은 doGet");
//	}
//	
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		
//		System.out.println("이곳은 doPost");
//	}
}
