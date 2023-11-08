package study2.ajax1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import study2.login.LoginDAO;
import study2.login.LoginVO;

@SuppressWarnings("serial")
@WebServlet("/ajaxTest4")
public class AjaxTest4 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginSearch(mid);
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("mid", vo.getMid());
		map.put("name", vo.getName());
		map.put("point", vo.getPoint()+"");
		map.put("todayCount", vo.getTodayCount()+"");		
		System.out.println("map : " + map); 	// {name=__, mid=__} 이런 식으로 나옴
		
		//자료를 JSON 형식으로 변경 (라이브러리 주소 : https://code.google.com/archive/p/json-simple/downloads )
		JSONObject jObj = new JSONObject(map);
		System.out.println("jObj : " + jObj); // {name:__, mid:__} 이런 식으로 나옴
		
		//JSON 객체를 문자열로 변경
		String str = jObj.toJSONString();
		System.out.println("str : " + str);
		
		response.getWriter().write(str);
	}
}
