<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>${appTitle }</title>
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
		
		<script type="text/javascript">
		$(document).ready(function(){
		
			$("#firstpane .menu_body:eq(0)").show();
			$("#firstpane h3.menu_head").click(function(){
				$(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
				$(this).siblings().removeClass("current");
			});
			
			$("#secondpane .menu_body:eq(0)").show();
			$("#secondpane h3.menu_head").mouseover(function(){
				$(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
				$(this).siblings().removeClass("current");
			});
			
		});
		</script>
		<style type="text/css">
		.menu_list{width:268px;margin:0 auto;}
		.menu_head{height:47px;line-height:47px;padding-left:38px;font-size:14px;color:#525252;cursor:pointer;border:1px solid #e1e1e1;position:relative;margin:0px;font-weight:bold;background:#f1f1f1 url(images/pro_left.png) center right no-repeat;}
		.menu_list .current{background:#f1f1f1 url(images/pro_down.png) center right no-repeat;}
		.menu_body{line-height:38px;border-left:1px solid #e1e1e1;backguound:#fff;border-right:1px solid #e1e1e1;}
		.menu_body a{display:block;height:38px;line-height:38px;padding-left:38px;color:#777777;background:#fff;text-decoration:none;border-bottom:1px solid #e1e1e1;}
		.menu_body a:hover{text-decoration:none;}
		</style>
	</head>
	<body>

		<!-- Header -->

			<div id="header-wrapper">
				 <jsp:include page="./menu.jsp"><jsp:param value="list${menu}" name="type"/> </jsp:include> 
			</div>

		<!-- Main -->

			<div id="main-wrapper" class="subpage">
				<div class="5grid-layout">
					<div class="row">
						<div class="3u">
						
							<!-- Sidebar -->
							
								<section>
								<div id="firstpane" class="menu_list">
									<c:if test="${menu==1 }">
										<h3 id="fh1" class="menu_head">网站介绍</h3>
										<div id="fd1" style="display:none" class="menu_body">
											<a href="${ctx}/com/list.do?type=1&menu=1">简介</a>
											<a href="${ctx}/com/list.do?type=2&menu=1">组织机构</a>
											<a href="${ctx}/com/list.do?type=3&menu=1">发展规划</a>
										</div>
									</c:if>
									<c:if test="${menu==2 }">
										<h3 id="fh1" class="menu_head">网站介绍</h3>
										<div id="fd1" style="display:none" class="menu_body">
											<a href="${ctx}/com/list.do?type=1&menu=1">简介</a>
											<a href="${ctx}/com/list.do?type=2&menu=1">组织机构</a>
											<a href="${ctx}/com/list.do?type=3&menu=1">发展规划</a>
										</div>
									</c:if>
									
								</div>
								</section>
						</div>
						<div class="9u mobileUI-main-content">
					
							<!-- Content -->
									
								<article class="first" style="margin-top: 0px">
									<ul class="link-list-sub">
										<c:forEach items="${list }" var="item">
											<li>[${item.newsType.name }] <a target="blank" href="${ctx }/com/getNews.do?type=${type}&uid=${item.id}">${item.title }</a></li>
										</c:forEach>
									</ul>
								</article>				
						</div>
					</div>
				</div>
			</div>

		<!-- Footer -->

			  <jsp:include page="./footer.jsp"></jsp:include> 

	</body>
</html>