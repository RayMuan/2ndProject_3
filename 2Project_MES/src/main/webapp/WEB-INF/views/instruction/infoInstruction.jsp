<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>infoInstruction</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"> -->
<link rel="stylesheet" 
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
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
</head>
<body>
	<!-- 모달 -->
	<jsp:include page="../line/lineModal.jsp" />
	<jsp:include page="../product/productModal.jsp" />
	<jsp:include page="../order/orderModal.jsp" />
	<!-- 모달 -->
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
								<h1>생산관리</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">생산관리</a></li>
									<li class="active">작업지시</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 	검색창 search(오브젝트)-->
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
								<form action="${pageContext.request.contextPath}/instruction/infoInst" class="form-inline" method="get">
									<div class="form-group col-6 mb-1">
										<label for="searchLine" class="pr-1 form-control-label">라인</label>
										<div class="input-group modalP">
											<c:if test="${empty pageDTO.search }">
											<input type="text" id="modalLineCd" name="searchLineCd" placeholder="Line Code" class="form-control bg-white" readonly>
											</c:if>
											<c:if test="${not empty pageDTO.search }">
											<input type="text" id="modalLineCd" name="searchLineCd" value="${pageDTO.search }" placeholder="Line Code" class="form-control bg-white" readonly>
											</c:if>
											<div class="input-group-btn">
												<input type="button" class="btn btn-primary ml-2" id="lineModalBtn" value="검색">
											</div>
										</div>
									</div>
									<div class="form-group col-6 mb-1">
										<label for="searchOrdDate" class="pr-1  form-control-label">지시일자</label>
										<c:if test="${empty pageDTO.search2 }">
										<input type="date" id="searchOrdDate1" name="searchOrdDate1" class="form-control" >
										</c:if>
										<c:if test="${not empty pageDTO.search2 }">
										<input type="date" id="searchOrdDate1" name="searchOrdDate1" class="form-control" value="${pageDTO.search2 }">
										</c:if>
										~
										<c:if test="${empty pageDTO.search3 }">
										<input type="date" id="searchOrdDate2" name="searchOrdDate2" class="form-control">
										</c:if>
										<c:if test="${not empty pageDTO.search3 }">
										<input type="date" id="searchOrdDate2" name="searchOrdDate2" class="form-control" value="${pageDTO.search3 }">
										</c:if>
									</div>
									<div class="form-group col-6 mt-1">
										<label for="searchProd" class="pr-1 form-control-label">품번</label>
										<c:if test="${empty pageDTO.search4 }">
										<input type="text" aria-label="filter" id="searchProdCd" name="searchProdCd" placeholder="Prod Code" class="form-control bg-white" readonly>
										</c:if>
										<c:if test="${not empty pageDTO.search4 }">
										<input type="text" aria-label="filter" id="searchProdCd" name="searchProdCd" placeholder="Prod Code" class="form-control bg-white" value="${pageDTO.search4 }" readonly>
										</c:if>
										<input type="text" id="searchProdNm" disabled class="form-control ml-2">										
										<div class="input-group">
											<div class="input-group">
												<button id="prodModalBtn" class="btn btn-primary ml-2">검색
												<i class="ti-search"></i>
												</button>
											</div>
										</div>
									</div>
									<div class="form-group col-6 mt-1">
										<label class="pr-1  form-control-label">지시상태</label>
										<div class="form-control border-0">
											<div class="form-check-inline form-check">
												<label for="inline-checkbox1" class="form-check-label ">
													<input type="checkbox" id="inline-checkbox1" name="searchInstSt1" value="대기" class="form-check-input" checked>대기
												</label>
												<label for="inline-checkbox2" class="form-check-label ">
													<input type="checkbox" id="inline-checkbox2"
													name="searchInstSt2" value="진행"
													class="form-check-input" checked>진행
												</label>
												<label for="inline-checkbox3" class="form-check-label ">
													<input type="checkbox" id="inline-checkbox3"
													name="searchInstSt3" value="완료"
													class="form-check-input" checked>완료
												</label>
											</div>
										</div>									
									</div>
									<div class="col p-0">
									<input type="submit" class="btn btn-primary col-2 float-right ml-3" id="searchInst" value="검색">
									<input type="reset" class="btn btn-secondary col-1 float-right" value="취소">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 	편집창 insert(오브젝트)-->
		<div class="content pt-0">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<form action="${pageContext.request.contextPath}/instruction/insertInst" method="post">
								<div class="card-body card-block">
									<table id="table" class="table table-striped table-bordered">
										<thead class="thead-dark">
											<tr>
												<th scope="col">라인</th>
												<th scope="col">라인명</th>
												<th scope="col">상품코드</th>
												<th scope="col">상품명</th>
												<th scope="col">단위</th>
												<th scope="col">지시수량</th>
												<th scope="col">수주번호</th>
												<th scope="col">업체명</th>
										</thead>
										<tbody>
											<tr>
												<td scope="row">
													<div class="input-group modalP">
														<input type="text" id="modalLineCd" name="line_cd" value="" placeholder="Line Code" class="form-control bg-white" readonly>
														<div class="input-group-btn">
															<input type="button" class="btn btn-primary" id="lineModalBtn" value="검색">
														</div>
													</div>
												</td>
												<td><input type="text" id="insertLineNm" disabled class="form-control"></td>
												<td>
													<div class="input-group">
														<input type="text" id="insertProdCd" placeholder="Prod Code" class="form-control bg-white" disabled>
													</div>
												</td>
												<td><input type="text" id="insertProdNm" disabled class="form-control"></td>
												<td><input type="text" id="insertProdUnit" disabled class="form-control"></td>
												<td><input type="text" id="insertProdCount" name="inst_count" class="form-control  bg-white"></td>
												<td>
													<div class="input-group">
														<input type="text" id="insertOrderCd" name="ord_cd" value="" placeholder="Order Code" class="form-control bg-white" readonly>
														<div class="input-group-btn">
															<input type="button" class="btn btn-primary" id="orderModalBtn" value="검색">
														</div>
													</div>
												</td>
												<td><input type="text" id="insertClientNm" disabled class="form-control"></td>
											</tr>
										</tbody>
									</table>
									<input type="submit"  class="btn btn-primary col-2 float-right ml-3" id="insertInstBtn" value="추가">
									<input type="reset"  class="btn btn-secondary col-1 float-right" value="취소">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 리스트 -->
		<div class="content pt-0">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">작업지시</strong>
							</div>
							<div class="card-body">
								<table class="table table-striped table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col">지시번호</th>
											<th scope="col">라인</th>
											<th scope="col">라인명</th>
											<th scope="col">품번</th>
											<th scope="col">품명</th>
											<th scope="col">단위</th>
											<th scope="col">지시상태</th>
											<th scope="col">지시날짜</th>
											<th scope="col">지시수량</th>
											<th scope="col">수주번호</th>
											<th scope="col">업체명</th>
											<th scope="col">생산량</th>
									</thead>
									<tbody>
										<c:forEach var="instructionDTO" items="${instList }">
											<tr>
												<td scope="row">${instructionDTO.inst_cd }</td>
												<td>${instructionDTO.line_cd }</td>
												<td>${instructionDTO.line_nm }</td>
												<td>${instructionDTO.prod_cd }</td>
												<td>${instructionDTO.prod_nm }</td>
												<td>${instructionDTO.prod_unit }</td>
												<td>${instructionDTO.inst_st }</td>
												<td>${instructionDTO.inst_date }</td>
												<td>${instructionDTO.inst_count }</td>
												<td>${instructionDTO.ord_cd }</td>
												<td>${instructionDTO.cli_nm }</td>
												<td>${instructionDTO.inst_fcount }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- 페이징 -->
								<div class="col-sm-12 col-md-7">
									<div class="dataTables_paginate paging_simple_numbers">
										<ul class="pagination">
										<c:if test="${pageDTO.startPage <= pageDTO.pageBlock }">
											<li class="paginate_button page-item previous disabled">
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}"
												class="page-link">Previous</a></li>
										</c:if>
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<li class="ppaginate_button page-item previous" >
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}"
												class="page-link">Previous</a></li>
										</c:if>
										
										<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
											<li class="paginate_button page-item ">
												<a class="page-link" href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${i}&search=${pageDTO.search}">${i}</a>
											</li>
										</c:forEach>
										
										<c:if test="${pageDTO.endPage >= pageDTO.pageCount }">
											<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}" class="page-link">Next</a>
											</li>
										</c:if>
										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<li class="paginate_button page-item next" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}" class="page-link">Next</a>
											</li>
										</c:if>
										</ul>
									</div>
								</div>
								<!-- 페이징 -->
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

	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).on("click", "#insertInstBtn", function(){
			if($('#insertLineCd').val() == ''){
				alert("라인코드를 입력해주세요.");
				return false;
			}
			if($('#insertOrderCd').val() == ''){
				alert("수주번호를 입력해주세요.");
				return false;
			}
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
