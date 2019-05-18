<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">添加 人格转换 信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/addTransform.do" class="pageForm required-validate"
		enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<div class="pageFormContent" layoutH="97">
			<table>
				<tr>
					<td colspan="2">
						<dl>
							<dt>转换前人格：</dt>
							<dd>
								<select name="personality1.id" class=" ">
									<c:forEach items="${list }" var="item">
										<option value="${item.id }">第${item.id}种 ${item.name }</option>
									</c:forEach>
								</select>
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl>
							<dt>转换后人格：</dt>
							<dd>
								<select name="personality2.id" class=" ">
									<c:forEach items="${list }" var="item">
										<option value="${item.id }">第${item.id}种 ${item.name }</option>
									</c:forEach>
								</select>
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl>
							<dt>转换特征：</dt>
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
