<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${appTitle }</title>
 <%@ include file="./common/js.jsp"%>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<span   style="line-height:normal; color:white;font-size: 30px;font-weight: bold;margin-left: 210px;margin-top: 120px;text-align:center;">
				${appTitle }</span>
				<ul class="nav">
					<li  ><i class="fa fa-user-o"></i> ${SESSION_BEAN.user.user.userName} | <a href="${ctx }/com/logout.do"><i class="fa fa-sign-out"></i> 退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
				</ul>
			</div>
			<!-- navMenu -->
		</div>
		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>操作菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
						 <c:if test="${SESSION_BEAN.role=='SysUser' }">
						 	<div class="accordionHeader">
								<h2><i class="fa fa-cog fa-lg fa-fw"></i> 趣味测试</h2>
							</div>
							<div class="accordionContent">
								<ul class="tree">
									 <li><a href="${ctx}/sys/queryQu.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 趣味测试管理</a></li>
									 <li><a href="${ctx}/sys/queryQuScore.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 趣味测试分值管理</a></li>
									 <li><a href="${ctx}/sys/queryQuItem.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 趣味测试题目管理</a></li>
								</ul>
							</div>
						 	<div class="accordionHeader">
								<h2><i class="fa fa-cog fa-lg fa-fw"></i> 测试设置</h2>
							</div>
							<div class="accordionContent">
								<ul class="tree">
									 <li><a href="${ctx}/sys/queryPersonality.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 九人格列表</a></li>
									 <li><a href="${ctx}/sys/queryTransform.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 人格转换</a></li>
									 <li><a href="${ctx}/sys/queryVoteType.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 评测组列表</a></li>
									 <li><a href="${ctx}/sys/queryQuesType.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 题目组列表</a></li>
									 <li><a href="${ctx}/sys/queryQues.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 题目列表</a></li>
								</ul>
							</div>
						 	 
							 
							<div class="accordionHeader">
								<h2><i class="fa fa-cog fa-lg fa-fw"></i> 系统管理</h2>
							</div>
							<div class="accordionContent">
								<ul class="tree">
									 <li><a href="${ctx}/sys/querySimpleUser.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 用户列表</a></li>
									 <li><a href="${ctx}/sys/queryNews.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 查询管理</a></li>
								</ul>
							</div>
						</c:if>
						
						 
						<div class="accordionHeader">
								<h2><i class="fa fa-cog fa-lg fa-fw"></i> 个人资料</h2>
							</div>
						<div class="accordionContent">
							<ul class="tree">
								 <li><a href="${ctx}/com/toSelf.do" target="navTab" rel="mainquery"><i class="fa fa-table fa-fw"></i> 修改个人资料</a></li>
							</ul>
						</div>
						 
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent">
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div>
					<div class="tabsRight">right</div>
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="pageFormContent" layoutH="80" style="margin-right:230px">
							<p style="color:red">欢迎您: ${SESSION_BEAN.user.user.uname}&nbsp;&nbsp;&nbsp;
							</p>
							<p style="color:red"> </p>
									<div class="divider"></div>
									<h2> </h2>
									<p> </p>
									<div class="divider"></div>
									<h2> </h2>
									<div class="unit"></div>
									<div class="divider"></div>
									<h2></h2>
									<pre style="margin:5px;line-height:1.4em">
									</pre>
									<div class="divider"></div>
									<h2></h2>
									<pre style="margin:5px;line-height:1.4em;">
									</pre>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">Copyright &copy; 2019  ${appTitle } <a href="${ctx }/">返回首页</a> </div>
</body>
</html>