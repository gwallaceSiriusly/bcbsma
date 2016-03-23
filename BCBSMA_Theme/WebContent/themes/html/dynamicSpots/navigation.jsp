<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>

<portal-core:lazy-set var="selectionPath" elExpression="wp.selectionModel.selectionPath"/>
<portal-core:lazy-set var="themeConfig" elExpression="wp.themeConfig"/>
<portal-core:lazy-set var="showHiddenPages" elExpression=="wp.publicRenderParam['{http://www.ibm.com/xmlns/prod/websphere/portal/publicparams}hiddenPages']" />

<c:set var="selectedNodeID" value="${wp.identification[wp.selectionModel.selected]}" />
<c:set var="selectionPathLength" value="${fn:length(selectionPath)}" />
<portal-logic:if deviceClass="smartphone/tablet">
	<c:set var="isMobile" value="true"/>
</portal-logic:if>

<c:if test="${!empty parentNode}">
	<c:set var="selectionPath" value="${wp.selectionModel.selectionPath[parentNode]}" />
</c:if>
<ul class="vertical medium-horizontal menu align-right">
	<c:out value="${rootLevel}"/>
	
	<c:forEach var="node" items="${wp.navigationModel.children[selectionPath[param.rootLevel]]}" varStatus="status" step="1">
        <c:set var="isHiddenPage" value="${node.metadata['com.ibm.portal.Hidden'] || (isMobile && node.metadata['com.ibm.portal.mobile.Hidden'])}" />
        <c:if test="${!isHiddenPage || showHiddenPages}">
			<c:set var="nodeID" value="${wp.identification[node]}"/>
			<li>
				<a href="?uri=nm:oid:${nodeID}" class="wpthemeLeft<c:if test="${childrenStatus.count == 1}"> wpthemeFirst</c:if>"><span lang="${node.title.xmlLocale}" dir="${node.title.direction}"><c:choose><c:when test="${node.projectID != null}">(<c:choose><c:when test="${isHiddenPage}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose>)</c:when><c:when test="${isHiddenPage}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></a>
				<portal-dynamicui:closePage node="${node}"><a class="wpthemeClose wpthemeLeft" href="<%closePageURL.write(out);%>"><img alt="" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=="/><span class="wpthemeAltText"><portal-fmt:text key="theme.close" bundle="nls.commonUI"/></span></a></portal-dynamicui:closePage>
				
				<c:if test="${wp.navigationModel.hasChildren[node]}">
					<c:set var="topnode" value="${node}" scope="request"/>
					<jsp:include page="buildNavigation.jsp"/>
				</c:if>
				
			</li>
		</c:if>
	</c:forEach>
</ul>

