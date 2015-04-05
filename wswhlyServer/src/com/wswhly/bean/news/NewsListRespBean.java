package com.wswhly.bean.news;

import java.util.List;

public class NewsListRespBean {

	private List<News> list;
	private int count;
	
	public List<News> getList() {
		return list;
	}

	public void setList(List<News> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public class News {
		private long id;
		private String title;
		private String content;
		private String createdate;
		private String type;
		private String style;
		private String label;
		private String stylename;
		private String recommend;//1.ÍÆ¼ö
		private String imgurltitle;
		private int clicknum;
		
		public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public String getLabel() {
			return label;
		}
		public void setLabel(String label) {
			this.label = label;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getCreatedate() {
			return createdate;
		}
		public void setCreatedate(String createdate) {
			this.createdate = createdate;
		}
		public String getRecommend() {
			return recommend;
		}
		public void setRecommend(String recommend) {
			this.recommend = recommend;
		}
		public int getClicknum() {
			return clicknum;
		}
		public void setClicknum(int clicknum) {
			this.clicknum = clicknum;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getStyle() {
			return style;
		}
		public void setStyle(String style) {
			this.style = style;
		}
		public String getStylename() {
			return stylename;
		}
		public void setStylename(String stylename) {
			this.stylename = stylename;
		}
		public String getImgurltitle() {
			return imgurltitle;
		}
		public void setImgurltitle(String imgurltitle) {
			this.imgurltitle = imgurltitle;
		}
		
	}
}
