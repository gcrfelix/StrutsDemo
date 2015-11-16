package com.pageManager.model;

import java.util.ArrayList;

public class FBPage {
	
	String pageID;
	String pageName;
	ArrayList<FBPost> posts;
	
	public FBPage() {
		this.posts = new ArrayList<FBPost>();
	}
	
	public void setPageID(String pageID) {
		this.pageID = pageID;
	}
	
	public String getPageID() {
		return pageID;
	}
	
	public void setName(String pageName) {
		this.pageName = pageName;
	}
	public String getName(){
		return this.pageName;
	}
	
	public void addPost(FBPost post) {
		posts.add(post);
	}
	
	public ArrayList<FBPost> getPosts() {
		return posts;
	}
}
