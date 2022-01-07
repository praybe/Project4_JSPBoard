package web.java.board.praybe.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.java.board.praybe.command.BoardCommand;
import web.java.board.praybe.command.ContentCommand;
import web.java.board.praybe.command.DeleteCommand;
import web.java.board.praybe.command.ListCommand;
import web.java.board.praybe.command.ModifyCommand;
import web.java.board.praybe.command.ReplyAddCommand;
import web.java.board.praybe.command.ReplyCommand;
import web.java.board.praybe.command.WriteCommand;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doAction");

		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		BoardCommand command = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		if (com.equals("/list.do")) { // 1. 게시판 화면
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";

		} else if (com.equals("/content.do")) { // 2. 게시글 확인
			command = new ContentCommand();
			command.execute(request, response);
			viewPage = "content.jsp";

		} else if (com.equals("/writeAction.do")) { // 3. 글 작성 실행
			viewPage = "write.jsp";
		} else if (com.equals("/writeFinish.do")) { // 작성 완료
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "list.do"; // 게시판 화면으로 이동

		} else if (com.equals("/modify.do")) { // 4. 글 수정 실행
			command = new ModifyCommand();
			command.execute(request, response);
			viewPage = "list.do"; // 수정 후 게시판 화면으로 이동

		} else if (com.equals("/delete.do")) { // 5. 글 삭제
			command = new DeleteCommand();
			command.execute(request, response);
			viewPage = "list.do"; // 삭제시 게시판 화면으로 이동

		} else if (com.equals("/reply.do")) { // 6. 답글
			command = new ReplyCommand();
			command.execute(request, response);
			viewPage = "reply.jsp"; // 답글 작성 실행
		} else if (com.equals("/replyAction.do")) { // 답글 완료 후
			command = new ReplyAddCommand();
			command.execute(request, response);
			viewPage = "list.do"; // 게시판 화면으로 이동
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);

	}

}
