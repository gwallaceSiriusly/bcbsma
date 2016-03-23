<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<ul class="children">
	<c:forEach var="subnode" items="${wp.navigationModel.children[topnode]}" varStatus="status" step="1">
		<c:set var="nodeID" value="${wp.identification[subnode]}"/>
		<li class="<c:if test="${wp.navigationModel.hasChildren[subnode]}"> page_item_has_children</c:if>">
			<a href="?uri=nm:oid:${nodeID}" class="wpthemeLeft<c:if test="${childrenStatus.count == 1}"> wpthemeFirst</c:if>">
				<span lang="${subnode.title.xmlLocale}" dir="${subnode.title.direction}">
					<c:choose>
						<c:when test="${subnode.projectID != null}">(<c:choose><c:when test="${isHiddenPage}">[<c:out value="${subnode.title}"/>]</c:when><c:otherwise><c:out value="${subnode.title}"/></c:otherwise></c:choose>)</c:when><c:when test="${isHiddenPage}">[<c:out value="${subnode.title}"/>]</c:when><c:otherwise><c:out value="${subnode.title}"/></c:otherwise></c:choose>
			</a>
			
			<c:if test="${wp.navigationModel.hasChildren[subnode]}">
				<c:set var="topnode" value="${subnode}" scope="request"/>
				<jsp:include page="buildNavigation.jsp"/>
			</c:if>
		</li>
	</c:forEach>

</ul>