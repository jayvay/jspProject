package pds;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class PdsDeleteOkCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String fSName_ = request.getParameter("fSName")==null ? "" : request.getParameter("fSName");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		//여러 개의 파일일 때 '/' 기준으로 분리 
		String[] fSNames = fSName_.split("/");
		
		//암호화된 비밀번호와 일치하는지 체크
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		PdsDAO dao = new PdsDAO();
		
		PdsVO vo = dao.getPdsIdxSearch(idx);
		
		String res = "0";
		if(vo.getPwd().equals(pwd)) {
			//1. 서버에 존재하는 파일 삭제
			String realPath = request.getServletContext().getRealPath("/images/pds/");
					
			for(String fSName : fSNames) {
				new File(realPath + fSName).delete();
			}
			//2. DB에서 제거
			res = dao.setPdsDeleteOk(idx);
		}
		response.getWriter().write(res);
	}

}
