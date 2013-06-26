package com.blog.demo.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletConfig;
import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.portal.kernel.dao.search.SearchContainer;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.language.LanguageUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.JavaConstants;
import com.liferay.portal.kernel.util.ListUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;


/**
 * @author amit.doshi
 *
 */
public class UserUtil
{

	/**
	 * @param renderRequest
	 * @param renderResponse
	 */
	public static void searchContainerData(RenderRequest renderRequest,RenderResponse renderResponse)
	{
		PortletConfig portletConfig = (PortletConfig)renderRequest.getAttribute(JavaConstants.JAVAX_PORTLET_CONFIG);
		ThemeDisplay themeDisplay = (ThemeDisplay)renderRequest.getAttribute(WebKeys.THEME_DISPLAY);
		List<User> userList = new ArrayList<User>();
		
		Map<String,String> paramMap= new HashMap<String,String>();
		paramMap.put(Constants.TAB_PARAM, Constants.TAB_2);

		/*
		 * Creating IteratorURL and in that we will pass tab parameter
		 */
		PortletURL iteratorURL= renderResponse.createRenderURL();
		Iterator<Map.Entry<String, String>> entries = paramMap.entrySet().iterator();
		while (entries.hasNext()) {
			Map.Entry<String, String> entry = entries.next();
			iteratorURL.setParameter(entry.getKey(), entry.getValue());
		}

		/*
		 * Creating SearchContainer
		 */
		SearchContainer<User> searchContainer = new SearchContainer<User>(renderRequest, null,
				null, SearchContainer.DEFAULT_CUR_PARAM, ParamUtil.getInteger(renderRequest,  SearchContainer.DEFAULT_DELTA_PARAM, 10),
				iteratorURL, null, LanguageUtil.get(portletConfig, themeDisplay.getLocale(), "No Users were Found"));
		int total = 0;
		try {
			/*
			 * Fetching all the User from the Current Company and added that into the userList
			 */
			userList = UserLocalServiceUtil.getCompanyUsers(themeDisplay.getCompanyId(), -1, -1);
			total = userList.size();

		} catch (SystemException e) {
			SessionErrors.add(renderRequest, SystemException.class.getName());
		}
		 /*
		  * Sub listing the userList depending on the delta parameter we have set in the SearchContainer.
		  */
		userList = ListUtil.subList(userList, searchContainer.getStart(), searchContainer.getEnd());

		searchContainer.setTotal(total);
		searchContainer.setResults(userList);
		renderRequest.setAttribute("userSearchContainer", searchContainer);

	}
}
