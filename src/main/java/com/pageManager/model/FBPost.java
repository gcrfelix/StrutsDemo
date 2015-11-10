package com.pageManager.model;

public class FBPost {
	String m_content;
	int m_views;
	boolean m_isPublished;
	
	public FBPost(String content, int views, boolean isPublished) {
		this.m_content = content;
		this.m_views = views;
		this.m_isPublished = isPublished;
	}
	
	public boolean isPublished() {
		return this.m_isPublished;
	}
	
	public String getContent() {
		return this.m_content;
	}
	
	public int getViews() {
		return m_views;
	}
}
