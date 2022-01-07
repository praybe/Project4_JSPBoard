package web.java.board.praybe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.java.board.praybe.dao.BoardDao;

public class WriteCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("WriteCommand() ..");

		String bname = request.getParameter("bname");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");

		BoardDao dao = new BoardDao();
		dao.Write(bname, btitle, bcontent);

	}

}
