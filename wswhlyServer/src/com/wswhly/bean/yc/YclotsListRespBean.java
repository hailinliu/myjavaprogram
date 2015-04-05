package com.wswhly.bean.yc;

import java.util.List;


public class YclotsListRespBean {
	private List<Yclots> list;
	private int count;
	public List<Yclots> getList() {
		return list;
	}


	public int getCount() {
		return count;
	}


	public void setList(List<Yclots> list) {
		this.list = list;
	}


	public void setCount(int count) {
		this.count = count;
	}



	
	
	public class Yclots {
		private String		id	;
		private String		ycid	;
		private String		name	;
		private String		image	;
		private String		autor	;
		private String		size	;
		private String		classes	;
		private String		year	;
		private String		price	;
		private String		specialID	;
		private String		suggest	;
		private String		note	;
		private String      actiontime;
		private String      auctionname;
		private String      as_name;
		private String      specialname;
		private String		cjprice	;
		private String		cjtime	;
		public String getSpecialname() {
			return specialname;
		}
		public void setSpecialname(String specialname) {
			this.specialname = specialname;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getYcid() {
			return ycid;
		}
		public void setYcid(String ycid) {
			this.ycid = ycid;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getImage() {
			return image;
		}
		public void setImage(String image) {
			this.image = image;
		}
		public String getAutor() {
			return autor;
		}
		public void setAutor(String autor) {
			this.autor = autor;
		}
		public String getSize() {
			return size;
		}
		public void setSize(String size) {
			this.size = size;
		}
		public String getClasses() {
			return classes;
		}
		public void setClasses(String classes) {
			this.classes = classes;
		}
		public String getYear() {
			return year;
		}
		public void setYear(String year) {
			this.year = year;
		}
		public String getPrice() {
			return price;
		}
		public void setPrice(String price) {
			this.price = price;
		}
		public String getSpecialID() {
			return specialID;
		}
		public void setSpecialID(String specialID) {
			this.specialID = specialID;
		}
		public String getSuggest() {
			return suggest;
		}
		public void setSuggest(String suggest) {
			this.suggest = suggest;
		}
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}
		public String getActiontime() {
			return actiontime;
		}
		public void setActiontime(String actiontime) {
			this.actiontime = actiontime;
		}
		public String getAuctionname() {
			return auctionname;
		}
		public void setAuctionname(String auctionname) {
			this.auctionname = auctionname;
		}
		public String getAs_name() {
			return as_name;
		}
		public void setAs_name(String as_name) {
			this.as_name = as_name;
		}
		public String getCjprice() {
			return cjprice;
		}
		public void setCjprice(String cjprice) {
			this.cjprice = cjprice;
		}
		public String getCjtime() {
			return cjtime;
		}
		public void setCjtime(String cjtime) {
			this.cjtime = cjtime;
		}
		
	}

}
