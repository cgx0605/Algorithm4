<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				学生管理 <small>编辑学生表单</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/student/findAll.do">学生管理</a></li>
				<li class="active">编辑学生表单</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<form action="${pageContext.request.contextPath}/student/update.do"
				method="post" >
				<!-- 正文区域 -->
				<section class="content">

				<div class="panel panel-default">
					<div class="panel-heading">学生信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">学生ID</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="studentId"
								   value="${student.studentId }" readonly="readonly">
						</div>
						<div class="col-md-2 title">学生姓名</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="studentName"
								placeholder="学生姓名" value="${student.studentName }">
						</div>
						<div class="col-md-2 title">学生性别</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" name="studentSex"
								placeholder="学生性别" value="${student.studentSex}">
						</div>

						<div class="col-md-2 title">所属班级</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="所属班级"
								name="className" value="${student.className }">
						</div>

						<div class="col-md-2 title ">联系方式</div>
						<div class="col-md-4 data rowHeight2x">
							<input type="text" class="form-control" placeholder="联系方式"
								   name="studentTel" value="${student.studentTel }">
						</div>
						<div class="col-md-2 title ">登录密码</div>
						<div class="col-md-4 data rowHeight2x">
							<input type="password" class="form-control" placeholder="初始密码与学号相同"
								   name="password" value="${student.password }">
						</div>

					</div>
				</div>
				<!--订单信息/--> <!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">保存</button>
					
				</div>
				<!--工具栏/--> </section>
				<!-- 正文区域 /-->
			</form>
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
			$('#datepicker-a3').datetimepicker({
				format : "yyyy-mm-dd hh:ii",
				autoclose : true,
				todayBtn : true,
				language : "zh-CN"
			});
		});

		$(document).ready(function() {
			// 激活导航位置
			setSidebarActive("order-manage");
			$("#datepicker-a3").datetimepicker({
				format : "yyyy-mm-dd hh:ii",

			});

		});
	</script>


</body>

</html>