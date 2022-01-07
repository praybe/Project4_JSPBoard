package web.java.board.praybe.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.java.board.praybe.dao.BoardDao;

public class ReplyAddCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("AddReplyCommand() ..");

		String bid = request.getParameter("bid");
		String bname = request.getParameter("bname");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String bgroup = request.getParameter("bgroup");
		String bstep = request.getParameter("bstep");
		String bindent = request.getParameter("bindent");

		BoardDao dao = new BoardDao();
		dao.AddReply(bid, bname, btitle, bcontent, bgroup, bstep, bindent);

	}

}
