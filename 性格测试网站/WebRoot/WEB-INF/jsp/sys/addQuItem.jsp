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
							<dt>测试：</dt>
							<dd>
								<select name="qu.id" class="" id="d1557793828046-1878085188">
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
							<dt>问题：</dt>
							<dd>
								<input name="title" value="${modifybean.title}" size="100" type="text" class="required" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>答案1：</dt>
							<dd>
								<input name="option1" value="${modifybean.option1}" size="100" type="text" class="required" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>答案1分值：</dt>
							<dd>
								<input name="score1" value="${modifybean.score1}" type="text" class="required digits" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>答案2：</dt>
							<dd>
								<input name="option2" value="${modifybean.option2}" size="100" type="text" class="required" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>答案2分值：</dt>
							<dd>
								<input name="score2" value="${modifybean.score2}" type="text" class="required digits" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>答案3：</dt>
							<dd>
								<input name="option3" value="${modifybean.option3}" size="100" type="text" class="required" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>答案3分值：</dt>
							<dd>
								<input name="score3" value="${modifybean.score3}" type="text" class="required digits" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>答案4：</dt>
							<dd>
								<input name="option4" value="${modifybean.option4}" size="100" type="text" class="required" />
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl class="nowrap">
							<dt>答案4分值：</dt>
							<dd>
								<input name="score4" value="${modifybean.score4}" type="text" class="required digits" />
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
