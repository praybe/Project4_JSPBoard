package web.java.board.praybe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import web.java.board.praybe.dto.BoardDto;

public class BoardDao {

	private DataSource dataSource;

	public BoardDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ◆ 게시판 메인
	public ArrayList<BoardDto> getList(int pageNum, int amount) {
		System.out.println("ListDao() .."); // 디버깅 문구
		ArrayList<BoardDto> bdto = new ArrayList<BoardDto>();

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String query = "select * " + "from(select rownum rn," + "a.*" + "from(select*from mvc_board "
					+ "order by bgroup desc, bstep asc)a)" + "where rn > ? and rn<=?";

			con = dataSource.getConnection(); // 연결
			stmt = con.prepareStatement(query); // sql준비

			// 페이징
			stmt.setInt(1, (pageNum - 1) * amount);
			stmt.setInt(2, pageNum * amount);

			rs = stmt.executeQuery(); // sql문 실행

			while (rs.next()) {
				int bid = rs.getInt("bid");
				String bname = rs.getString("bname");
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				Timestamp bdate = rs.getTimestamp("bdate");
				int bhit = rs.getInt("bhit");
				int bgroup = rs.getInt("bgroup");
				int bstep = rs.getInt("bstep");
				int bindent = rs.getInt("bindent");

				BoardDto dto = new BoardDto(bid, bname, btitle, bcontent, bdate, bhit, bgroup, bstep, bindent);
				bdto.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return bdto;
	}

	// ◆◆ 페이징(전체 게시글 수)
	public int getTotal() {
		int result = 0;

		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String query = "select count(*) from mvc_board";

			con = dataSource.getConnection();
			stmt = con.prepareStatement(query);
			rs = stmt.executeQuery();

			rs.next();
			result = rs.getInt("count(*)");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;

	}

	// ◆ 조회수
	public void upHit(String bid) {
		System.out.println("hit() ..");

		Connection con = null;
		PreparedStatement stmt = null;

		try {
			String query = "update mvc_board set bhit = bhit+1 where bid = ?";

			con = dataSource.getConnection(); // 연결
			stmt = con.prepareStatement(query); // sql준비
			stmt.setInt(1, Integer.valueOf(bid));

			int rn = stmt.executeUpdate();
			System.out.println("조회수: " + rn);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

	// ◆ 게시글 확인
	public BoardDto ContentView(String bid) {
		upHit(bid); // 조회수

		BoardDto bdto = null;
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String query = "select * from mvc_board where bid=?";

			con = dataSource.getConnection(); // 연결
			stmt = con.prepareStatement(query); // sql준비
			stmt.setInt(1, Integer.valueOf(bid));
			rs = stmt.executeQuery(); // sql문 실행

			while (rs.next()) {
				int id = rs.getInt("bid");
				String bname = rs.getString("bname");
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				Timestamp bdate = rs.getTimestamp("bdate");
				int bhit = rs.getInt("bhit");
				int bgroup = rs.getInt("bgroup");
				int bstep = rs.getInt("bstep");
				int bindent = rs.getInt("bindent");

				bdto = new BoardDto(id, bname, btitle, bcontent, bdate, bhit, bgroup, bstep, bindent);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return bdto;

	}

	// ◆ 글 작성
	public void Write(String bname, String btitle, String bcontent) {
		System.out.println("WriteDao() .."); // 디버깅 문구

		Connection con = null;
		PreparedStatement stmt = null;

		try {
			String query = "insert into mvc_board(bid, bname, btitle, bcontent, bhit, bgroup, bstep, bindent) "
					+ "values(mvc_board_seq.nextval,?,?,?,0, mvc_board_seq.currval,0,0)";

			con = dataSource.getConnection(); // 연결
			stmt = con.prepareStatement(query); // sql준비
			stmt.setString(1, bname);
			stmt.setString(2, btitle);
			stmt.setString(3, bcontent);

			int rn = stmt.executeUpdate();
			System.out.println("Write 갯수: " + rn);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

	// ◆ 게시글 수정
	public void Modify(String bid, String bname, String btitle, String bcontent) {
		System.out.println("ModifyDao() .."); // 디버깅 문구

		Connection con = null;
		PreparedStatement stmt = null;

		try {
			String query = "update mvc_board set bname = ?, btitle = ?, bcontent = ? where bid = ?";

			con = dataSource.getConnection(); // 연결
			stmt = con.prepareStatement(query); // sql준비
			stmt.setString(1, bname);
			stmt.setString(2, btitle);
			stmt.setString(3, bcontent);
			stmt.setInt(4, Integer.valueOf(bid));

			int rn = stmt.executeUpdate();
			System.out.println("수정 갯수:" + rn);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}

	}

	// ◆ 게시글 삭제
	public void Delete(String bid) {
		System.out.println("DeleteDao() .."); // 디버깅 문구

		Connection con = null;
		PreparedStatement stmt = null;

		try {
			String query = "delete from mvc_board where bid = ?";

			con = dataSource.getConnection(); // 연결
			stmt = con.prepareStatement(query); // sql준비

			stmt.setInt(1, Integer.valueOf(bid));

			int rn = stmt.executeUpdate();
			System.out.println("Delete 갯수: " + rn);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

	// ◆ 답글 공간 확보
	public void ShapeReply(String group, String step) {
		System.out.println("ShapeReplyDao() ..");
		Connection con = null;
		PreparedStatement stmt = null;

		try {
			String query = "update mvc_board set bStep = bStep + 1 where bGroup = ? and bStep > ?";

			con = dataSource.getConnection(); // 연결
			stmt = con.prepareStatement(query); // sql준비

			stmt.setInt(1, Integer.parseInt(group));
			stmt.setInt(2, Integer.parseInt(step));

			int rn = stmt.executeUpdate();
			System.out.println("답글공간 갯수: " + rn);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	// ◆◆ 답글 구성 및 db 추가
	public void AddReply(String bid, String bname, String btitle, String bcontent, String bgroup, String bstep,
			String bindent) {
		System.out.println("AddReply() ..");

		ShapeReply(bgroup, bstep);

		Connection con = null;
		PreparedStatement stmt = null;

		try {
			String query = "insert into mvc_board (bid, bname, btitle, bcontent, bgroup, bstep, bindent) "
					+ "values (mvc_board_seq.nextval, ?, ?, ?, ?, ?, ?)";

			con = dataSource.getConnection();
			stmt = con.prepareStatement(query);

			stmt.setString(1, bname);
			stmt.setString(2, btitle);
			stmt.setString(3, bcontent);

			stmt.setInt(4, Integer.parseInt(bgroup));
			stmt.setInt(5, Integer.parseInt(bstep) + 1);
			stmt.setInt(6, Integer.parseInt(bindent) + 1);

			int rn = stmt.executeUpdate();
			System.out.println("답글 갯수: " + rn);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

	}

	// ◆◆ 답글 작성
	public BoardDto Reply(String bid) {
		System.out.println("ReplyDao() ..");
		BoardDto bdto = null;
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			String query = "select * from mvc_board where bid=?";

			con = dataSource.getConnection();
			stmt = con.prepareStatement(query);
			stmt.setInt(1, Integer.valueOf(bid));
			rs = stmt.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("bid");
				String bname = rs.getString("bname");
				String btitle = rs.getString("btitle");
				String bcontent = rs.getString("bcontent");
				Timestamp bdate = rs.getTimestamp("bdate");
				int bhit = rs.getInt("bhit");
				int bgroup = rs.getInt("bgroup");
				int bstep = rs.getInt("bstep");
				int bindent = rs.getInt("bindent");

				bdto = new BoardDto(id, bname, btitle, bcontent, bdate, bhit, bgroup, bstep, bindent);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();

			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return bdto;
	}

}
