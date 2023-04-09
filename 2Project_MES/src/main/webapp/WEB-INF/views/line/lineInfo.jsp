<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/performanceCurr.css">
	


	
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
								<h1>기준정보</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">기준정보</a></li>
									<li class="active">라인정보</li>
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
									<form action="${pageContext.request.contextPath}/line/lineInfo" class="form-inline" method="get">
										<div class="form-group col-6 mb-1">
											<div class="input-group modalP" id="modalP1">
												<label for="modalLineCd" class="pr-1 form-control-label">라인 코드</label>
												<input type="text" id="modalLineCd" name="modalLineCd"
													placeholder="Line Code" class="form-control bg-white mr-4">
												<label for="modalLineNm" class="pr-1 form-control-label">라인명</label>
												<input type="text" id="modalLineNm" name="modalLineNm"
													placeholder="Line Name" class="form-control bg-white">
												<div class="input-group-btn">
													<input type="button" class="btn btn-primary ml-2"
														id="lineSearchBtn" value="검색">
												</div>
											</div>
										</div>
										<div class="col p-0"></div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		<!-- 	편집창 insert(오브젝트)-->
<!-- 		<div class="content pt-0"> -->
<!-- 			<div class="animated fadeIn"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg"> -->
<!-- 						<div class="card m-0"> -->
<%-- 							<form action="${pageContext.request.contextPath}/instruction/insertInst" id="insertInstForm" method="post"> --%>
<!-- 								<div class="card-body card-block"> -->
<!-- 									<table id="table" class="table table-striped table-bordered"> -->
<!-- 										<thead class="thead-dark"> -->
<!-- 											<tr> -->
<!-- 												<th scope="col">지시번호</th> -->
<!-- 												<th scope="col">라인</th> -->
<!-- 												<th scope="col">라인명</th> -->
<!-- 												<th scope="col">수주번호</th> -->
<!-- 												<th scope="col">상품코드</th> -->
<!-- 												<th scope="col">상품명</th> -->
<!-- 												<th scope="col">단위</th> -->
<!-- 												<th scope="col" class="col-1">지시상태</th> -->
<!-- 												<th scope="col">지시수량</th> -->
<!-- 												<th scope="col">생산량</th>  -->
<!-- 												<th scope="col">업체명</th>  -->
<!-- 										</thead> -->
<!-- 										<tbody> -->
<!-- 											<tr> -->
<!-- 												<td scope="row"><input type="text" id="insertInstCd" name="inst_cd" class="form-control" readonly></td> -->
<!-- 												<td> -->
<!-- 													<div class="input-group modalP" id="modalP2"> -->
<!-- 														<input type="text" id="insertLineCd" name="line_cd" value="" placeholder="Line Code" class="form-control bg-white" readonly> -->
<!-- 														<div class="input-group-btn"> -->
<!-- 															<input type="button" class="btn btn-primary" id="lineModalBtn" value="검색"> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</td> -->
<!-- 												<td><input type="text" id="insertLineNm" disabled class="form-control"></td> -->
<!-- 												<td> -->
<!-- 													<div class="input-group"> -->
<!-- 														<input type="text" id="insertOrderCd" name="ord_cd" value="" placeholder="Order Code" class="form-control bg-white" readonly> -->
<!-- 														<div class="input-group-btn"> -->
<!-- 															<input type="button" class="btn btn-primary" id="orderModalBtn" value="검색"> -->
<!-- 														</div> -->
<!-- 													</div> -->
<!-- 												</td> -->
<!-- 												<td> -->
<!-- 													<div class="input-group"> -->
<!-- 														<input type="text" id="insertProdCd" placeholder="Prod Code" class="form-control bg-white" disabled> -->
<!-- 													</div> -->
<!-- 												</td> -->
<!-- 												<td><input type="text" id="insertProdNm" disabled class="form-control"></td> -->
<!-- 												<td><input type="text" id="insertProdUnit" disabled class="form-control"></td> -->
<!-- 												<td> -->
<!-- 												<div> -->
<!-- 													<select name="inst_st" id="insertInstSt" class="form-control"> -->
<!--                                                 		<option value="대기">대기</option> -->
<!--                                                 		<option value="진행">진행</option> -->
<!--                                                 		<option value="완료">완료</option> -->
<!--                                                 	</select>                                            	 -->
<!-- 												</div> -->
<!-- 												</td> -->
<!-- 												<td><input type="text" id="insertProdCount" name="inst_count" class="form-control  bg-white" 	></td> -->
<!-- 												<td><input type="number" id="insertInstFcount" name="inst_fcount" class="form-control" value="0" ></td> -->
<!-- 												<td><input type="text" id="insertClientNm" disabled class="form-control"></td> -->
<!-- 											</tr> -->
<!-- 										</tbody> -->
<!-- 									</table> -->
<!-- 									<button type="submit" class="btn btn-primary col-2 float-right ml-3" id="insertInstBtn">추가</button> -->
<!-- 									<button type="submit" class="btn btn-primary col-1 float-right ml-3" id="updateInstBtn" disabled>수정</button> -->
<!-- 									<button type="button" class="btn btn-secondary col-1 float-right ml-3" id="deleteInstBtn" disabled>삭제</button> -->
<!-- 									<button type="reset"  class="btn btn-secondary col-1 float-right reset" id="resetInstBtn">취소</button> -->
<!-- 								</div> -->
<!-- 							</form> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->

		<!-- 리스트 -->
		<div class="content pt-0">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">라인정보</strong>
							</div>
							<div class="card-body">
								<table id="hover_tb" class="table table-hover table-striped table-bordered table-align-middle mb-0">
									<thead class="thead-dark">
										<tr>
											<th scope="col">라인코드</th>
										<th scope="col">라인명</th>
										<th scope="col">공정</th>
										<th scope="col">작업장</th>
										<th scope="col">정렬순서</th>
										<th scope="col">설비상태</th>
										<th scope="col">비고</th>
									</thead>
									<tbody>
										<c:forEach var="lineDTO" items="${lineList }">
											<tr id="infoLineTr" class="data-row">
												<td>${lineDTO.line_cd }</td>
												<td>${lineDTO.line_nm }</td>
												<td>${lineDTO.line_process}</td>
												<td>${lineDTO.line_place}</td>
												<td>${lineDTO.line_num}</td>
												<td>${lineDTO.line_st}</td>
												<td>${lineDTO.line_note}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- 페이징 -->
								<div class="col p-0 mt-3">
									<div class="dataTables_paginate paging_simple_numbers float-right">
										<ul class="pagination">
										<c:if test="${pageDTO.startPage <= pageDTO.pageBlock }">
											<li class="paginate_button page-item previous disabled">
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}"
												class="page-link">Previous</a></li>
										</c:if>
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<li class="ppaginate_button page-item previous" >
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}"
												class="page-link">Previous</a>
											</li>
										</c:if>
										
										
										<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
											<c:if test="${i==pageDTO.currentPage }">
												<li class="paginate_button page-item active">
													<a class="page-link" href="#">${i}</a>
												</li>											
											</c:if>
											<c:if test="${i!=pageDTO.currentPage }">
												<li class="paginate_button page-item ">
													<a class="page-link" href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}">${i}</a>
												</li>
											</c:if>
										</c:forEach>
										
										<c:if test="${pageDTO.endPage >= pageDTO.pageCount }">
											<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}" class="page-link">Next</a>
											</li>
										</c:if>
										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<li class="paginate_button page-item next" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/instruction/infoInst?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}&search3=${pageDTO.search3}&search4=${pageDTO.search4}&search5=${pageDTO.search5}&search6=${pageDTO.search6}&search7=${pageDTO.search7}" class="page-link">Next</a>
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
		// 추가버튼 제어
