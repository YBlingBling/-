<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">修改 投票分类 信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updateVoteType.do" class="pageForm required-validate"
		enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input type="hidden" value="${modifybean.id}" name="id" />
		<div class="pageFormContent" layoutH="97">
			<table>
				<tr>
					<td colspan="2">
						<dl>
							<dt>分类名称：</dt>
							<dd>
								<input name="name" value="${modifybean.name}" type="text" class="required" size="80" />
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
								<i class="fa fa-eraser"></i> 重置
							</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>
