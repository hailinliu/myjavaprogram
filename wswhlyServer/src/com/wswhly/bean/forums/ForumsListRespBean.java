package com.wswhly.bean.forums;

import java.util.List;

public class ForumsListRespBean {

	private List<Forums> list;
	private int count;

	public List<Forums> getList() {
		return list;
	}

	public void setList(List<Forums> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public class Forums {
		private long id;
		private long userid;// ”√ªßid
		private long collectionid;//
		private String username;//
		private String level;//
		private String collectionnum;//
		private String content;//
		private String countnum;//
		private String likenum;//
		private String forumtime;//
		private String desction;//

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

		public long getCollectionid() {
			return collectionid;
		}

		public void setCollectionid(long collectionid) {
			this.collectionid = collectionid;
		}

		public String getCollectionnum() {
			return collectionnum;
		}

		public void setCollectionnum(String collectionnum) {
			this.collectionnum = collectionnum;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public String getCountnum() {
			return countnum;
		}

		public void setCountnum(String countnum) {
			this.countnum = countnum;
		}

		public String getLikenum() {
			return likenum;
		}

		public void setLikenum(String likenum) {
			this.likenum = likenum;
		}

		public String getForumtime() {
			return forumtime;
		}

		public void setForumtime(String forumtime) {
			this.forumtime = forumtime;
		}

		public String getDesction() {
			return desction;
		}

		public void setDesction(String desction) {
			this.desction = desction;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getLevel() {
			return level;
		}

		public void setLevel(String level) {
			this.level = level;
		}

	}
}
