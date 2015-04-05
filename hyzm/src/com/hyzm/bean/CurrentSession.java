package com.hyzm.bean;



public class CurrentSession {
	
	private long id;
	private String username;//用户名
	private String mobile;//手机号
	private String createdate;//注册时间
	private String email;//电子邮箱
	private String realname;//真实姓名
	private String idcard;//身份证号
	private int job;//职业
	private String jobname;
	private String address;//地址
	private int point;//积分
	private double money;//余额
	private String level;//会员等级
	private String leveltime;//会员有效期
	private String openId;//QQ链接id
	private String weixin;//微信号
	private String baibaoshopstate;//0：等待审核   1：审核未通过  2：审核通过
	private String idcardimg;//身份证图片
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
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
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
	public int getJob() {
		return job;
	}
	public void setJob(int job) {
		this.job = job;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
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
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getWeixin() {
		return weixin;
	}
	public void setWeixin(String weixin) {
		this.weixin = weixin;
	}
	
}
