<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/display/init.jsp" %>

<div class="kb-display-tools">
	<c:if test="<%= enableRSS %>">
		<liferay-portlet:resourceURL id="groupKBArticlesRSS" varImpl="groupKBArticlesRSSURL" />

		<liferay-ui:rss
			delta="<%= rssDelta %>"
			displayStyle="<%= rssDisplayStyle %>"
			feedType="<%= rssFeedType %>"
			resourceURL="<%= groupKBArticlesRSSURL %>"
		/>
	</c:if>

	<c:if test="<%= DisplayPermission.contains(permissionChecker, scopeGroupId, ActionKeys.SUBSCRIBE) %>">
		<c:choose>
			<c:when test="<%= SubscriptionLocalServiceUtil.isSubscribed(user.getCompanyId(), user.getUserId(), KBArticle.class.getName(), scopeGroupId) %>">
				<liferay-portlet:actionURL name="unsubscribeGroupKBArticles" var="unsubscribeGroupKBArticlesURL">
					<portlet:param name="redirect" value="<%= redirect %>" />
				</liferay-portlet:actionURL>

				<liferay-ui:icon
					image="unsubscribe"
					label="<%= true %>"
					url="<%= unsubscribeGroupKBArticlesURL %>"
				/>
			</c:when>
			<c:otherwise>
				<liferay-portlet:actionURL name="subscribeGroupKBArticles" var="subscribeGroupKBArticlesURL">
					<portlet:param name="redirect" value="<%= redirect %>" />
				</liferay-portlet:actionURL>

				<liferay-ui:icon
					image="subscribe"
					label="<%= true %>"
					url="<%= subscribeGroupKBArticlesURL %>"
				/>
			</c:otherwise>
		</c:choose>
	</c:if>
</div>