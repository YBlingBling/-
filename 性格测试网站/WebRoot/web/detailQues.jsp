<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>${item.voteType.name}</title>
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
						<form action="${ctx }/com/updateQuesCheck.do" method="post" id="voteform">
							<input type="hidden" name="uid" value="${item.id }" />
							<h3>${item.voteType.name}</h3>
							<c:forEach items="${item.quesList }" var="p1">
								<h4 style="margin-top: 20px; color: blue" ><a id="itemTitle_item_${p1.id }">${p1.title }</a></h4>
								<ul>
									<c:forEach items="${p1.itemList }" var="p2">
										<li><input type="${p1.checkTypeString }" name="item_${p1.id }" id="item_${p1.id }" value="${p2.id }" /> ${p2.name}</li>
									</c:forEach>
								</ul>
							</c:forEach>
							<input type="button" onclick="checkFormRadio()" value="提交结果" class="button black">
						</form>
					</article>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function checkFormRadio() {
			var count = 0;
			var radios = $("input[type='radio']");
			var first = null;
			//根据 name集合长度 遍历name集合  
			for (var i = 0; i < radios.length; i++) {
				var rid = radios[i].id;
				var list = $('input:radio[id="' + rid + '"]:checked').val();
				if (list == null) {
					count++;
					if (first == null) {
						first = rid;
					}
	
				}
	
			}
			var checkboxs = $("input[type='checkbox']");
			//根据 name集合长度 遍历name集合  
			for (var i = 0; i < checkboxs.length; i++) {
				var rid = checkboxs[i].id;
				var list = $('input:checkbox[id="' + rid + '"]:checked').val();
				if (list == null) {
					count++;
					if (first == null) {
						first = rid;
					}
	
				}
	
			}
			if (count > 0) {
				first = "itemTitle_" + first;
				if (!$("#" + first).length) {
					first = "elseitems";
				}
	
				alert("您还没有回答所有问题");
				$("html,body").animate({
					scrollTop : $("#" + first).offset().top
				}, 1000);
				return false;
			}
			$("#voteform").submit();
			return true;
		}
	</script>
	<!-- Footer -->
	<jsp:include page="./footer.jsp"></jsp:include>
	<c:if test="${not empty VoteErrorMessage}">
		<script type="text/javascript">
			$(function() {
				alert("${VoteErrorMessage}");
				if("请先登录后查看结果"=="${VoteErrorMessage}"){
					tologin("unsaved");
				}
			});
		</script>
	</c:if>
	<%
		session.removeAttribute("VoteErrorMessage");
	%>
</body>
</html>