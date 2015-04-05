package com.hyzm.bean;

public class MessageReqBean {

	private String bussno;//业务代码
	private String verify;//验证字段
	private int plat;//平台编号
	private String content;//内容
	private long userid;//用户id
	
	public String getBussno() {
		return bussno;
	}
	public void setBussno(String bussno) {
		this.bussno = bussno;
	}
	public String getVerify() {
		return verify;
	}
	public void setVerify(String verify) {
		this.verify = verify;
	}
	public int getPlat() {
		return plat;
	}
	public void setPlat(int plat) {
		this.plat = plat;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getUserid() {
		return userid;
	}
	public void setUserid(long userid) {
		this.userid = userid;
	}
	
}
