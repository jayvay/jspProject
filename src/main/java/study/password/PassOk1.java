package study.password;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

@WebServlet("/password/passOk1")
public class PassOk1 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		System.out.println("- 원본 자료 -");
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		System.out.println("idx : " + idx);
		
		if(idx == 1) {
			//숫자만을 암호화 하는 경우
			//암호화를 위한 암호화 키 (0x1234ABCD)
			int key = 0x1234ABCD;
			
			int encPwd, decPwd;
			
			//암호화 (EOR(배타적(exclusive)OR)암호화) => 이진수 EOR : ^
			encPwd = Integer.parseInt(pwd) ^ key;
			
			System.out.println("- 암호화된 비밀번호 -");
			System.out.println("mid : " + mid);
			System.out.println("encPwd : " + encPwd);
			
			//복호화 (
			decPwd = encPwd ^ key;
			
			System.out.println("- 복호화된 비밀번호 -");
			System.out.println("mid : " + mid);
			System.out.println("decPwd : " + decPwd);
			
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('원본 비번 : " + pwd + " \\n암호화된 비번 : " + encPwd + "');");
			out.print("location.href='" + request.getContextPath() + "/study/password/passForm.jsp';");
			out.print("</script>");
		}
		else if(idx == 2) {
			System.out.println();
			//영문자(대/소문자),숫자 혼합 (아스키코드 2자리로 변환 후 암호화 처리하세요 : 영문소문자로 입력시 대문자로 변경해서 처리)
			long intPwd;
			String strPwd = "";
			System.out.println("1.원본 비밀번호 :(예.ABCD)" + pwd);
			
			for(int i=0; i<pwd.length(); i++) {
				intPwd = pwd.charAt(i);
				strPwd += intPwd;
			}
			System.out.println("2.아스키(ASCII)코드문자로 변환된 비밀번호 :(예.65666768)" + strPwd);
			
			intPwd = Long.parseLong(strPwd);
			
			long encPwd, key = 0x1234ABCD; //key는 마음대로 줘
			
			encPwd = intPwd ^ key;
			strPwd = String.valueOf(encPwd);
			System.out.println("3.암호화된 비밀번호 : " + encPwd);
			
			//암호화된 비번과 암호화키를 DB에 저장시켜 놓는다.
			
			//DB에 저장된 암호를 다시 불러와서 복호화(디코딩) 시켜준다.
			long decPwd;
			intPwd = Long.parseLong(strPwd);
			decPwd = intPwd ^ key;
			System.out.println("4.복호화된 비밀번호 : " + decPwd);
			
			//복호화(복호화 되는 비번을 숫자 2개씩 분리시킨다)
			strPwd = String.valueOf(decPwd);
			
			char ch;
			String res = "";
			for(int i=0; i<strPwd.length(); i+=2) {
				ch = (char) Integer.parseInt(strPwd.substring(i,i+2));
				res += ch;
			}
			System.out.println("5.최종적으로 복호화된 비밀번호 : " + decPwd);
			
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('원본 비번 : " + pwd + " \\n암호화된 비번 : " + encPwd + "');");
			out.print("location.href='" + request.getContextPath() + "/study/password/passForm.jsp';");
			out.print("</script>");
		}
		else {
			SecurityUtil security = new SecurityUtil();
			String shaPwd = security.encryptSHA256(pwd);
			
			System.out.println("원본 pwd : " + pwd);
			System.out.println("암호화 pwd : " + shaPwd);
			
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('원본 비번 : " + pwd + " \\n암호화된 비번 : " + shaPwd + "');");
			out.print("location.href='" + request.getContextPath() + "/study/password/passForm.jsp';");
			out.print("</script>");
		}
	}
}
