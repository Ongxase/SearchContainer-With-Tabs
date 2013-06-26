<%--
/**
 @author Amit Doshi
 */
--%>


<%@include file="/html/portlet/searchcontainer-with-tabs/init.jsp" %>

<!-- Making the Render URL and we are passing TAB parameter -->

<liferay-portlet:renderURL var="portletURL">
	<liferay-portlet:param name="<%=Constants.TAB_PARAM%>" value="${tabs}"></liferay-portlet:param>
</liferay-portlet:renderURL>

<!-- Setting the Values for the tab1 and tab2  -->
<c:set var="tab1" value="<%=Constants.TAB_1%>" />
<c:set var="tab2" value="<%=Constants.TAB_2%>" />

<!-- Using default Liferay UI Tab in order to show the Tab View -->
<liferay-ui:tabs names="UserGroup,User" param="<%=Constants.TAB_PARAM%>" refresh="<%= true %>" url="<%=portletURL %>"   >
	
	<!-- We are going to display two tabs so there will be two Sections in the Tab -->
	<liferay-ui:section>
		<c:if test="${tabs eq tab1 }">
			<%@include file="/html/portlet/searchcontainer-with-tabs/tabs/usergroup.jsp" %>
		</c:if>
	</liferay-ui:section>
	<liferay-ui:section>
		<c:if test="${tabs eq tab2}">
			<%@include file="/html/portlet/searchcontainer-with-tabs/tabs/user.jsp" %>
		</c:if>
	</liferay-ui:section>
	
</liferay-ui:tabs> 