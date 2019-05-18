<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>${appTitle }</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href="${ctx }/web/css/g.css" rel="stylesheet" />
		<link rel="stylesheet" href="${ctx }/web/css/5grid/core.css" />
		<link rel="stylesheet" href="${ctx }/web/css/5grid/core-desktop.css" />
		<link rel="stylesheet" href="${ctx }/web/css/5grid/core-1200px.css" />
		<link rel="stylesheet" href="${ctx }/web/css/5grid/core-noscript.css" />
		<link rel="stylesheet" href="${ctx }/web/css/style.css" />
		<link rel="stylesheet" href="${ctx }/web/css/style-desktop.css" />
		<script src="${ctx }/web/css/5grid/jquery.js"></script>
		<script src="${ctx }/web/css/5grid/init.js?use=mobile,desktop,1000px&amp;mobileUI=1&amp;mobileUI.theme=none&amp;mobileUI.titleBarHeight=60&amp;mobileUI.openerWidth=52"></script>
		<!--[if IE 9]><link rel="stylesheet" href="${ctx }/web/css/style-ie9.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->

			<div id="header-wrapper">
				 <jsp:include page="./menu.jsp"><jsp:param value="index" name="type"/> </jsp:include> 
			</div>

			<div id="main-wrapper"  >
				<div class="5grid-layout">
					
					<!-- Banner -->

						<div class="row">
							<div class="12u">
								<div id="banner">
									
									<a href="#"><img src="${ctx }/web/images/banner.jpg" alt="" /></a>
									<div class="caption">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="12u">
								 <table style="margin-left: 10px">
								 <tr>
									 <td onclick="showinfo(1)">第一型 <img alt="" src="${ctx }/web/images/1.jpg"></td>
									 <td onclick="showinfo(2)">第二型 <img alt="" src="${ctx }/web/images/2.jpg"></td>
									 <td onclick="showinfo(3)">第三型 <img alt="" src="${ctx }/web/images/3.jpg"></td>
									 <td onclick="showinfo(4)">第四型 <img alt="" src="${ctx }/web/images/4.jpg"></td>
									 <td onclick="showinfo(5)">第五型 <img alt="" src="${ctx }/web/images/5.jpg"></td>
									 <td onclick="showinfo(6)">第六型 <img alt="" src="${ctx }/web/images/6.jpg"></td>
									 <td onclick="showinfo(7)">第七型 <img alt="" src="${ctx }/web/images/7.jpg"></td>
									 <td onclick="showinfo(8)">第八型 <img alt="" src="${ctx }/web/images/8.jpg"></td>
									 <td onclick="showinfo(9)">第九型 <img alt="" src="${ctx }/web/images/9.jpg"> </td>
								 </tr>
								 </table>
							</div>
						</div>
				</div>
				 
				
			</div>
			<script type="text/javascript">
				function tosearch(){
					if($("#searchKey").val()==''){
						alert("请输入搜索关键字");$("#searchKey").focus();
						return;
					}
					$("#searchForm").submit();
				}
				function showinfo(id){
					var pagei = $.layer({
						   type: 1,   //0-4的选择,
						  title: false,
						  border: [10, 0.3, '#000'],
						  closeBtn: [0],
						  shadeClose: true,
						  area: ['800px', '500px'],
						  page: {
							  url:'${ctx}/com/getPersonalityInfo.do?uid='+id
						  }
						});
				}
			</script>
			
				 
		<jsp:include page="./footer.jsp"></jsp:include>
	</body>
</html>