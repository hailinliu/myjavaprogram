package com.wswhly.bean.yc;

public class YcactionReqBean {
	private int pageno;//页数
	private int pagesize;//每页数
	private String ins_id;//根据拍卖公司id查询拍卖会
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
	public String getIns_id() {
		return ins_id;
	}
	public void setIns_id(String ins_id) {
		this.ins_id = ins_id;
	}

	
}
