package com.pageManager.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.restfb.Connection;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;

import static com.restfb.Version.VERSION_2_5;

import com.restfb.types.Account;
import com.restfb.types.FacebookType;
import com.restfb.types.Insight;
import com.restfb.types.Page;
import com.restfb.types.Post;
import com.restfb.types.User;

import static java.lang.System.currentTimeMillis;

import java.util.Date;
import java.util.List;

public class ContentAction extends Action{
	
	public ActionForward execute(ActionMapping mapping,ActionForm form,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		String accessToken = request.getParameter("accessToken");
		
//		FacebookClient facebookClient = new DefaultFacebookClient(accessToken, VERSION_2_5);
//        User user = facebookClient.fetchObject("me", User.class);
//        System.out.println(user.getName());
//        System.out.println(user);
//
//        Connection<Account> myAccounts = facebookClient.fetchConnection("me/accounts", Account.class);
//        System.out.println("Count of my accounts: " + myAccounts.getData().size());
//
//        System.out.println();
//        System.out.println();
//        List<Account> accounts = myAccounts.getData();
//        Account a1 = accounts.get(0);
//        System.out.println(a1.getId());
//
//        FacebookClient client1 = new DefaultFacebookClient(a1.getAccessToken(), VERSION_2_5);
//        User user1 = client1.fetchObject("me", User.class);
//        System.out.println(user1.getName());
//        System.out.println(user1);
//        
//        Connection<Insight> insights = facebookClient.fetchConnection(a1.getId() + "/insights", Insight.class);
////      System.out.println("Count of account insights: " + insights.getData().size());
////      for (Insight insight : insights.getData()) {
////          System.out.println(insight.getName());
////      }
////      FacebookType publishMessageResponse
////              = client1.publish("me/feed", FacebookType.class,
////                      Parameter.with("message", "Second Post!!!"));
////      
////      FacebookType publishAdResponse
////              = client1.publish("me/feed", FacebookType.class,
////                      Parameter.with("message", "Second Advertisement!!!"), 
////                      Parameter.with("published", false));
////      
//      Connection<Post> posts = client1.fetchConnection("me/feed", Post.class);
//      Connection<Post> ads = client1.fetchConnection("me/promotable_posts", Post.class);
//
//      System.out.println("Count of posts: " + posts.getData().size());
////      for (Post post : posts.getData()) {
////          System.out.println(post);
////      }
//      
//      System.out.println("Count of ads: " + ads.getData().size());
////      for (Post ad : ads.getData()) {
////          System.out.println(ad);
////      }
//      Post p1 = posts.getData().get(1);
//      Connection<Insight> metrics = client1.fetchConnection(p1.getId() + "/insights", Insight.class);
//      for(Insight insight : metrics.getData()) {
//          System.out.println(insight.getTitle() + " || " + insight.getValues());
//      }
//      

        
		request.setAttribute("accessToken", accessToken);
		return mapping.findForward("success");
	}
	
}