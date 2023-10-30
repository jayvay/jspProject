package study.j1025;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex1")
public class Ex1 extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append("Served at:(숙제) ").append(request.getContextPath()+"<br/>");
		
		PrintWriter out = response.getWriter();	//브라우저 출력 준비
		out.println("이번 주 행운의 당첨 번호는!!!!!<br/>");
		
		int[] lotto = new int[6];
		for(int i=0; i<lotto.length; i++) {
			int su = (int)((Math.random()*45)+1);	//1~45개의 숫자 랜덤으로 6개 뽑는다
			int sw = 0;
			for(int j=0; j<lotto.length; j++) {
				if(su == lotto[j]) {	//랜덤으로 뽑은 숫자가 전에 뽑은 숫자와 같으면 다시 뽑는다(중복 배제)
					sw = 1;
					i--;
					break;
				}
			}
			if(sw == 0) {	//랜덤으로 뽑은 숫자를 lotto 배열에 넣는다
				lotto[i] = su;
			}
		}
		
		
		out.println("<p><br/></p>");
		out.println("이번 주 행운의 당첨 번호는!!!!!~~~<br/>");
		for(int i=0; i<6; i++) {
			try {
					out.println(lotto[i] + "<br/>");
					System.out.print(">");
					Thread.sleep(500);			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		int temp = 0;
		for(int i=0; i<lotto.length-1; i++) {		//로또 번호를 오름차순으로 정렬(selection sort)
			for(int j=i+1; j<lotto.length; j++) {
				if(lotto[i] > lotto[j]) {
					temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}
			}
		}
		for(int lo : lotto) {
			out.println(lo);
		}
		
		
		
//		out.println("<p><br/><p>");
//		out.println("<button type='button' onclick='lucky()'>로또 당첨 번호</button>");
//		out.println("<script>");
//		out.println("let res = '';");
//		out.println("function lucky() {");
////			out.println(i + ",");
//		out.println("setTimeout(() => {");
//		out.println("");
//		out.println("},3000);");
//		out.println("function shownum() {");
//		out.println("for(int i : lotto) {");
//		out.println("}");
//		out.println("let luckynum = `${lotto}`");
//		out.println("");
//		out.println("");
//		out.println("</script>");
//		out.println(" 입니다!");
		
	}
}
