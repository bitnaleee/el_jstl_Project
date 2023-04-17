package com.br.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.model.vo.Person;

/**
 * Servlet implementation class ElServlet
 */
@WebServlet("/el.do")
public class ElServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ElServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * 1. ServletContext (application Scope)
		      한 애플리케이션당 단 1개 존재하는 객체
		      여기에 데이터 담으면 애플리케이션 전역(jsp/servlet/java)에서 사용가능
		
		   2. HttpSession (session Scope)
		      한 브라우저당 1개씩 존재하는 객체
		      여기에 데이터 담으면 어떤 jsp든, 어떤 servlet이든 다 사용가능
		
		   3. HttpServletRequest (request Scope) // 선언되어있음
		      요청 때마다 매번 생성되는 객체
		      여기에 데이터 담으면 해당 이 request객체를 포워딩 받는 응답 jsp에서만 사용가능
		
		   4. PageContext (page Scope)
		      jsp마다 존재하는 객체
		      여기에 데이터 담으면 그 jsp에서만 사용 가능
		      
		   공통적으로
		 *     데이터를 담을 때는         .setAttribute("키", 담고자 하는 데이터);
		 *     데이터를 꺼낼 때는         .getAttribute("키") : 담겨 있는 데이터
		 *     데이터를 제거 하고자 할 때는 .removeAttribute("키")
		 */
		
		// requestScope에 담기 (응답되는 페이지에서만 쓸 수 있음)
		request.setAttribute("classRoom", "9강의장");
		request.setAttribute("student", new Person("강해린", 20, "여자"));
		
		// sessionScope에 담기 
		HttpSession session = request.getSession(); 
		session.setAttribute("academy", "구디아카데미");
		session.setAttribute("teacher", new Person("김채원", 32, "여자"));
		
		// request, sessionScope에 동일한 키값으로 데이터 담기
		request.setAttribute("scope", "request");
		session.setAttribute("scope", "session");
		
		// applicationScope에 담기
		ServletContext application = request.getServletContext();
		application.setAttribute("scope", "application");
		
		
		// 응답페이지 포워딩
		request.getRequestDispatcher("views/01_EL/elBasic.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
