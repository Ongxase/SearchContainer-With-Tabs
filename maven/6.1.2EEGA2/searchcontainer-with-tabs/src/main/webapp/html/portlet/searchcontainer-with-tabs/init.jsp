<%--
/**
 @author Amit Doshi
 */
--%>


<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>


<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="java.util.List" %>
<%@page import="javax.portlet.PortletURL"%>
<%@page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow" %>
<%@ page import="com.liferay.portal.kernel.dao.search.SearchEntry" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<%@ page import="com.liferay.portal.kernel.dao.search.*" %>
<%@ page import="com.liferay.portal.model.*" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="com.liferay.portal.kernel.workflow.WorkflowConstants" %>

<%@ page import="com.blog.demo.util.Constants" %>
<%@ page import="com.liferay.portal.service.UserLocalServiceUtil" %>

<portlet:defineObjects />
<liferay-theme:defineObjects />