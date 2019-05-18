<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">人格信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updatePersonality.do" class="pageForm required-validate"
		enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input type="hidden" value="${modifybean.id}" name="id" />
		<div class="pageFormContent" layoutH="97">
			<table>
				<tr>
					<td colspan="2">
						<dl>
							<dt>人格编号：</dt>
							<dd>${modifybean.id }</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl>
							<dt>人格名称：</dt>
							<dd>
								<input name="name" value="${modifybean.name}" type="text" class="required" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>测评分值范围：</dt>
							<dd>
								<input name="minScore" value="${modifybean.minScore}" type="text" size="4" class="required" />
								<input name="maxScore" value="${modifybean.maxScore}" type="text" size="4" class="required" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl>
							<dt>人格特征：</dt>
							<dd>
								<textarea rows="20" cols="100" name="note" class="required">${modifybean.note }</textarea>
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
