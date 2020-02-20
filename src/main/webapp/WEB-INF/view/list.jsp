<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/resource/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="/resource/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="container form-inline" style="margin-top: 50px">

		<form action="selects" method="post">
			<input type="hidden" name="pageNum"> 发布日期:<input type="text"
				onclick="WdatePicker()" class="form-control" autocomplete="off"
				name="startDate" value="${con.startDate}"> --<input
				type="text" onclick="WdatePicker()" class="form-control"
				autocomplete="off" name="endDate" value="${con.endDate}">
			排序: <select class="form-control" name="orderName">
				<option value="">请选择排序内容</option>
				<option value="created"
					${con.orderName == 'created' ? 'selected' : '' }>按发布时间</option>
				<option value="user_id"
					${con.orderName == 'user_id' ? 'selected' : '' }>按作者Id</option>
				<option value="hits"
					${con.orderName == 'hits' ? 'selected' : '' }>按点击量</option>
			</select> <select class="form-control" name="orderMethod">
				<option value="asc" ${con.orderMethod == 'asc' ? 'selected' : '' }>升序</option>
				<option value="desc" ${con.orderMethod == 'desc' ? 'selected' : '' }>倒序</option>
			</select> <input type="submit" value="查询" class="btn btn-primary">
		</form>
		<table class="table" style="margin-top: 20px">
			<tr>
				<th>title</th>
				<th>created</th>
				<th>userId</th>
				<th>hot</th>
				<th>hits</th>
			</tr>
			<c:forEach items="${info.list}" var="a">
				<tr>
					<td>${a.title }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
							value="${a.created }" /></td>
					<td>${a.userId }</td>
					<td>${a.hot }</td>
					<td>${a.hits }</td>
				</tr>
			</c:forEach>
		</table>
		<nav aria-label="...">
		<ul class="pagination">
			<li class="page-item disabled"><button onclick="goPage(1)"
					class="btn btn-light">首页</button></li>
			<li class="page-item disabled"><button
					onclick="goPage(${info.prePage == 0 ? pageNum : info.prePage})"
					class="btn btn-light">Previous</button></li>

			<c:forEach begin="${info.pageNum - 2 > 1 ? info.prePage - 2 : 1}"
				end="${info.pageNum + 2 > info.pages ? info.pages : info.pageNum + 2}"
				varStatus="index">
				<c:if test="${info.pageNum != index.index}">
					<li class="page-item"><button type="button"
							class="btn btn-light" onclick="goPage(${index.index})">${index.index}</button></li>
				</c:if>
				<c:if test="${info.pageNum == index.index}">
					<li class="page-item"><button type="button"
							class="btn btn-primary" onclick="goPage(${index.index})">${index.index}</button></li>
				</c:if>
			</c:forEach>

			<li class="page-item"><button type="button"
					class="btn btn-light"
					onclick="goPage(${info.pageNum == info.pages ? info.pages : info.pageNum +1})">Next</button></li>
			<li class="page-item"><button type="button"
					class="btn btn-light" onclick="goPage(${info.pages})">尾页</button></li>
		</ul>
		</nav>
	</div>
</body>
<script type="text/javascript">
	function goPage(pageNum) {
		$("[name=pageNum]").val(pageNum)
		$("form").submit();
	}
</script>
</html>