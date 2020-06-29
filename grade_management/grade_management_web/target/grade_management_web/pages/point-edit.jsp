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
					考点管理 <small>考点列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="#">课程管理</a></li>
					<li class="active">考点列表</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">考点列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">


							<!--数据列表-->
							<form id="form01" action="${pageContext.request.contextPath}/point/save.do" method="post" onsubmit="return getValue()">
							<table id="orderTable"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="sorting_asc_disabled">课程ID</th>
										<th class="sorting_asc_disabled">考点ID</th>
										<th class="sorting_asc_disabled">考点名称</th>
										<th class="sorting_asc_disabled">考点详情</th>
										<th class="sorting_desc_disabled">考点占比</th>
										<th class="sorting_desc_disabled">操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${points}" var="point">
									<tr id="row${point.pointId-1}">
										<td><input type="text" id="courseId${point.pointId-1}" readonly="readonly" class="form-control" name="points[${point.pointId-1}].courseId"
												   placeholder="考点ID" value="${point.courseId}"></td></td>
										<td><input type="text" id="pointId${point.pointId-1}" class="form-control" name="points[${point.pointId-1}].pointId"
												   placeholder="考点ID" value="${point.pointId}"></td>
										<td><input type="text" id="pointName${point.pointId-1}" class="form-control" name="points[${point.pointId-1}].pointName"
												   placeholder="考点名称" value="${point.pointName}"></td>
										<td><input type="text" id="pointDesc${point.pointId-1}" class="form-control" name="points[${point.pointId-1}].pointDesc"
												   placeholder="考点详情" value="${point.pointDesc}"></td>
										<td><input type="text" id="pointPer${point.pointId-1}"  onchange="if(!/(^0$)|(^100$)|(^\d{1,2}$)/.test(value)){value='';alert('请输入0-100的整数!');}"  class="form-control" name="points[${point.pointId-1}].pointPer"
												   placeholder="考点占比" value="${point.pointPer}"></td>
										<td><input type="button" name="delete"  value="删 除" style="width:80px" onclick="deleteSelectedRow('row${point.pointId-1}')" /></td>
									</tr>
								</c:forEach>

								<tr>
									<td align="center" colspan="5">
										<br />
										<input type="button" name="insert"  value="添加" style="width:80px" onclick="insertNewRow()" />&nbsp&nbsp
										<input type="submit"  value=" 保    存 "  style="width:80px" />
									</td>
								</tr>


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
							</form>
							<!--数据列表/-->

						</div>
						<!-- 数据表格 /-->


					</div>
					<!-- /.box-body -->

					<!-- .box-footer-->

					<!-- /.box-footer-->



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

	<script type="text/javascript" language="JavaScript">

		var formvalue  = "";
		var flag       = ${points.size()} ;
		var index      = 1 ;
		var firstCell  = "<input type='text' readonly=\"readonly\" class='form-control'  placeholder='课程ID' value='${courseId}' >";
		var secondCell  = "<input type='text' class='form-control'  placeholder='考点ID'  >";
		var thirdCell = "<input type='text' class='form-control'  placeholder='考点名称'  >";
		var fourthCell  = "<input type='text' class='form-control'  placeholder='考点详情'  >";
		var fivethCell = "<input type='text' class='form-control'  placeholder='考点占比' onchange=\"if(!/(^0$)|(^100$)|(^\\d{1,2}$)/.test(value)){value='';alert('请输入0-100的整数!');}\">";



		//新增一行
		function insertNewRow() {
			//获取表格有多少行
			var rowLength = $("#orderTable tr").length;
			//这里的rowId就是row加上标志位的组合。是每新增一行的tr的id
			var rowId = "row" +flag;

			//每次往下标为flag+1的下面添加tr，因为append是往标签内增加。所以用after
			var insertStr = "<tr id="+rowId+">"
					+"<td>"+firstCell+"</td>"
					+"<td>"+secondCell+"</td>"
					+"<td>"+thirdCell+"</td>"
					+"<td>"+fourthCell+"</td>"
					+"<td>"+fivethCell+"</td>"
					+ "<td><input type='button' name='delete'  value='删 除' style='width:80px' onclick='deleteSelectedRow(\"" + rowId + "\")' /></td>"
					+"</tr>";

			//这里的行数减2，是因为要减去底部的一行和顶部的一行，剩下的为开始插入行的索引
			$("#orderTable tr:eq("+(rowLength-2)+")").after(insertStr);//将新拼接的一行插入到当前行的下面
			//为新添加的行里面的控件添加新的id属性
			$("#"+rowId+" td:eq(0)").children().eq(0).attr("id","courseId"+flag);
			$("#"+rowId+" td:eq(0)").children().eq(0).attr("name","points["+flag+"].courseId");

			$("#"+rowId+" td:eq(1)").children().eq(0).attr("id","pointId"+flag);
			$("#"+rowId+" td:eq(1)").children().eq(0).attr("name","points["+flag+"].pointId");

			$("#"+rowId+" td:eq(2)").children().eq(0).attr("id","pointName"+flag);
			$("#"+rowId+" td:eq(2)").children().eq(0).attr("name","points["+flag+"].pointName");

			$("#"+rowId+" td:eq(3)").children().eq(0).attr("id","pointDesc"+flag);
			$("#"+rowId+" td:eq(3)").children().eq(0).attr("name","points["+flag+"].pointDesc");

			$("#"+rowId+" td:eq(4)").children().eq(0).attr("id","pointPer"+flag);
			$("#"+rowId+" td:eq(4)").children().eq(0).attr("name","points["+flag+"].pointPer");
			//每插入一行，flag自行增加一次
			flag++;
		}

		//删除一行
		function deleteSelectedRow(rowId) {
			if(confirm("确定删除该行嘛？")){
				$("#"+rowId).remove();
			}

		}

		function getValue() {
			var value = "" ;
			$("#orderTable tr").each(function(i) {
				if (i >= 1) {
					$(this).children().each(function(j) {
						if ($("#orderTable tr").eq(i).children().length - 1 != j) {
							value += $(this).children().eq(0).val() + "," //获取每个单元格里的第一个控件的值

						}
					});
					value = value.substr(0, value.length - 1) + "#"; //每个单元格的数据以“，”分割，每行数据以“#”号分割
				}
			});
			value = value.substr(0, value.length);
			if(ReceiveValue(value)){
				return true;
			}else {
				return false
			}
//             $("#formvalue").val(value);
//             $("formvalue").submit();
		}

		function ReceiveValue(str) {
			var Str = str.split('#');
			var arr =[];
			if (Str[0] != "") {
				for (var i = 0; i < Str.length - 1; i++) {
					var value = Str[i].split(',');
					var pointPer = value[4];
					arr[i]=parseInt(pointPer);
				}
				if(sum(arr) !==100){
					alert("请保证考试占比总和为100")
					return false;
				}else {
					return true;
				}

			}

			function sum(arr) {
				var s = 0;
				for (var i = arr.length - 1; i >= 0; i--) {
					s += arr[i];
				}
				return s;
			}
		}


	</script>
</body>

</html>