<%--
/**
 @author Amit Doshi
 */
--%>

<%@include file="/html/portlet/searchcontainer-with-tabs/init.jsp" %>

<!-- In order to display data in Pagination form we will use liferay default Search Container -->
<liferay-ui:search-container searchContainer="${userSearchContainer}"  >
	<!-- In order to get the total results and also to display no. of data -->	
	<liferay-ui:search-container-results total="<%=searchContainer.getTotal() %>" results="<%=searchContainer.getResults() %>" />
	<!-- Display Row with First Name,Last Name,ScreenName and Description as columns -->
   	<liferay-ui:search-container-row  className="com.liferay.portal.model.User" >
			<liferay-ui:search-container-column-text name="First Name" property="firstName"/>
	    	<liferay-ui:search-container-column-text name="Last Name"  property="lastName" />
    		<liferay-ui:search-container-column-text name="Screen Name" property="screenName" />
			<liferay-ui:search-container-column-text name="Job Title" property="jobTitle" />
	</liferay-ui:search-container-row>
	<!-- Iterating the Results -->
	<liferay-ui:search-iterator/>
</liferay-ui:search-container>