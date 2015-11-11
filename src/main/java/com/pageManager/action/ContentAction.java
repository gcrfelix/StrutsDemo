package com.pageManager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.pageManager.model.FBPage;
import com.pageManager.model.FBPost;
import com.restfb.Connection;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;

import static com.restfb.Version.VERSION_2_5;

import com.restfb.types.Account;
import com.restfb.types.FacebookType;
import com.restfb.types.Insight;
import com.restfb.types.Post;
import com.restfb.types.User;

import java.util.ArrayList;
import java.util.List;

public class ContentAction extends Action {
	String accessToken;
	FacebookClient facebookClient;
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (request.getParameter("accessToken") != null) {
			accessToken = request.getParameter("accessToken");
			facebookClient = new DefaultFacebookClient(accessToken,
					VERSION_2_5);
		}
		
		User user = facebookClient.fetchObject("me", User.class);

		Connection<Account> myAccounts = facebookClient.fetchConnection(
				"me/accounts", Account.class);

		String alert = "";
		List<FBPage> pages = new ArrayList<FBPage>();

		if (myAccounts.getData().size() == 0) {
			alert = "You don't have any pages created before, please create a new page";
		} else {
			List<Account> accounts = myAccounts.getData();
			for (Account account : accounts) {
				
				FBPage fbPage = new FBPage();
				
				FacebookClient client = new DefaultFacebookClient(
						account.getAccessToken(), VERSION_2_5);
				User page = client.fetchObject("me", User.class);
				fbPage.setName(page.getName());
				
				Connection<Post> posts = client.fetchConnection("me/feed",
						Post.class);
				
				Connection<Post> ads = client.fetchConnection(
						"me/promotable_posts", Post.class, Parameter.with("is_published", false));
				
				for (Post post : posts.getData()) {
//					Connection<Insight> insights = client.fetchConnection(
//							post.getId() + "/insights/post_impressions_unique", Insight.class);
					int views = 1;
//					for (Insight insight : insights.getData()) {
//						views += insight.getValues().get(0).getInt("value");
//					}
					FBPost regular = new FBPost(post.getMessage(), views, true);
					fbPage.addPost(regular);
				}
				System.out.println();
				for (Post ad : ads.getData()) {
//					Connection<Insight> insights = client.fetchConnection(
//							ad.getId() + "/insights/post_impressions_unique", Insight.class);
					int views = 1;
//					for (Insight insight : insights.getData()) {
//						views += insight.getValues().get(0).getInt("value");
//					}
					FBPost unpublished = new FBPost(ad.getMessage(), views, false);
					fbPage.addPost(unpublished);
				}
				pages.add(fbPage);
			}
		}
		request.setAttribute("noPage", alert);
		request.setAttribute("pages", pages);
		request.setAttribute("accessToken", accessToken);
		
		return mapping.findForward("success");
	}
}