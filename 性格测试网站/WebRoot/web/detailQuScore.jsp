<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>评测结果</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link href="${ctx }/web/css/g.css" rel="stylesheet" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core.css" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core-desktop.css" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core-1200px.css" />
<link rel="stylesheet" href="${ctx }/web/css/5grid/core-noscript.css" />
<link rel="stylesheet" href="${ctx }/web/css/style.css" />
<link rel="stylesheet" href="${ctx }/web/css/style-desktop.css" />
<script src="${ctx }/web/css/5grid/jquery.js"></script>
<script
	src="${ctx }/web/css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none&amp;mobileUI.titleBarHeight=60&amp;mobileUI.openerWidth=52"></script>
<!--[if IE 9]><link rel="stylesheet" href="${ctx }/web/css/style-ie9.css" /><![endif]-->
<link rel="stylesheet" href="${ctx }/web/css/btn.css" />
<style type="text/css">
pre {
	white-space: pre-wrap; /* css-3 */
	white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
	white-space: -pre-wrap; /* Opera 4-6 */
	white-space: -o-pre-wrap; /* Opera 7 */
	word-wrap: break-word; /* Internet Explorer 5.5+ */
}
</style>
</head>
<body>
	<!-- Header -->
	<div id="header-wrapper">
		<jsp:include page="./menu.jsp"><jsp:param value="qu" name="type" />
		</jsp:include>
	</div>
	<!-- Main -->
	<div id="main-wrapper" class="subpage">
		<div class="5grid-layout">
			<div class="row">
				<div class="3u">
					<!-- Sidebar -->
					<section></section>
				</div>
				<div class="9u mobileUI-main-content">
					<article class="first" style="margin-top: 1px;">
						<h3>[趣味测试] ${item.title }</h3>
						<pre style="font-size: 16px">测试分值: ${score}</pre>
						<br />
						<c:if test="${not empty scoreItem }">
							<pre style="font-size: 16px">测试结果: ${scoreItem.note}</pre>
						</c:if>
						<c:if test="${empty scoreItem }">
							<pre style="font-size: 16px">没有查询到测试结果</pre>
						</c:if>
					</article>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="./footer.jsp"></jsp:include>
	<c:if test="${not empty VoteErrorMessage}">
		<script type="text/javascript">
			$(function() {
				alert("${VoteErrorMessage}");
			});
		</script>
	</c:if>
	<%
		session.removeAttribute("VoteErrorMessage");
	%>
</body>
</html>