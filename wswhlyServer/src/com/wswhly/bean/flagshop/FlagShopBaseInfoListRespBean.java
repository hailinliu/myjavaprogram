package com.wswhly.bean.flagshop;

import java.util.List;

public class FlagShopBaseInfoListRespBean {
	private List<FlagShopBaseInfo> list;
	private int count;

	public List<FlagShopBaseInfo> getList() {
		return list;
	}

	public int getCount() {
		return count;
	}

	public void setList(List<FlagShopBaseInfo> list) {
		this.list = list;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public class FlagShopBaseInfo{
		 private long id;
		 private long userid; 
		 private int type;//1：个人 2：公 司
		 private String  name;	
		 private String  mainscope;
		 private String  contactname;
		 private String  contacttel;
		 private String  addresss;
		 private String  logo;
		 private String  introduce;
		 private String  map;
		 private String  startdate;
		 private String  enddate;
		 private int     state;//1:合作中 2：合作暂停 3：合作结束			
		 private String  commissioner;
		public long getId() {
			return id;
		}
		public long getUserid() {
			return userid;
		}
		public int getType() {
			return type;
		}
		public String getName() {
			return name;
		}
		public String getMainscope() {
			return mainscope;
		}
		public String getContactname() {
			return contactname;
		}
		public String getContacttel() {
			return contacttel;
		}
		public String getAddresss() {
			return addresss;
		}
		public String getLogo() {
			return logo;
		}
		public String getIntroduce() {
			return introduce;
		}
		public String getMap() {
			return map;
		}
		public String getStartdate() {
			return startdate;
		}
		public String getEnddate() {
			return enddate;
		}
		public int getState() {
			return state;
		}
		public String getCommissioner() {
			return commissioner;
		}
		public void setId(long id) {
			this.id = id;
		}
		public void setUserid(long userid) {
			this.userid = userid;
		}
		public void setType(int type) {
			this.type = type;
		}
		public void setName(String name) {
			this.name = name;
		}
		public void setMainscope(String mainscope) {
			this.mainscope = mainscope;
		}
		public void setContactname(String contactname) {
			this.contactname = contactname;
		}
		public void setContacttel(String contacttel) {
			this.contacttel = contacttel;
		}
		public void setAddresss(String addresss) {
			this.addresss = addresss;
		}
		public void setLogo(String logo) {
			this.logo = logo;
		}
		public void setIntroduce(String introduce) {
			this.introduce = introduce;
		}
		public void setMap(String map) {
			this.map = map;
		}
		public void setStartdate(String startdate) {
			this.startdate = startdate;
		}
		public void setEnddate(String enddate) {
			this.enddate = enddate;
		}
		public void setState(int state) {
			this.state = state;
		}
		public void setCommissioner(String commissioner) {
			this.commissioner = commissioner;
		}

	}
}
