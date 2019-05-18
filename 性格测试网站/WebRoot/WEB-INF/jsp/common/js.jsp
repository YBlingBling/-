<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<link href="${pageContext.request.contextPath}/themes/azure/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${pageContext.request.contextPath}/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${pageContext.request.contextPath}/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="${pageContext.request.contextPath}/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${pageContext.request.contextPath}/themes/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="${pageContext.request.contextPath}/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="${pageContext.request.contextPath}/js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/js/dwz.core.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.util.date.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.drag.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.tree.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.accordion.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.ui.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.theme.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.navTab.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.tab.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.resize.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.dialog.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.stable.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.ajax.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.pagination.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.database.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.effects.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.panel.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.history.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.combox.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/dwz.print.js" type="text/javascript"></script>
<!--
<script src="${pageContext.request.contextPath}/bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="${pageContext.request.contextPath}/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/highcharts.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/exporting.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	DWZ.init("${ctx }/themes/dwz.frag.xml", {
		loginUrl:"login_dialog.html", loginTitle:"登录",
//		loginUrl:"login.html",	
		statusCode:{ok:200, error:300, timeout:301}, 
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, 
		debug:false,	
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"${ctx }/themes"});
		}
	});
});

</script>