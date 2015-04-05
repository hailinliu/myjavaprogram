package com.wswhly.bean.enroll;

public class EnrollListReqBean {

	private int pageno;//Ò³Êý
	private int pagesize;//Ã¿Ò³Êý
	private long userid;
	
	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}
	
}
