package com.hyzm.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MenuTree implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private String id;
	private String text;
	private String url;
	private String state;
	private String checked;
	private Map<String, String> attributes;
	private List<MenuTree> children;
	private String fuid;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public Map<String, String> getAttributes() {
		return attributes;
	}
	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}
	public List<MenuTree> getChildren() {
		return children;
	}
	public void setChildren(List<MenuTree> children) {
		this.children = new ArrayList<MenuTree>();
		MenuTree menutree;
		for(int i=0;i<children.size();i++){
			menutree = children.get(i);
			if(menutree.getFuid() != null && !menutree.getFuid().equals("") && menutree.getFuid().equals(id)){
				this.children.add(menutree);
				menutree.setChildren(children);
			}
		}
	}
	public String getFuid() {
		return fuid;
	}
	public void setFuid(String fuid) {
		this.fuid = fuid;
	}
	
}
