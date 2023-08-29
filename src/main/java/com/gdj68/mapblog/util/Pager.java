package com.gdj68.mapblog.util;

public class Pager {

	// 검색

	private String kind;
	private String search;

	private Long startRow;
	private Long lastRow;

	private Long page;
	// count 역할 > 한페이지에 보여질 ROw의 개수
	private Long perPage;

	// 총 페이지 갯수
	private Long totalPage;

	// 시작번호
	private Long startNum;
	// 끝번호
	private Long lastNum;

	// 이전 블록 활성화
	private boolean pre;// false면 1번블럭. true 활성화
	// 다음블럭 활성화
	private boolean next;// false면 마지막블럭, true면 마지막 블럭 아님
	
	// publics 조회
	// 내 게시물을 조회할 수 있는 id
	private String id;


	public void makePageNum(Long total) {
		// 130 > 13
		// 131~139 > 14
		
		// 1. 전체 갯수로 전체 페이지 수 구하기
		if (total % this.getPerPage() != 0) {
			this.totalPage = total / this.getPerPage() + 1;
		} else {
			this.totalPage = total / this.getPerPage();
		}
		// 2. 전체 페이지수로 전체 block 구하기
		// 한 페이지에 출력할 번호의 갯수
		long perBlock = 5;
		long totalBlock = this.totalPage / perBlock;
		if (this.totalPage % perBlock != 0) {
			totalBlock++;
		}

		// 3. 현재 page번호로 블록번호 구하기
		// 현재블록번호
		long curBlock = this.getPage() / perBlock;
		if (this.getPage() % perBlock != 0) {
			curBlock++;
		}
		
		//4. 현재 블록번호의 시작번호와 끝번호 구하기
		// curBlock 	startNum		lastNum
		//	1				1				5
		//	2				6				10
		//	3				11				15
		//	4				16				20
		this.startNum = (curBlock-1)*(perBlock)+1;
		this.lastNum = curBlock*perBlock;
		//현재 블럭이 마지막 블럭일떄 lastNum을 totalPage숫자로 대입
		if (this.lastNum > this.totalPage) {
			this.lastNum = this.totalPage;
		}

		// 이전 블럭 활성화 여부
		if (curBlock > 1) {
			this.pre = true;
		}
		// 다음블럭 활성화 여부
		if (curBlock < totalBlock) {
			this.next = true;
		}

	}

	public Long getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Long totalPage) {
		this.totalPage = totalPage;
	}

	public void makeRowNum() {
		this.startRow = (this.getPage() - 1) * this.getPerPage() + 1;
		this.lastRow = this.getPage() * this.getPerPage();

	}

	public Long getStartRow() {
		return startRow;
	}

	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}

	public Long getLastRow() {
		return lastRow;
	}

	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}

	public Long getPage() {
		if (this.page == null) {
			this.page = 1L;
		}
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getPerPage() {
		if (this.perPage == null) {
			this.perPage = 10L;
		}
		return perPage;
	}

	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}

	public Long getStartNum() {
		return startNum;
	}

	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}

	public Long getLastNum() {
		return lastNum;
	}

	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
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

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSearch() {
		if (this.search == null) {
			this.search = "";
		}

		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