// 		$(document).on("click", "#insertInstBtn", function(){
// 			if($('#insertOrderCd').val() == ''){
// 				alert("수주번호를 입력해주세요.");
// 				return false;
// 			}
// 			if($('#insertLineCd').val() == ''){
// 				alert("라인코드를 입력해주세요.");
// 				return false;
// 			}
// 			if($('#insertInstFcount').val() == ''){
// 				$('#insertInstFcount').val('0');
// 			}
// 		});
		
// 		// 취소 버튼 (clear)
// 		$(document).on("click",".reset", function(){
// 			console.log($(this).closest('form').find('div input[type="text"]'));
// 			console.log($(this).attr('id'));
// 			$(this).closest('form').find('div input[type="text"]').attr('value', '');
// 			$(this).closest('form').find('div input[type="date"]').attr('value', '');
// 			if($(this).attr('id')=='resetInstBtn'){
// 				$("#insertInstForm").attr('action', '${pageContext.request.contextPath}/instruction/insertInst');
// 				$('#updateInstBtn').prop('disabled', true);
// 				$('#deleteInstBtn').prop('disabled', true);
// 				$('#insertInstBtn').prop('disabled', false);
// 			}
// 		});
		
// 		// 행 클릭시 이동
// 		$(document).on("click","#infoInstTr td:not(:last-child)", function(){
// 			location.href='${pageContext.request.contextPath}/performance/performanceCurrentInfo?pageNum=1&search='+$(this).closest('tr').children('td:eq(0)').text()+'&search2=&search3=&search4=&search5=';
// 		});

