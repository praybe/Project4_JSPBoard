package web.java.board.praybe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.java.board.praybe.dao.BoardDao;
import web.java.board.praybe.dto.BoardDto;

public class ContentCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ContentCommand() ..");

		String bid = request.getParameter("bid");

		BoardDao dao = new BoardDao();
		BoardDto dto = dao.ContentView(bid);
		request.setAttribute("contentView", dto);

	}

}
