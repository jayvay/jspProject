package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/GuestList")
public class GuestList extends HttpServlet {
	@Override
	public void init() {
		// 비교후 회원이 아니면 돌려보내기...
		//System.out.println("통과합니다.");
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("service....");
		GuestDAO dao = new GuestDAO();
		
		//1. 현재 페이지 번호를 구한다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		//2. 한 페이지의 분량을 정한다.
		int pageSize = request.getParameter("pageSize")==null ? 1 : Integer.parseInt(request.getParameter("pageSize"));

		//3. 총 레코드 건 수를 구한다.(sql 명령어 중 count함수 사용)
		int totRecCnt = dao.getTotRecCnt();
		
		//4. 총 페이지 건 수를 구한다.
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		
		//5. 현재 페이지에 출력할 '시작 인덱스 번호'를 구한다.
		int startIndexNo = (pag - 1) * pageSize;
		
		//6. 현재 화면에 표시될 시작 번호를 구한다.
		int curScrStartNo = totRecCnt - startIndexNo;
		
		
		//블록페이징 처리 (시작블록의 번호를 0번으로 처리했다)
		//1. 블록의 크기 결정 (여기선 3으로 해보자)
		int blockSize = 3;
		
		//2. 현재 페이지가 속한 블록 번호를 구한다. (예:총 레코드 개수가 38개일 때 1,2,3페이지는 0블록/ 4,5,6페이지는 1블록
		int curBlock = (pag - 1) / blockSize;
		
		//3. 마지막 블록을 구한다.
		int lastBlock = (totPage - 1) / blockSize;
		
		//지정된 페이지의 자료를 요청한 한 페이지의 분량만큼 가져온다.
		
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
		String viewPage = "/guest/guestList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
