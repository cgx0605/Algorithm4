<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<jsp:include page="link.jsp"></jsp:include>
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				选课管理 <small>课程详情</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="all-admin-index.html"><i
						class="${pageContext.request.contextPath}/pages/main.jsp"></i> 首页</a></li>
				<li><a href="${pageContext.request.contextPath}/select/findAll.do">订单管理</a></li>
				<li class="active">订单详情</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content"> <!--订单信息-->
			<div class="panel panel-default">
				<div class="panel-heading">课程信息</div>
				<div class="row data-type">

					<div class="col-md-2 title">课程ID</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" name="courseId"
							   value="${course.courseId }" readonly="readonly">
					</div>
					<div class="col-md-2 title">课程名称</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" name="courseName"
							   placeholder="课程名称" value="${course.courseName }" readonly="readonly">
					</div>

					<div class="col-md-2 title">开课时间</div>
					<div class="col-md-4 data">
						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" class="form-control pull-right"
								   id="datepicker" name="startTime" value="${course.startTime}" readonly="readonly">
						</div>
					</div>

					<div class="col-md-2 title">任课教师</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="任课教师"
							   name="courseTeacher" value="${course.courseTeacher }" readonly="readonly">
					</div>

				</div>
			</div>
			<!--订单信息/--> <!--游客信息-->
			<div class="panel panel-default">
				<div class="panel-heading">考点信息</div>
				<!--数据列表-->
				<table id="dataList"
					class="table table-bordered table-striped table-hover dataTable">
					<thead>
						<tr>
							<th class="sorting_asc sorting_asc_disabled">课程ID</th>
							<th class="sorting_asc sorting_asc_disabled">考点ID</th>
							<th class="sorting_asc sorting_asc_disabled">考点名称</th>
							<th class="sorting_desc sorting_desc_disabled">考点详情</th>
							<th class="sorting_asc sorting_asc_disabled">考点占比</th>
							<th class="sorting_asc sorting_asc_disabled">考点成绩</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${points}" var="point" varStatus="loop">

						<tr>
							<td>${point.courseId }</td>
							<td>${point.pointId}</td>
							<td>${point.pointName}</td>
							<td>${point.pointDesc}</td>
							<td>${point.pointPer}</td>
							<td>${pointGrades[loop.count-1]}</td>
						</tr>
					</c:forEach>


					</tbody>
				</table>
				<!--数据列表/-->
			</div>

			<div class="box-tools text-center">

				<button type="button" class="btn bg-default"
					onclick="history.back(-1);">返回</button>
			</div>
			<!--工具栏/--> </section>
			<!-- 正文区域 /-->


		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.8
		</div>
		<strong>Copyright &copy; 2020 <a
			href="http://www.itcast.cn">研究院研发部</a>.
		</strong> All rights reserved. </footer>
		<!-- 底部导航 /-->

	</div>

	<jsp:include page="script.jsp"></jsp:include>

	<script>
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {

			// 激活导航位置
			setSidebarActive("order-manage");

			// 列表按钮 
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// 全选操作 
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});
	</script>
</body>


</html>