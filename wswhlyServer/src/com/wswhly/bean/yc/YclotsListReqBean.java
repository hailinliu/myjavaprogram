package com.wswhly.bean.yc;

public class YclotsListReqBean {
	private int pageno;//页数
	private int pagesize;//每页数
	private String specialID;//根据专场ID查询拍品

	public int getPageno() {
		return pageno;
	}
	public int getPagesize() {
		return pagesize;
	}
	public String getSpecialID() {
		return specialID;
	}
	public void setPageno(int pageno) {
		this.pageno = pageno;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public void setSpecialID(String specialID) {
		this.specialID = specialID;
	}

}
