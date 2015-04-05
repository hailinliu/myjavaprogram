package com.wswhly.bean.user;

import com.wswhly.util.StringUtil;

public class LoginReqBean {

	private String username;
	private String password;
	public String getUsername() {
		return StringUtil.TransactSQLInjection(username);
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
