<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">${actionname}信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/update${actionclass}.do" class="pageForm required-validate"
		enctype="multipart/form-data" onsubmit="return iframeCallback(this,navTabAjaxDone)">
		<input type="hidden" value="${modifybean.id }" name="id">
		<div class="pageFormContent" layoutH="97">
			<table width="100%">
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>测试：</dt>
							<dd>
								<select name="qu.id" class="" id="d15577938280551708922363">
									<c:forEach items="${list }" var="item">
										<option value="${item.id }">${item.title}</option>
									</c:forEach>
								</select>
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>起始值：</dt>
							<dd>
								<input name="minscore" value="${modifybean.minscore}" type="text" class="required digits" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>最大值：</dt>
							<dd>
								<input name="maxscore" value="${modifybean.maxscore}" type="text" class="required digits" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>结果：</dt>
							<dd>
								<input name="note" value="${modifybean.note}" size="100" type="text" class="required" />
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
<script type="text/javascript">
$("#d15577938280551708922363").val("${modifybean.qu.id}");

</script>
