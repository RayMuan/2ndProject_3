<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>shipCurrentInfo</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/client.css">

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

<!-- 체크박스 모두 선택하는 함수  -->
<script type="text/javascript">
	function allChk(obj) {
		var chkObj = document.getElementsByName("chk");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}
</script>

</head>
<body>
	<!-- Left Panel1 -->
	<jsp:include page="../inc/leftPanel.jsp" />
	<!-- Left Panel1 -->

	<!-- Right Panel -->
	<div id="right-panel" class="right-panel">
		<!-- Header-->
		<jsp:include page="../inc/top.jsp" />
		<!-- Header-->

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>영업관리</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">영업관리</a></li>
									<li class="active">출하현황</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 	검색창 -->
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
								<form
									action="${pageContext.request.contextPath }/ship/shipCurrentInfo"
									method="get" class="form-inline">
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">출하일자</label>&nbsp;&nbsp;
										<input type="date" id="" class="form-control">&nbsp;~&nbsp;
										<input type="date" id="" class="form-control">
									</div>
									<div class="form-group col-6 mb-1">
										<label class="pr-1  form-control-label">품번</label>&nbsp;&nbsp;
										<input type="text" id="" class="form-control ">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-search"></i>
											</div>
										</div>
									</div>
									<div class="form-group col-6 mt-1">
										<label class="pr-1  form-control-label">수주업체</label>&nbsp;&nbsp;
										<input type="text" id="" class="form-control ">
										<div class="input-group">
											<div class="input-group-addon">
												<i class="ti-search"></i>
											</div>
										</div>
									</div>
							</div>
						</div>
						<input type="submit" class="btn btn-secondary float-right"
							value="조회">
					</div>
				</div>
			</div>

		</div>
		</form>
		<!-- 	검색창 -->

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">출하현황</strong>
							</div>
							<div class="card-body">
								<input type="button" class="btn btn-secondary float-right"
									value="바코드">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col"><input id="allCheck" type="checkbox"
												onclick="allChk(this);" /></th>
											<th scope="col">출하번호</th>
											<th scope="col">출하일자</th>
											<th scope="col">거래처명</th>
											<th scope="col">상품코드</th>
											<th scope="col">상품이름</th>
											<th scope="col">단위</th>
											<th scope="col">수주번호</th>
											<th scope="col">수주량</th>
											<th scope="col">출하량</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="shipDTO" items="${shipCurrentInfo }">
											<tr>
												<th scope="row"><input type="checkbox" name="chk"
													value="${shipDTO.ship_cd }"></th>
												<td>${shipDTO.ship_cd }</td>
												<td><fmt:formatDate value="${shipDTO.ship_date}"
														pattern="yyyy.MM.dd" /></td>
												<td>${shipDTO.cli_nm }</td>
												<td>${shipDTO.prod_cd }</td>
												<td>${shipDTO.prod_nm }</td>
												<td>${shipDTO.prod_unit }</td>
												<td>${shipDTO.ord_cd }</td>
												<td>${shipDTO.ord_count }</td>
												<td>${shipDTO.ship_count }</td>
												<td><input type="button" class="btn btn-secondary"
													value="삭제"
													onclick="location.href='${pageContext.request.contextPath}/ship/currDelete?ship_cd=${shipDTO.ship_cd}'"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- 								</form> -->


								<!-- 페이징 처리 -->
								<div class="pageNum">
									<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
										<a
											href="${pageContext.request.contextPath}/ship/shipCurrentInfo?pageNum=${pageDTO.startPage - pageDTO.pageBlock }">[10페이지
											이전]</a>
									</c:if>

									<c:forEach var="i" begin="${pageDTO.startPage }"
										end="${pageDTO.endPage }" step="1">
										<a
											href="${pageContext.request.contextPath}/ship/shipCurrentInfo?pageNum=${i}">${i}</a>
									</c:forEach>

									<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
										<a
											href="${pageContext.request.contextPath}/ship/shipCurrentInfo?pageNum=${pageDTO.startPage + pageDTO.pageBlock }">[10페이지
											다음]</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- .content -->

		<div class="clearfix"></div>
		<!-- 푸터 넣는 곳 -->
		<jsp:include page="../inc/footer.jsp" />
		<!-- 푸터 넣는 곳 -->
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>


</body>
</html>
