<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>测试完毕</title>
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
<script type="text/javascript">
	function countDown(secs, surl) {
		//alert(surl);    
		var jumpTo = document.getElementById('jumpTo');
		jumpTo.innerHTML = secs;
		if (--secs > 0) {
			setTimeout("countDown(" + secs + ",'" + surl + "')", 1000);
		} else {
			location.href = surl;
		}
	}
</script>
</head>
<body>
	<!-- Header -->
	<div id="header-wrapper">
		<jsp:include page="./menu.jsp"><jsp:param value="list2" name="type" />
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
					<article class="first" style="margin-top: 1px">
						答题完毕并于 <span id="jumpTo" style="color: red">5</span> 秒后跳转到测试结果页面
						<script type="text/javascript">countDown(5, '${ctx}/com/showResult.do');
						</script>
					</article>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="./footer.jsp"></jsp:include>
</body>
</html>