// 		// 회색 수정 버튼
// 		$(document).on("click", "#editInstBtn", function(){
// 			console.log('['+$(this).closest('tr').children('td:eq(0)').text().trim()+']');
// 			$('#insertInstCd').val($(this).closest('tr').children('td:eq(0)').text().trim());
// 			$('#insertLineCd').val($(this).closest('tr').children('td:eq(1)').text());
// 			$('#insertLineNm').val($(this).closest('tr').children('td:eq(2)').text());
// 			$('#insertOrderCd').val($(this).closest('tr').children('td:eq(3)').text());
// 			$('#insertProdCd').val($(this).closest('tr').children('td:eq(4)').text());
// 			$('#insertProdNm').val($(this).closest('tr').children('td:eq(5)').text());
// 			$('#insertProdUnit').val($(this).closest('tr').children('td:eq(6)').text());
// 			$('#insertInstSt').val($(this).closest('tr').children('td:eq(7)').text()).prop('selected', true);
// 			$('#insertProdCount').val($(this).closest('tr').children('td:eq(8)').text());
// 			$('#insertInstFcount').val($(this).closest('tr').children('td:eq(9)').text());
// 			$('#insertClientNm').val($(this).closest('tr').children('td:eq(11)').text());
// 			$('#insertInstForm').attr('action', '${pageContext.request.contextPath}/instruction/updateInst');
// 			$('#updateInstBtn').prop('disabled', false);
// 			$('#deleteInstBtn').prop('disabled', false);
// 			$('#insertInstBtn').prop('disabled', true);
// 			$('#lineModalBtn').focus();
// 		});
		
// 		// 삭제버튼 제어
// 		$(document).on("click", "#deleteInstBtn", function(){
// 			console.log($('#insertInstCd').val());
// 			location.href='${pageContext.request.contextPath}/instruction/deleteInst?delInstCd='+$('#insertInstCd').val();
// 		});
		
// 		// 체크박스 제어
// 		$("#searchInstSt1").change(function(){
// 			if($("#searchInstSt1").is(":checked")){
// 				$("#searchInstSt1").attr('value', '대기');
// 			}else{
// 				$("#searchInstSt1").attr('value', '');
// 			}
// 		});
		
// 		$("#searchInstSt2").change(function(){
// 			if($("#searchInstSt2").is(":checked")){
// 				$("#searchInstSt2").attr('value', '진행');				
// 			}else{
// 				$("#searchInstSt2").attr('value', '');
// 			}
// 		});
			
// 		$("#searchInstSt3").change(function(){
// 			if($("#searchInstSt3").is(":checked")){
// 				$("#searchInstSt3").attr('value', '완료');
// 			}else{
// 				$("#searchInstSt3").attr('value', '');
// 			}
// 		});
	</script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
