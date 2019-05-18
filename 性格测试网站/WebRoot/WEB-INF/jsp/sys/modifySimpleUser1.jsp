<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<h2 class="contentTitle">学生 信息</h2>
<div class="pageContent">
	<form method="post" action="${ctx}/sys/updateSimpleUser.do" class="pageForm required-validate" enctype="multipart/form-data" onsubmit="return iframeCallback(this)">
		<div class="pageFormContent" layoutH="97">
			<table>
					<tr>
						<td colspan="2"><dl>
							<dt>学号：</dt>
							<dd>${modifybean.user.uname }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>姓名：</dt>
							<dd>${modifybean.user.userName }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>性别：</dt>
							<dd>${modifybean.user.userGender}
							</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>联系电话：</dt>
							<dd>${modifybean.user.userPhone }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>邮箱：</dt>
							<dd>${modifybean.user.userEmail }</dd>
							</dl></td>
					</tr>
					
					<tr>
						<td colspan="2"><dl>
							<dt>出生日期：</dt>
							<dd>${modifybean.user.userBirth }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>联系地址：</dt>
							<dd>${modifybean.user.userAddress }</dd>
							</dl></td>
					</tr>
					<tr>
						<td colspan="2"><dl>
							<dt>个人简介：</dt>
							<dd>
								<textarea name="note" rows="20" cols="100">${modifybean.note }</textarea>
							</dd>
							</dl></td>
					</tr>
				</table>
		</div>
		 
	</form>
</div>
