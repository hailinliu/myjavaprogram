package com.wswhly.bean.news;

import com.wswhly.bean.news.NewsListRespBean.News;

public class NewsInfoRespBean {

	private News prevNews;
	
	private News news;

	private News nextNews;
	
	public News getPrevNews() {
		return prevNews;
	}

	public void setPrevNews(News prevNews) {
		this.prevNews = prevNews;
	}

	public News getNextNews() {
		return nextNews;
	}

	public void setNextNews(News nextNews) {
		this.nextNews = nextNews;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}
	
}
