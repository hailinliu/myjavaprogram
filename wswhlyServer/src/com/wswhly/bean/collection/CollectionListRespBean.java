package com.wswhly.bean.collection;

import java.util.List;


public class CollectionListRespBean {

	private List<Collection> list;
	private int count;
	
	public List<Collection> getList() {
		return list;
	}

	public void setList(List<Collection> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	public class Collection {
		private long id;
		private String type;
		private String name;
		private String serialnum;
		private String uploaduser;
		private String owner;
		private String source;
		private String uploaddate;
		private String lastmodifydate;
		private int iscollection;
		private String note;
		private String imgurl;
		
		private int clicknum;
		private int collectnum;
		
		private String uploadusername;
		
		private String typename;
		
		private String collectdate;//当type==4 我的收藏 才会有值
		
		private boolean iscollect;
		
		private String state;
		
		public String getState() {
			return state;
		}
		public void setState(String state) {
			this.state = state;
		}
		public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
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
		public String getUploaduser() {
			return uploaduser;
		}
		public void setUploaduser(String uploaduser) {
			this.uploaduser = uploaduser;
		}
		public String getOwner() {
			return owner;
		}
		public void setOwner(String owner) {
			this.owner = owner;
		}
		public String getSource() {
			return source;
		}
		public void setSource(String source) {
			this.source = source;
		}
		public String getUploaddate() {
			return uploaddate;
		}
		public void setUploaddate(String uploaddate) {
			this.uploaddate = uploaddate;
		}
		public String getLastmodifydate() {
			return lastmodifydate;
		}
		public void setLastmodifydate(String lastmodifydate) {
			this.lastmodifydate = lastmodifydate;
		}
		public int getIscollection() {
			return iscollection;
		}
		public void setIscollection(int iscollection) {
			this.iscollection = iscollection;
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
		public String getCollectdate() {
			return collectdate;
		}
		public void setCollectdate(String collectdate) {
			this.collectdate = collectdate;
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
		public int getClicknum() {
			return clicknum;
		}
		public void setClicknum(int clicknum) {
			this.clicknum = clicknum;
		}
		public int getCollectnum() {
			return collectnum;
		}
		public void setCollectnum(int collectnum) {
			this.collectnum = collectnum;
		}
		public boolean isIscollect() {
			return iscollect;
		}
		public void setIscollect(boolean iscollect) {
			this.iscollect = iscollect;
		}
		
	}
}
