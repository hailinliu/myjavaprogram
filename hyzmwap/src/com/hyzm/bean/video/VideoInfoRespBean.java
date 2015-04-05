package com.hyzm.bean.video;

import com.hyzm.bean.video.VideoListRespBean.Video;

public class VideoInfoRespBean {

	private Video video;

	private Video prevVideo;
	
	private Video nextVideo;
	
	public Video getVideo() {
		return video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

	public Video getPrevVideo() {
		return prevVideo;
	}

	public void setPrevVideo(Video prevVideo) {
		this.prevVideo = prevVideo;
	}

	public Video getNextVideo() {
		return nextVideo;
	}

	public void setNextVideo(Video nextVideo) {
		this.nextVideo = nextVideo;
	}


}
