package com.pageManager.model;

public class FBPost {
	
	String m_Id;
	String m_content;
	int m_views;
	boolean m_isPublished;
	
	public FBPost(String id, String content, int views, boolean isPublished) {
		this.m_Id = id;
		this.m_content = content;
		this.m_views = views;
		this.m_isPublished = isPublished;
	}
	
	public void setPostID(String id) {
		this.m_Id = id;
	}
	
	public String getPostID() {
		return m_Id;
	}
	
	public void setIsPublished(boolean status) {
		this.m_isPublished = status;
	}
	
	public boolean isPublished() {
		return this.m_isPublished;
	}
	
	public void setContent(String content) {
		this.m_content = content;
	}
	
	public String getContent() {
		return this.m_content;
	}
	
	public void setViews(int views) {
		this.m_views = views;
	}
	
	public int getViews() {
		return m_views;
	}
}
