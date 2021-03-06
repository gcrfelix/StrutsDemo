package com.pageManager.action;

import static com.restfb.Version.VERSION_2_5;

import java.io.PrintWriter;
import java.util.List;

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
import com.restfb.types.Account;
import com.restfb.types.FacebookType;
import com.restfb.types.User;

public class PostAction extends Action {

	String accessToken;
	FacebookClient facebookClient;
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		if (request.getParameter("accessToken") != null) {
			accessToken = request.getParameter("accessToken");
			facebookClient = new DefaultFacebookClient(accessToken, VERSION_2_5);
		}

		String pageNo = request.getParameter("pageNo");
		String postType = request.getParameter("postType");
		String postContent = request.getParameter("postContent");
		String pageName = request.getParameter("pageName");
		
		boolean redirect = false;
		if(postContent != null && !postContent.equals("")) {
			User user = facebookClient.fetchObject("me", User.class);
			Connection<Account> myAccounts = facebookClient.fetchConnection(
					"me/accounts", Account.class);
			List<Account> accounts = myAccounts.getData();
			for (int i = 0; i < accounts.size(); i++) {
				if (Integer.parseInt(pageNo) == i) {
					if(pageName == null || pageName.equals("")) {
						pageName = accounts.get(i).getName();
					}
					FacebookClient client = new DefaultFacebookClient(accounts.get(
							i).getAccessToken(), VERSION_2_5);
					if (postType.equals("Published")) {
						FacebookType publishMessageResponse = client.publish(
								"me/feed", FacebookType.class,
								Parameter.with("message", postContent));
					} else {
						FacebookType publishAdResponse = client.publish("me/feed",
								FacebookType.class, Parameter.with("message",
										postContent), Parameter.with(
										"published", false));
					}
				}
			}
			redirect = true;
		}
		

		request.setAttribute("accessToken", accessToken);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageName", pageName);
		request.setAttribute("postType", postType);
		request.setAttribute("redirect", redirect);
		return mapping.findForward("success");
		
//		PrintWriter writer = response.getWriter();
//		writer.println("success");
//		writer.close();
//		return null;
	}

}