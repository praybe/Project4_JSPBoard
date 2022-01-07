package web.java.board.praybe.page;

public class PageVO {

	private int pageNum; // 현재 조회되는 페이지
	private int amount = 10; // 한 페이지 당 노출될 게시글 수

	private int endPage; // 페이지 끝번호
	private int startPage; // 페이지 첫번호
	private boolean pre, next; // 이전, 다음

	private int total; // 총 게시글 수

	public PageVO(int pageNum, int amount, int total) {

		this.pageNum = pageNum;
		this.amount = amount;
		this.total = total;

		this.endPage = (int) (Math.ceil(this.pageNum / 10.0)) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil(this.total * 1.0) / (double) this.amount);
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		this.pre = this.startPage > 1;
		this.next = this.endPage < realEnd;

		// 디버깅
		System.out.println("<<" + this.startPage + " / >>" + this.endPage);

	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public boolean isPre() {
		return pre;
	}

	public void setPre(boolean pre) {
		this.pre = pre;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

}
