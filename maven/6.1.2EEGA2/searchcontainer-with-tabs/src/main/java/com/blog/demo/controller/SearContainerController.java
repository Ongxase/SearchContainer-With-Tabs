package com.blog.demo.controller;

import java.io.IOException;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.blog.demo.util.Constants;
import com.blog.demo.util.UserGroupUtil;
import com.blog.demo.util.UserUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;


/**
 * @author amit.doshi
 *
 */
/**
 * @author amit.doshi
 *
 */
public class SearContainerController extends MVCPortlet
{
	
	/* (non-Javadoc)
	 * @see com.liferay.util.bridges.mvc.MVCPortlet#doView(javax.portlet.RenderRequest, javax.portlet.RenderResponse)
	 */
	@Override
	public void doView(RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {
		String tabName= ParamUtil.getString(renderRequest, Constants.TAB_PARAM,Constants.TAB_1);

		/**
		 *  Depending on the parameter tabName, it will create searchcontainer 
		 */
		if(tabName.equals(Constants.TAB_1))
		{
			UserGroupUtil.searchContainerData(renderRequest, renderResponse);
		}else if(tabName.equals(Constants.TAB_2))
		{
			UserUtil.searchContainerData(renderRequest, renderResponse);
		}
		this.include(viewTemplate, renderRequest, renderResponse);
	}
}
