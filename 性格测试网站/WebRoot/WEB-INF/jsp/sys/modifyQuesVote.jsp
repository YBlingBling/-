<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">修改 投票主题 信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updateQuesVote.do" class="pageForm required-validate"
		enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<input type="hidden" value="${modifybean.id}" name="id" />
		<input type="hidden" value="${modifybean.quesType.id}" name="quesType.id" />
		<div class="pageFormContent" layoutH="97">
			<table>
				<tr>
					<td colspan="2">
						<dl>
							<dt>分类：</dt>
							<dd>
								<select name="quesType.voteType.id" class="" id="updatesimpeeeele2222">
									<c:forEach items="${list }" var="item">
										<option value="${item.id }">${item.name }</option>
									</c:forEach>
								</select>
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl>
							<dt>单选多选?：</dt>
							<dd>
								<select name="checkType" class="" id="updatesimple2222222">
									<option value="单选">单选</option>
									<option value="多选">多选</option>
								</select>
							</dd>
						</dl>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<dl>
							<dt>题目名称：</dt>
							<dd>
								<input name="title" value="${modifybean.title}" type="text" class="required" size="80" />
							</dd>
						</dl>
					</td>
				</tr>
			</table>
			<div class="tabs">
				<div class="tabsHeader">
					<div class="tabsHeaderContent">
						<ul>
							<li class="selected"><a href="javascript:void(0)"><span>题目选项列表</span></a></li>
						</ul>
					</div>
				</div>
				<div class="tabsContent" style="height: 250px;">
					<div>
						<table class="list nowrap itemDetail" addButton="添加选项" width="100%">
							<thead>
								<tr>
									<th width="50px" type="text" name="" defaultVal="#index#" size="5" fieldClass="digits readonly">序号</th>
									<th type="text" name="items[#index#].name" size="100" fieldClass="required">选项</th>
									<th type="del" width="60">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${modifybean.itemList }" var="item" varStatus="vs">
									<tr>
										<td>${vs.count }</td>
										<td>${item.name }</td>
										<td>
											<a title="确实要删除这条记录吗?" target="ajaxTodo" href="${ctx}/sys/deleteQuesItem.do?ids=${item.id}">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tabsFooter">
					<div class="tabsFooterContent"></div>
				</div>
			</div>
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
<script type="text/javascript">
$("#updatesimpeeeele2222").val("${modifybean.quesType.voteType.id}");
$("#updatesimple2222222").val("${modifybean.checkType}");
</script>