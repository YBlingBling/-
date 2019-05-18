<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">添加 ${actionname} 信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/add${actionclass}.do" class="pageForm required-validate"
		enctype="multipart/form-data" onsubmit="return iframeCallback(this,navTabAjaxDone)">
		<div class="pageFormContent" layoutH="97">
			<table width="100%">
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>主题：</dt>
							<dd>
								<input name="title" value="${modifybean.title}" size="100" type="text" class="required" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>图片：</dt>
							<dd>
								<input name="resfile1" value="" type="file" class="required" />
							</dd>
						</dl>
					</td>
				</tr>
			</table>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">
								<i class="fa fa-save"></i> 提 交
							</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="reset" class="reset">
								<i class="fa fa-eraser"></i> 重 置
							</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>
