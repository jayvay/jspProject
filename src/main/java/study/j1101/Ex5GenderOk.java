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

@WebServlet("/j1101/ex5GenderOk")
public class Ex5GenderOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		System.out.println(gender);
		
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
			if(vos.get(i).getGender().equals(gender)) {
				request.setAttribute("vos", vos.get(i));
				System.out.println(vos.get(i));
			}
		}
		String flag = "gender";
		request.setAttribute("flag", flag);
		String viewPage = "/study/1101_JSTL/ex_jstl_tableRes.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
