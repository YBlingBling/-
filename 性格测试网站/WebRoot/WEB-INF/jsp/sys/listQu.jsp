<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<form id="pagerForm" method="post" action="${ctx}/sys/query${actionclass}.do">
	<input type="hidden" name="pageNum" value="" />
</form>

<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="${ctx}/sys/query${actionclass}.do" method="post">
	<div class="searchBar">
		<table>
			<tr>
			<td><span style="margin-left: 5px">主题:</span><input  type="text" name="s_title" value=""/></td>
			<td>
			<div class="buttonActive" style="margin-left: 10px"><div class="buttonContent"><button type="submit"><i class="fa fa-search"></i>  检索</button></div></div>
			</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${ctx}/sys/add2${actionclass}.do" target="navTab"  rel="baseAdd" title="添加${actionname}信息"> <span>添加</span></a></li>
			<li><a class="edit" href="${ctx}/sys/get${actionclass}.do?uid={sid_select}" target="navTab" rel="baseAdd" warn="请选择一条信息,点击需要修改的行" title="${actionname}信息"><span>修改</span></a></li>
			<li><a title="确实要删除这些信息吗?" target="selectedTodo" rel="ids" postType="string" href="${ctx}/sys/delete${actionclass}.do" class="delete" warn="请选择需要删除的信息"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="112">
		<thead>
			<tr>
				<th width="2%"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="100">主题</th>

				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${SESSION_PAGE.list}" var="item">
			<tr target="sid_select" rel="${item.id }">
				<td><input name="ids" value="${item.id }" type="checkbox"></td>
				<td>${item.title}</td>

				<td width="100">
					<a title="${actionname}信息" href="${ctx}/sys/get${actionclass}.do?uid=${item.id}" target="navTab" rel="baseAdd"><i class="fa fa-edit fa-1x"></i>详细</a>
					<a title="确实要删除这条记录吗?" href="${ctx}/sys/delete${actionclass}.do?ids=${item.id}" target="ajaxTodo" style="margin-left: 5px;color:red"><i class="fa fa-trash fa-1x red"></i>删除</a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>共${SESSION_PAGE.totalNumber}条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="${SESSION_PAGE.totalNumber}" numPerPage="${SESSION_PAGE.itemsPerPage}" pageNumShown="10" currentPage="${SESSION_PAGE.currentPageNumber}"></div>
	</div>
</div>
<%@ include file="../common/clear.jsp"%>
