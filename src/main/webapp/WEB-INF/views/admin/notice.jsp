<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../css/admin/adminmain.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
.notice-write-form{
	width: 95%;
	height: auto;
	margin : 10px;
	padding: 20px;
	box-sizing: border-box;
}
.notice-write-form input{
	height: 30px;
	width: 100%;	
}
.notice-write-form textarea {
	width: 100%;
	height: 300px;
	margin: 5px 0px;
}
.notice-write-form button {
	width: 100px;
	height: 50px;
}
table{
	width: 800px;
	text-align: center;
	border-collapse: collapse;
	float: left;
}
tr{
	border-bottom: 1px solid silver;
}
tr:hover{
	background-color: silver;
}
.title{
	text-align: left;
	width: 40%;
}
.content-view{
	width: calc(100% - 800px);
	height: 400px;
	background-image: url('../img/rainbow.jpg');
	float: right;
}
</style>
<script>
$(function(){
	//alert("!"); 최초에 연결이 되었는지 확인하는 용도입니다.
	$(".ntitle").click(function(){
		//alert("!"); //됩니다. 혹시 연결이 끊겼나 의심되면 이거 주석 해제하고 밑에 주석처리한 후 실행해주세요.
		//alert($(this).text()); 클릭한 제목이 떠야 합니다.
		let nno = $(this).siblings(".nno").text();
		$.ajax({
			url: "./noticeDetail",
			type: "post",
			data: {nno: nno},
			dataType: "json",
			success:function(data){
				$(".notice-content").html(data.ncontent);
			},
			error:function(data){
				alert("오류발생!!! 오류발생!!! 코드 점검해라 멍청아!!!!!!");
			}
		});
	});
});
$(function(){
	$(document).on("click", ".xi-eye, .xi-eye-off", function(){
		let nno = $(this).parent().siblings(".nno").text();
		let nnoTD = $(this).parent();
		//alert(nno);
		$.ajax({
			url: "./noticeHide",
			type: "post",
			data: {nno: nno},
			dataType: "json",
			success:function(data){
				//변경되었다면 모양 바꾸기
				if(nnoTD.html().indexOf("-off") != -1){
         			nnoTD.html('<i class="xi-eye"></i>');
         		} else {
         			nnoTD.html('<i class="xi-eye-off"></i>');
         		}
			},
			error:function(data){
				alert("오류발생!!! 오류발생!!! 코드 점검해라 멍청아!!!!!!!" + data.result);
			}
		})
	});
});
</script>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<div class="main">
			<div class="article">
				<h1>공지사항</h1>
				<!-- 글이 없으면 안보이게 처리하세요. -->
				<table border="1">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>게시일</td>
						<td>글쓴이</td>
						<td>삭제여부</td>
						<td>파일유무</td>
					</tr>
					<c:forEach items="${noticelist }" var="row">
						<tr>
							<td class="nno">${row.nno }</td>
							<td class="ntitle">${row.ntitle }</td>
							<td>${row.ndate }</td>
							<td>${row.m_no }</td>
							<td><c:choose>
									<c:when test="${row.ndel eq 1 }">
										<i class="xi-eye"></i>
										<!-- ndel이 1이면 보여지고 0이면 글을 보여주지 않흡니다. -->
									</c:when>
									<c:otherwise>
										<i class="xi-eye-off"></i>
									</c:otherwise>
								</c:choose></td>
							<td><c:choose>
									<c:when test="${row.norifile ne null }">
										<i class="xi-file-add"></i>
										<!-- ndel이 1이면 보여지고 0이면 글을 보여주지 않흡니다. -->
									</c:when>
									<c:otherwise>파일이 없습니다.
										</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</table>
				<div class="content-view">
					<div class="notice-content"></div>
					<div class="pic-or-fi"></div>
				</div>
				<div class="notice-write-form">
					<form action="./noticeWrite" method="post" enctype="multipart/form-data"> 
					<!-- enctype="multipart/form-data" 요로코롬 쓰며는 파일 올릴 수 있습니다.-->
						<input type="text" name="title" />
						<textarea name="content"></textarea>
						<input type="file" name="upfile" />
						<button type="submit">글쓰기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>