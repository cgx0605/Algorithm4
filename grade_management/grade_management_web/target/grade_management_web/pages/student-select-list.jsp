<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="link.jsp"></jsp:include>
</head>

<body class="hold-transition skin-purple sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 页面头部 /-->
		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<!-- @@master = admin-layout.html-->
		<!-- @@block = content -->

		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
				<h1>
					选课管理<small>选课学生列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="${pageContext.request.contextPath}/select/findAll.do">选课管理</a></li>
					<li class="active">选课学生列表</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">选课学生列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">

										<button type="button" class="btn btn-default" title="刷新"
												onclick="location.href='${pageContext.request.contextPath}/select/findStudent.do'">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="sorting_asc sorting_asc_disabled">学生ID</th>
										<th class="sorting_asc sorting_asc_disabled">姓名</th>
										<th class="sorting_asc sorting_asc_disabled">性别</th>
										<th class="sorting_desc sorting_desc_disabled">联系方式</th>
										<th class="sorting_asc sorting_asc_disabled">班级</th>
										<th class="sorting_asc sorting_asc_disabled">总分</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>
								<tbody>



									<c:forEach items="${students}" var="student" varStatus="loop">

										<tr>
											<td>${student.studentId }</td>
											<td>${student.studentName}</td>
											<td>${student.studentSex}</td>
											<td>${student.studentTel}</td>
											<td>${student.className}</td>
											<td>${courseGrades[loop.count-1]}</td>
											<td class="text-center">
												<a href="${pageContext.request.contextPath}/grade/grade.do?studentId=${student.studentId}&courseId=${courseId}" class="btn bg-olive btn-xs">打分</a>
											</td>
										</tr>
									</c:forEach>

								</tbody>
								<!--
                            <tfoot>
                            <tr>
                            <th>Rendering engine</th>
                            <th>Browser</th>
                            <th>Platform(s)</th>
                            <th>Engine version</th>
                            <th>CSS grade</th>
                            </tr>
                            </tfoot>-->
							</table>
							<!--数据列表/-->

						</div>
						<!-- 数据表格 /-->


					</div>
					<!-- /.box-body -->





				</div>

			</section>
			<!-- 正文区域 /-->

		</div>
		<!-- @@close -->
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.8
			</div>
			<strong>Copyright &copy; 2020 <a
				href="http://www.itcast.cn">研究院研发部</a>.
			</strong> All rights reserved.
		</footer>
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
			setSidebarActive("admin-datalist");

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