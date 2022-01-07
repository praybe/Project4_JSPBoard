package web.java.board.praybe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.java.board.praybe.dao.BoardDao;
import web.java.board.praybe.dto.BoardDto;

public class ReplyCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ReplyCommand() ..");

		String bid = request.getParameter("bid");

		BoardDao dao = new BoardDao();
		BoardDto dto = dao.Reply(bid);
		request.setAttribute("reply", dto);

	}

}
