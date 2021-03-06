<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:constants/><portal-core:defineObjects/> <portal-core:stateBase/>
<portal-core:lazy-set var="themeWebDAVBaseURI" elExpression="wp.themeList.current.metadata['com.ibm.portal.theme.template.ref']"/>
<portal-core:lazy-set var="currentNavNode" elExpression="wp.selectionModel.selected"/>
<title><c:out value='${wp.title}'/></title>
<portal-core:portletsHeadMarkupElements method="html" filter="title"/>
<portal-navigation:urlGeneration navigationNode='${wp.identification[currentNavNode]}'>
<link id="com.ibm.lotus.NavStateUrl" rel="alternate" href="<%wpsURL.write(escapeXmlWriter);%>" />
<link rel="bookmark" title='<c:out value='${currentNavNode.title}'/>' href='<%wpsURL.write(escapeXmlWriter);%>' hreflang="${wp.preferredLocale}"/>
</portal-navigation:urlGeneration>
<link href="/BCBSMA_Theme/themes/html/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="/BCBSMA_Theme/themes/html/s/app.css"/>
<script type="text/javascript" src="/BCBSMA_Theme/themes/html/assets/js/jquery-2.2.1.js"></script>
<script type="text/javascript" src="/BCBSMA_Theme/themes/html/assets/js/app.js"></script>