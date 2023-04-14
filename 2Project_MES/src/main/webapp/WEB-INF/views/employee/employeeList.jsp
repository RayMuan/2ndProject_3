<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>employeeList</title>
<meta name="description" content="Ela Admin - HTML5 Admin Template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cs-skin-elastic.css">
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
</head>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){
window.close();
	$('.emp_email').on('input',function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/employee/emailCk',
			data:{'emp_email':$('.emp_email').val()},
			success:function(result){
				if(result.trim()=="emailUp"){
					result="이메일 중복";
					$('.divresult_1').val("0");
					$('.divresult').html(result).css("color","red");
				}else{
					result="이메일 중복아님";
					$('.divresult_1').val("1");
					$('.divresult').html(result).css("color","blue");
				}
			}
		});
	   
	   });
});

$(document).ready(function(){
	$('.emp_tel').on('input',function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/employee/telCk',
			data:{'emp_tel':$('.emp_tel').val()},
			success:function(result){
				if(result.trim()=="telUp"){
					result="전화번호 중복";
					$('.divresult_2').val("0");
					$('.divresult2').html(result).css("color","red");
				}else{
					$('.divresult_2').val("1");
					result="전화번호 중복아님";
					$('.divresult2').html(result).css("color","blue");
				}
			}
		});
	   });
});


$(document).ready(function(){
	var emailCheck=RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]/);
    $(".cancel").on("click", function(){
      location.href = "${pageContext.request.contextPath}/employee/employeeList";
    })
    
    $("#save").on("click", function(){
      if($("#emp_nm").val()==""){
        alert("이름을 입력해주세요.");
        $("#emp_nm").focus();
        return false;
      }
      
      if($("#emp_position").val()==""){
          alert("직책을 입력해주세요.");
          $("#emp_position").focus();
          return false;
      }
    
      if($("#emp_email").val()==""){
          alert("이메일을 입력해주세요.");
          $("#emp_email").focus();
          return false;
      }

      if(!emailCheck.test($('.emp_email').val())){
      	  alert("이메일 형식 아님");
      	  $('.emp_email').focus();
      	  return false;
        }
      
      if($("#emp_tel").val()==""){
        alert("전화번호를 입력해주세요.");
        $("#emp_tel").focus();
        return false;
      }
      
      if($("#emp_tel").val().length!=11){
   	   alert("전화번호를 11자 입력해주세요.");
   	   $("#emp_tel").focus();
   	   return false;
   	 }
      
      if($(".divresult_1").val()=="0"){
          alert("이메일 중복확인 해주세요.");
          $("#emp_email").focus();
          return false;
        }
      
      if($(".divresult_2").val()=="0"){
          alert("전화번호 중복확인 해주세요.");
          $("#emp_tel").focus();
          return false;
        }
   
     	 form.method='GET';
     	 document.form.action='${pageContext.request.contextPath}/employee/insertPro';
   		 document.form.submit();
    });
  })
  


$(function(){
	$("#ckAll").click(function(){
		if($("#ckAll").prop("checked")) {
			$("input[type=checkbox]").prop("checked",true);
		} else {
			$("input[type=checkbox]").prop("checked",false);
		}
	})
})


function fun1(index) {	   
	if(index==1){
	   let check = false;
	   with(document.form) {
	      if(ck.length==undefined) {
	         if(ck.checked) { check = true; }
	      } else {
	         for(let i=0;i<ck.length;i++) {
	            if(ck[i].checked) { check = true; } }
	      } if(!check) {
	      alert("삭제할 사용자를 선택하세요");
			return;
	      } else {
	         if(confirm("삭제처리 하시겠습니까?")==true) { document.form.action='${pageContext.request.contextPath}/employee/deletePro';
	         										  document.form.submit();}
	         else{
	        	return; 
	         }
	      }
	    	  
	   } } 
	   }
	
	   

	      
</script>
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

								<h1 class="m-0">시스템 관리</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">시스템관리</a></li>
									<li class="active">사용자관리</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 검색창				 -->
		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card m-0">
							<div class="card-body card-block">
							
								<form action="${pageContext.request.contextPath}/employee/employeeList" method="get" class="form-inline">
									 <div class="form-group col-6 mt-1">
                                    	<label for="exampleInputName1" class="pr-1  form-control-label">사용자ID</label>
                                    	<input type="text" id="search" name="search" class="form-control" placeholder="Emp Code">
                                    	<div class="input-group">
                                    	</div>
                                    </div>
                                     <div class="form-group col-6 mt-1">
                                    	<label for="exampleInputName1" class="pr-1  form-control-label">사용자명</label>
                                    	<input type="text" id="search2" name="search2" class="form-control" placeholder="Emp Name">
                                    	<div class="input-group">
                                    	</div>
                                    </div> 
                                   <div style="width: 100%">
										<input type="submit" class="btn btn-secondary float-right" value="조회">
									</div>
								   </form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- 		검색창 -->
