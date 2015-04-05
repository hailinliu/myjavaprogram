package com.hyzm.bean.yc;

public class YclotsListReqBean {
	private int pageno;//ҳ��
	private int pagesize;//ÿҳ��
	private String specialID;
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
