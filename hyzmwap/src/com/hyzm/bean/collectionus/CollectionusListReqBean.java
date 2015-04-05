package com.hyzm.bean.collectionus;

public class CollectionusListReqBean {

	private int pageno;//页锟斤拷
	private int pagesize;//每页锟斤拷
	private long typeid;//锟斤拷品锟斤拷锟斤拷锟�
	private long styleid;//锟斤拷品小锟斤拷锟斤拷
	public int getPricearea() {
		return pricearea;
	}
	public void setPricearea(int pricearea) {
		this.pricearea = pricearea;
	}
	private int pricearea;
	
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
	public long getTypeid() {
		return typeid;
	}
	public void setTypeid(long typeid) {
		this.typeid = typeid;
	}
	public long getStyleid() {
		return styleid;
	}
	public void setStyleid(long styleid) {
		this.styleid = styleid;
	}
}