<!-- 		.content -->
		
        <div class="content">
		<form name="form" method="post">
		<div style="width: 100%; height: 50px">
		<input type="button" name="ckDelete" value="삭제" onclick="fun1(1)" class="btn btn-secondary float-right btn3">
		<input type="submit" value="추가" name="add" onclick="fun1(3)" formmethod="get" class="btn btn-secondary float-right">			
		</div>			
			<div class="animated fadeIn">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-lg">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">사용자 </strong> <div class="count1  float-right">총 ${pageDTO.count}건</div>
							</div>
							<div class="card-body">
								<table class="table table-striped table-bordered">
									<thead class="thead-dark">
										<tr>
											<th scope="col"><input type="checkbox" id="ckAll" name="ckAll"></th>
											<th scope="col">사용자 ID</th>
											<th scope="col">사용자명</th>
											<th scope="col">비밀번호</th>
											<th scope="col">직책</th>
											<th scope="col">E-MAIL</th>
											<th scope="col">전화번호</th>
											<th scope="col" style="width: 50px">확인</th>																				
										</tr>
									</thead>
									<tbody>
										
										
										<c:if test="${! empty add }">
										<tr>
											<td><input type="checkBox" name="ck" id="ck" value=""/></td>
											<td><input type="text" name="emp_cd" id="emp_cd" class="emp_cd form-control" readonly></td>
											<td><input type="text" name="emp_nm" id="emp_nm" class="emp_nm form-control"></td>
<!-- 											<td><input type="text" name="emp_pass" id="emp_pass" class="emp_pass form-control"></td> -->
											<td><input type="text" class="emp_pass form-control" readonly></td>
											<td><select name="emp_position" id="emp_position" class="emp_position form-control">
												<option value="">직책을 선택하세요</option>
												<option value="관리자">관리자</option>
												<option value="파트장">파트장</option>
												<option value="사원">사원</option>
												</select></td>
											
											<td><input type="text" id="emp_email" name="emp_email" class="emp_email form-control"><br>
											<div class="divresult"></div><input type="hidden" class="divresult_1"><br>
											</td>
											
											<td><input type="text" name="emp_tel" id="emp_tel" class="emp_tel form-control"><br>
											<div class="divresult2"></div><input type="hidden" class="divresult_2"><br></td>



											<td><input type="submit" value="저장" formmethod="get" id="save" class="btn btn-secondary btn4"><br>
											<input type="submit" value="취소"  formmethod="get" class="cancel btn btn-secondary"></td>
										</tr>
										</c:if>
										
										
										<c:forEach var="employeeDTO" items="${employeeList }">
										
										<tr>
											
											<td><input type="checkBox" name="ck" id="ck" value="${employeeDTO.emp_cd}"/></td>																					
											<td>${employeeDTO.emp_cd}</td>
											<td>${employeeDTO.emp_nm}</td>
											<td>${employeeDTO.emp_pass}</td>
											<td>${employeeDTO.emp_position}</td>
											<td>${employeeDTO.emp_email}</td>
											<td>${employeeDTO.emp_tel}</td>
											<td><a href="javascript:void(window.open('${pageContext.request.contextPath}/employee/updateEmployee?emp_cd=${employeeDTO.emp_cd}', '수정', 'width=500, height=900,left=500, top=200' ))">	
											<input type="button" class="btn btn-secondary" value="수정" ></a></td>																				
										</tr>
										</c:forEach>
										
										
										
										
									</tbody>
								</table>

	<!-- 페이징 -->
								<div class="col p-0 mt-3">
									<div class="dataTables_paginate paging_simple_numbers float-right">
										<ul class="pagination">
										<!-- 이전 -->
										<c:if test="${pageDTO.startPage <= pageDTO.pageBlock }">
											<li class="paginate_button page-item previous disabled">
												<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}"
												class="page-link">Previous</a></li>
										</c:if>
										<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
											<li class="ppaginate_button page-item previous" >
												<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage - pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}"
												class="page-link">Previous</a>
											</li>
										</c:if>
										<!-- 이전 -->
										<!-- 현재 -->										
										<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
											<c:if test="${i==pageDTO.pageNum }">
												<li class="paginate_button page-item active">
													<a class="page-link" href="#">${i}</a>
												</li>											
											</c:if>
											<c:if test="${i!=pageDTO.pageNum }">
												<li class="paginate_button page-item ">
													<a class="page-link" href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}">${i}</a>
												</li>
											</c:if>
										</c:forEach>
										<!-- 현재 -->										
										<!-- 다음 -->																				
										<c:if test="${pageDTO.endPage >= pageDTO.pageCount }">
											<li class="paginate_button page-item next disabled" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-link">Next</a>
											</li>
										</c:if>
										<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
											<li class="paginate_button page-item next" id="bootstrap-data-table_next">
												<a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage + pageDTO.pageBlock}&search=${pageDTO.search}&search2=${pageDTO.search2}" class="page-link">Next</a>
											</li>
										</c:if>
										<!-- 다음 -->																				
										</ul>
									</div>
								</div>
								<!-- 페이징 -->
<!-- <div align="center">					 -->
<%-- <c:if test="${pageDTO.startPage > pageDTO.pageBlock }"> --%>
<%-- <a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage - pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}">◁◁</a> --%>
<%-- </c:if> --%>

<%-- <c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1"> --%>
<%-- <a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${i}&search=${pageDTO.search}&search2=${pageDTO.search2}">${i}</a>  --%>
<%-- </c:forEach> --%>

<%-- <c:if test="${pageDTO.endPage < pageDTO.pageCount }"> --%>
<%-- <a href="${pageContext.request.contextPath}/employee/employeeList?pageNum=${pageDTO.startPage + pageDTO.pageBlock }&search=${pageDTO.search}&search2=${pageDTO.search2}">▷▷</a> --%>
<%-- </c:if> --%>
<!-- </div>		 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</form>
<!-- .content -->
		</div>

		<div class="clearfix"></div>
		<!-- 푸터 넣는 곳 -->
		<jsp:include page="../inc/footer.jsp" />
		<!-- 푸터 넣는 곳 -->
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
		












	
</body>
</html>


