package com.wswhly.bean.tool;

public class SendMsgReqBean {

	private String mobile;
	private int type;//1.注册 2修改 3通知 4忘记密码
	
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
}
