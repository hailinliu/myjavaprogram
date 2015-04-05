package com.wswhly.bean.vote;

import java.util.List;


public class ActivityListRespBean {

	private List<Activity> list;
	private int count;
	
	public List<Activity> getList() {
		return list;
	}

	public void setList(List<Activity> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public class Activity {
		private long id;
		private int type;
		private String name;
		private long userid;
		private String serialnum;
		private String uploaddate;
		private String updatenum;
		private String note;
		private String imgurl;
		private String uploadusername;
		private String typename;
		private int votenum;
		private long issue;
		private int state;
		
		public long getId() {
			return id;
		}

		public void setId(long id) {
			this.id = id;
		}

		public long getUserid() {
			return userid;
		}

		public void setUserid(long userid) {
			this.userid = userid;
		}

		public int getVotenum() {
			return votenum;
		}

		public void setVotenum(int votenum) {
			this.votenum = votenum;
		}

		public int getType() {
			return type;
		}

		public void setType(int type) {
			this.type = type;
		}

		public String getUpdatenum() {
			return updatenum;
		}

		public void setUpdatenum(String updatenum) {
			this.updatenum = updatenum;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getSerialnum() {
			return serialnum;
		}

		public void setSerialnum(String serialnum) {
			this.serialnum = serialnum;
		}


		public String getUploaddate() {
			return uploaddate;
		}

		public void setUploaddate(String uploaddate) {
			this.uploaddate = uploaddate;
		}

		public String getNote() {
			return note;
		}

		public void setNote(String note) {
			this.note = note;
		}

		public String getImgurl() {
			return imgurl;
		}

		public void setImgurl(String imgurl) {
			this.imgurl = imgurl;
		}

		public String getUploadusername() {
			return uploadusername;
		}

		public void setUploadusername(String uploadusername) {
			this.uploadusername = uploadusername;
		}

		public String getTypename() {
			return typename;
		}

		public void setTypename(String typename) {
			this.typename = typename;
		}

		public long getIssue() {
			return issue;
		}

		public void setIssue(long issue) {
			this.issue = issue;
		}

		public int getState() {
			return state;
		}

		public void setState(int state) {
			this.state = state;
		}

	}
	
	
}
