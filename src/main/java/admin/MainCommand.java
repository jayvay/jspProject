package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//초기화면에 상품 이미지(title image)를 랜덤으로 올려주기

		int mainImage = (int)(Math.random()*17) + 1;
				
		//메인 화면에 처리해야 할 내용들
		
		request.setAttribute("mainImage", mainImage);
		
	}

}
