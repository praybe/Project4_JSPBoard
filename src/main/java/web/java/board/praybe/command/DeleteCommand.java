package web.java.board.praybe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.java.board.praybe.dao.BoardDao;

public class DeleteCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("DeleteCommand() ..");

		String bid = request.getParameter("bid");

		BoardDao dao = new BoardDao();
		dao.Delete(bid);

	}

}
