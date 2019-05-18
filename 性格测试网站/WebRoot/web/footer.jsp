<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<div id="footer-wrapper">
	<footer class="5grid-layout" id="site-footer">
		<div class="row">
			<div class="3u">
				<section class="first">
					<h2>专业服务</h2>
					<ul class="link-list">
						<li><a href="#">免费注册</a>
						<li><a href="#">初次访问必读</a>
						<li><a href="#">服务流程</a>
						<li><a href="#">快速咨询</a>
						<li><a href="#">VIP服务</a>
						<li><a href="#">更多专业问题</a>
					</ul>
				</section>
			</div>
			<div class="3u">
				<section>
					<h2>相关说明</h2>
					<ul class="link-list">
						<li><a href="#">如何入驻</a>
						<li><a href="#">广告服务</a>
						<li><a href="#">工作流程</a>
						<li><a href="#">服务指南</a>
						<li><a href="#">客服反馈</a>
						<li><a href="#">侵权投诉</a>
					</ul>
				</section>
			</div>
			<div class="3u">
				<section>
					<h2>关于我们</h2>
					<ul class="link-list">
						<li><a href="#">关于我们</a>
						<li><a href="#">联系我们</a>
						<li><a href="#">官方招聘</a>
						<li><a href="#">法律声明</a>
						<li><a href="#">网站地图</a>
						<li><a href="#">公益活动</a>
					</ul>
				</section>
			</div>
			<div class="3u">
				<section class="last">
					<h2>手机APP</h2>
					<ul class="link-list">
						<li>微信扫码，服务无处不在<br/>
						<img alt="" src="${ctx}/web/images/1553769064.png" style="max-width: 60%" onerror="javascript:this.src='${ctx}/resource/no.jpg'">
						</a>
					</ul>
				</section>
			</div>
		</div>
		<div class="row">
			<div class="12u">
				<div id="copyright" style="font-size: 14px">
					&copy; 2019. All rights reserved. ${appTitle } <a href="${ctx}/index.jsp">后台管理</a>
				</div>
			</div>
		</div>
	</footer>
</div>
<script>
var errorMessage = "${errorMessage}";
if(errorMessage!=""){
	alert(errorMessage);
}
</script>
<% session.removeAttribute("errorMessage"); %>