package com.wswhly.bean.yc;

public class YcspecialReqBean {
	private int pageno;//页数
	private int pagesize;//每页数
	private String actionid;//根据拍卖会id查询专场
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
	public String getActionid() {
		return actionid;
	}
	public void setActionid(String actionid) {
		this.actionid = actionid;
	}
	
}
