<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>我的问卷调查</title>
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
		<script src="${ctx }/web/css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none&amp;mobileUI.titleBarHeight=60&amp;mobileUI.openerWidth=52"></script>
		<!--[if IE 9]><link rel="stylesheet" href="${ctx }/web/css/style-ie9.css" /><![endif]-->
		<link rel="stylesheet" href="${ctx }/web/css/btn.css" />
	</head>
	<body>

		<!-- Header -->

			<div id="header-wrapper">
				 <jsp:include page="./menu.jsp"><jsp:param value="list2" name="type"/> </jsp:include> 
			</div>

		<!-- Main -->

			<div id="main-wrapper" class="subpage">
				<div class="5grid-layout">
					<div class="row">
						<div class="3u">
						
							<!-- Sidebar -->
							
								<section>
									 
								</section>

								 
						
						</div>
<div class="9u mobileUI-main-content">
<article class="first" style="margin-top: 1px">
	<form action="${ctx }/com/updateQuesCheck.do" method="post">
		<input type="hidden" name="uid" value="${item.id }"/>
		 <h3>[${item.voteType.name}]${item.name }</h3>
		 <c:forEach items="${item.quesList }" var="p1">
		 	<h4 style="margin-top: 20px;color: blue;">${p1.title }</h4>
			 <ul>
				 <c:forEach items="${p1.itemList }" var="p2">
				 	<li id="mycheckli_${p2.id}"> <input type="${p1.checkTypeString }" disabled="disabled" id="mycheck_${p2.id}" name="item_${p1.id }" value="${p2.id }"/> ${p2.name}</li>
				 </c:forEach>
			 </ul>
		 </c:forEach>
	</form>
</article>
</div>
					</div>
					 
				</div>
			</div>

		<!-- Footer -->

			  <jsp:include page="./footer.jsp"></jsp:include> 
 <c:forEach items="${userList }" var="pp">
 	<script>
 	$("#mycheck_"+${pp.item.id}).attr("checked",true);
 	$("#mycheckli_"+${pp.item.id}).css("font-weight","bold");
 	</script>
 </c:forEach>
</body>
</html>