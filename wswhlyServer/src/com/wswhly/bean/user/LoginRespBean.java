package com.wswhly.bean.user;

public class LoginRespBean {

	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public class User {
		private long id;
		private String username;
		private String password;
		private int sex;
		private String mobile;
		private String email;
		private String realname;
		private double money;
		private String idcard;
		private String job;
		private String jobname;
		private String address;
		private int point;
		private String createdate;
		private String state;
		private String level;
		private String leveltime;
		private String openId;
		private String weixin;//微信号
		private String baibaoshopstate;//0：等待审核   1：审核未通过  2：审核通过
		private String idcardimg;//身份证图片
		public String getOpenId() {
			return openId;
		}
		public void setOpenId(String openId) {
			this.openId = openId;
		}
		public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public String getUsername() {
			return username;
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
		public int getSex() {
			return sex;
		}
		public void setSex(int sex) {
			this.sex = sex;
		}
		public String getMobile() {
			return mobile;
		}
		public void setMobile(String mobile) {
			this.mobile = mobile;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getRealname() {
			return realname;
		}
		public void setRealname(String realname) {
			this.realname = realname;
		}
		public String getIdcard() {
			return idcard;
		}
		public void setIdcard(String idcard) {
			this.idcard = idcard;
		}
		public String getJob() {
			return job;
		}
		public void setJob(String job) {
			this.job = job;
		}
		public String getAddress() {
			return address;
		}
		public void setAddress(String address) {
			this.address = address;
		}
		public int getPoint() {
			return point;
		}
		public void setPoint(int point) {
			this.point = point;
		}
		public double getMoney() {
			return money;
		}
		public void setMoney(double money) {
			this.money = money;
		}
		public String getJobname() {
			return jobname;
		}
		public void setJobname(String jobname) {
			this.jobname = jobname;
		}
		public String getCreatedate() {
			return createdate;
		}
		public void setCreatedate(String createdate) {
			this.createdate = createdate;
		}
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public String getLevel() {
			return level;
		}
		public void setLevel(String level) {
			this.level = level;
		}
		public String getLeveltime() {
			return leveltime;
		}
		public void setLeveltime(String leveltime) {
			this.leveltime = leveltime;
		}
		public String getBaibaoshopstate() {
			return baibaoshopstate;
		}
		public void setBaibaoshopstate(String baibaoshopstate) {
			this.baibaoshopstate = baibaoshopstate;
		}
		public String getIdcardimg() {
			return idcardimg;
		}
		public void setIdcardimg(String idcardimg) {
			this.idcardimg = idcardimg;
		}
		public String getWeixin() {
			return weixin;
		}
		public void setWeixin(String weixin) {
			this.weixin = weixin;
		}
	}
}
