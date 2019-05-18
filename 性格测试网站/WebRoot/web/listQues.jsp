<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>问卷调查</title>
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
		<link rel="stylesheet" type="text/css" href="${ctx }/web/page/style.css" />
		<link rel="stylesheet" type="text/css" href="${ctx }/web/page/simplePagination.css" />
		<script src="${ctx }/web/css/5grid/jquery.js"></script>
		<script src="${ctx }/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
		<script src="${ctx }/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
		<script src="${ctx }/web/css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none&amp;mobileUI.titleBarHeight=60&amp;mobileUI.openerWidth=52"></script>
		<!--[if IE 9]><link rel="stylesheet" href="${ctx }/web/css/style-ie9.css" /><![endif]-->
		<link rel="stylesheet" href="${ctx }/web/css/btn.css" />
		<script type="text/javascript">
		$(document).ready(function(){
		
			$("#firstpane .menu_body:eq(0)").show();
			$("#firstpane h3.menu_head").click(function(){
				$(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
				$(this).siblings().removeClass("current");
			});
			
			//$("#secondpane .menu_body:eq(0)").show();
			$("#secondpane h3.menu_head").mouseover(function(){
				$(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
				$(this).siblings().removeClass("current");
			});
			var noteMessage = "${noteMessage}";
			if(noteMessage!=""){
				alert(noteMessage);
				noteMessage="";
			}
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
				 <jsp:include page="./menu.jsp"><jsp:param value="list2" name="type"/> </jsp:include> 
			</div>

		<!-- Main -->

			<div id="main-wrapper" class="subpage">
				<div class="5grid-layout">
					<div class="row">
						<div class="3u">
						
							<!-- Sidebar -->
							
								<section>
										<h3 id="fh1" class="menu_head current">主题分类</h3>
										<div id="fd1" style="" class="menu_body">
											<c:forEach items="${voteTypeList }" var="item">
											<a href="${ctx}/com/queryQues.do?s_voteType.id=${item.id}">${item.name }</a>
											</c:forEach>
										</div>
								</section>

								 
						
						</div>
						<div class="9u mobileUI-main-content">
					
							<!-- Content -->
								 
									<article class="first" style="margin-top: 1px">
										<form action="${ctx}/com/queryQues.do">
											<select name="s_voteType.id"  style="height: 32px;font-size: 14px;background: #f1f1f1">
													<option value="">选择主题分类</option>
													<c:forEach items="${voteTypeList }" var="item">
														<option value="${item.id }">${item.name }</option>
													</c:forEach>
												</select>
											<input type="text" name="s_name" placeholder="输入主题名称" style="height: 32px;font-size: 14px" size=40/>
											<input type="submit" class="button blue medium" value="搜搜看">
										</form>
										 <table width="100%" style="margin-top: 20px">
										 	<thead>
										 	<tr style="background: #f1f1f1;font-weight: bold">
										 		<th align="left" width="10%">主题分类</th>
										 		<th align="left"  width="70%">主题名称</th>
										 	</tr>
										 	</thead>
										 	<tbody style="font-size: 13px">
										 	<c:if test="${empty SESSION_PAGE_WEB.list }"><tr><td colspan="3" style="color: blue">木有找到呢 -_-</td></tr></c:if>
										 	<c:forEach items="${SESSION_PAGE_WEB.list }" var="item">
										 		<tr>
										 		<td>${item.voteType.name }</td>
										 		<td align="left"><a href="${ctx }/com/getQues.do?uid=${item.id}" >${item.name }</a></td>
										 		</tr>
										 	</c:forEach>
										 	</tbody>
										 </table>
										 <div class="pagination-holder clearfix" style="margin-top: 20px">
												<div id="light-pagination" class="pagination"></div>
										</div>
									</article>	
								 
								 
						</div>
					</div>
				</div>
			</div>

		<!-- Footer -->

			  <jsp:include page="./footer.jsp"></jsp:include> 
<script type="text/javascript" src="${ctx }/web/page/jquery.simplePagination.js"></script>
<script type="text/javascript" >
$('#light-pagination').pagination({
	pages: ${SESSION_PAGE_WEB.totalPage},
	cssStyle: 'light-theme',
	displayedPages: 1,
	currentPage:${SESSION_PAGE_WEB.currentPageNumber},
	edges: 7
// 	onPageClick:function(pageNumber, event){window.location="${ctx}/com/queryForum.do?pageNum="+pageNumber;}
});
</script>
	</body>
</html>
<%session.removeAttribute("noteMessage");%>