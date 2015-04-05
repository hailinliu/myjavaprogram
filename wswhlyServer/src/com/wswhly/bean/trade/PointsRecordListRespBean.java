package com.wswhly.bean.trade;

import java.util.List;

public class PointsRecordListRespBean {

	private List<PointRecord> list;
	private int count;
	
	public List<PointRecord> getList() {
		return list;
	}

	public void setList(List<PointRecord> list) {
		this.list = list;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public class PointRecord {
		private int points;
		private String tradetype;
		private String tradedate;
		private String type;
		private String note;
		private int leftpoints;
		public int getPoints() {
			return points;
		}
		public void setPoints(int points) {
			this.points = points;
		}
		public String getTradetype() {
			return tradetype;
		}
		public void setTradetype(String tradetype) {
			this.tradetype = tradetype;
		}
		public String getTradedate() {
			return tradedate;
		}
		public void setTradedate(String tradedate) {
			this.tradedate = tradedate;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}
		public int getLeftpoints() {
			return leftpoints;
		}
		public void setLeftpoints(int leftpoints) {
			this.leftpoints = leftpoints;
		}
	}
}
