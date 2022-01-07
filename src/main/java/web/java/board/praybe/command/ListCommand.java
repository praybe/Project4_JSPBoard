package web.java.board.praybe.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.java.board.praybe.dao.BoardDao;
import web.java.board.praybe.dto.BoardDto;
import web.java.board.praybe.page.PageVO;

public class ListCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ListCommand().."); // 디버깅

		int pageNum = 1;
		int amount = 10;

		if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}

		BoardDao dao = new BoardDao();
		ArrayList<BoardDto> dto = dao.getList(pageNum, amount);
		int total = dao.getTotal(); // 전체게시글 수

		PageVO pvo = new PageVO(pageNum, amount, total);

		request.setAttribute("page", pvo);
		request.setAttribute("list", dto);

	}

}
