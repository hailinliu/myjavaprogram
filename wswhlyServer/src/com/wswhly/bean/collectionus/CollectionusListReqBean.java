package com.wswhly.bean.collectionus;

public class CollectionusListReqBean {

	private int pageno;//ҳ��
	private int pagesize;//ÿҳ��
	private long typeid;//��Ʒ�����
	private long styleid;//��ƷС����
	private int pricearea;//1,0=5�� 2,1=5��10�� 3,2=10��20�� 4,3=20��50�� 5,4=50��100�� 6,5=100������
	
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
	public int getPricearea() {
		return pricearea;
	}
	public void setPricearea(int pricearea) {
		this.pricearea = pricearea;
	}
}
