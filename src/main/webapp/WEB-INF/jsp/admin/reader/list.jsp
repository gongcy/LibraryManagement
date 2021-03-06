<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>读者列表</title>
<script type="text/javascript">
	$(function() {
		$(".delete-obj-href").deleteFun();
	});
</script>
</head>
<body>
	<div class="header lighter smaller blue">
		<h3><span class="glyphicon glyphicon-th-list"></span>&nbsp;读者列表<small>（${datas.total}）</small></h3>
		<jsp:include page="nav.jsp"/>
	</div>
	
	<div>
		<jsp:include page="/filter/Reader_hql.jsp"/>
	</div>
	<div class="table-responsive">
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th>证件号</th>
					<th>姓名</th>
					<th>身份证号</th>
					<th>电话</th>
					<th>联系地址</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${datas.datas}" var="obj">
					<tr>
						<td>${obj.cardNo}</td>
						<td>${obj.name}</td>
						<td>${obj.identity}</td>
						<td>${obj.phone}</td>
						<td>${obj.address}</td>
						<td>
							<div class="action-buttons">
								<a class="green auth" sn="ReaderController.update" title="修改" href="<%=request.getContextPath()%>/admin/reader/update/${obj.id}">
									<i class="icon-pencil bigger-130"></i>
								</a>

								<a class="delete-obj-href red auth" sn="ReaderController.delete" title="此操作不可逆，确定删除【${obj.name}】吗？" href="<%=request.getContextPath()%>/admin/reader/delete/${obj.id}">
									<i class="icon-trash bigger-130"></i>
								</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<jsp:include page="/common_jsp/pager.jsp" >
							<jsp:param value="${datas.total}" name="totalRecord"/>
							<jsp:param value="list" name="url"/>
						</jsp:include>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>