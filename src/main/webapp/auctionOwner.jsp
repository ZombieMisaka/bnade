<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<%@ include file="includes/meta.jsp"%>
<title>${owner} | ${realmName} | BNADE</title>
<%@ include file="includes/link.jsp"%>
</head>
<body>
	<jsp:include page="includes/header.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<a class="back" href="javascript:void(0)">
						<span class="glyphicon glyphicon-chevron-left"></span>
						${owner} | ${realmName}
					</a>				
				</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<table id="ownerAuctionTable" class="table table-hover" data-page-length="25">
					<thead>
						<tr>
							<th>#</th>
							<th>物品</th>
							<th>单价</th>
							<th>数量</th>
							<th>一口价</th>
							<th>竞价</th>
							<th>剩余时间</th>
							<th>更新时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${auctions}" var="auction" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>
								<a href="/page/auction/item/${auction.itemObj.id}">
									<img src="http://content.battlenet.com.cn/wow/icons/18/${auction.itemObj.icon}.jpg" alt="${auction.itemObj.name}"/> ${auction.itemObj.name}
								</a>
							</td>
							<td>${auction.unitPrice}</td>
							<td>${auction.quantity}</td>
							<td>${auction.price}</td>
							<td>${auction.bidGold}</td>
							<td>${auction.timeLeftCN}</td>
							<td><fmt:formatDate pattern="HH:mm" value="${auction.updated}"/></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="includes/footer.jsp"%>
	<%@ include file="includes/script.jsp"%>
	<script src="/js/jquery.dataTables.min.js"></script>
	<script src="/js/dataTables.bootstrap.min.js"></script>
	<script src="/js/dataTables.responsive.js"></script>
	<script src="//cdn.bootcss.com/highcharts/4.2.7/highstock.js"></script>
	<script>
	$('#ownerAuctionTable').DataTable({
		responsive : true,
		"language" : {
			"lengthMenu" : "每页显示 _MENU_ 条记录",
			"zeroRecords" : "数据未找到",
			"info" : "第_PAGE_页, 共_PAGES_页",
			"infoEmpty" : "找不到数据",
			"infoFiltered" : "(总数 _MAX_条)",
			"search" : "搜索:",
			"paginate" : {
				"first" : "首页",
				"last" : "末页",
				"next" : "下一页",
				"previous" : "上一页"
			},
		}
	});
	$(".back").click(function() {
		history.back();
	});
	</script>
</body>
</html>