package study.j1101;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1101/ex5NameOk")
public class Ex5NameOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		System.out.println(name);
		
		ArrayList<Jstl4VO> vos = new ArrayList<>();
		
		Jstl4VO vo = new Jstl4VO();
		vo.setName("홍길동");
		vo.setAge(25);
		vo.setGender("남자");
		vo.setJob("학생");
		vo.setAddress("한양");
		vos.add(vo);
		
		vo = new Jstl4VO();
		vo.setName("봉미선");
		vo.setAge(29);
		vo.setGender("여자");
		vo.setJob("주부");
		vo.setAddress("서울");
		vos.add(vo);
		
		vo = new Jstl4VO();
		vo.setName("고윤정");
		vo.setAge(28);
		vo.setGender("여자");
		vo.setJob("배우");
		vo.setAddress("서울");
		vos.add(vo);
		
		vo = new Jstl4VO();
		vo.setName("이기자");
		vo.setAge(30);
		vo.setGender("남자");
		vo.setJob("기자");
		vo.setAddress("부산");
		vos.add(vo);
		
		vo = new Jstl4VO();
		vo.setName("신형만");
		vo.setAge(32);
		vo.setGender("남자");
		vo.setJob("샐러리맨");
		vo.setAddress("서울");
		vos.add(vo);
		
		
		for(int i=0; i<vos.size(); i++) {
			if(vos.get(i).getName().equals(name)) {
				request.setAttribute("vos", vos.get(i));
//				System.out.println(vos.get(i));
//				String flag = "name";
//				request.setAttribute("flag", flag);
				
				String viewPage = "/study/1101_JSTL/ex_jstl_tableRes.jsp?flag=name";
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
			else {
				PrintWriter out = response.getWriter();
				
				out.print("<script>");
				out.print("alert('존재하지 않는 회원입니다.');");
				out.print("location.href='" + request.getContextPath() + "/study/1101_JSTL/ex_jstl_table.jsp';");
				out.print("</script>");
			}
		}
	}
}
