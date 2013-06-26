<%--
/**
 @author Amit Doshi
 */
--%>

<%@include file="/html/portlet/searchcontainer-with-tabs/init.jsp" %>

<!-- In order to display data in Pagination form we will use liferay default Search Container -->
<liferay-ui:search-container searchContainer="${userGroupSearchContainer}"  >
	<!-- In order to get the total results and also to display no. of data -->	
	<liferay-ui:search-container-results total="<%=searchContainer.getTotal() %>"  results="<%=searchContainer.getResults() %>" />
	<!-- Display Row with Name and Description as columns -->
	<liferay-ui:search-container-row className="com.liferay.portal.model.UserGroup" keyProperty="userGroupId" modelVar="userGroup"  >
		<liferay-ui:search-container-column-text name="Name" property="name"  />
        <liferay-ui:search-container-column-text name="Description" property="description"  />
	</liferay-ui:search-container-row>
    <!-- Iterating the Results -->
    <liferay-ui:search-iterator/>
</liferay-ui:search-container>