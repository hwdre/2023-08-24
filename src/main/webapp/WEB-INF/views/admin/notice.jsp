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
<link rel="stylesheet" href="../css/admin/adminmain.css">
<style>
.notice-write-form{
	width: 90%;
	height: auto;
	margin: 10px;
	padding: 20px;
	box-sizing: border-box;
}
.notice-write-form input{
	height: 30px;
	width: 100%;
}
.notice-write-form textarea{
	width: 100%;
	height: 300px;
	margin: 5px 0px;
}
.notice-write-form button{
	width: 100px;
	height: 50px;
}
</style>
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
							<td>${row.nno }</td>
							<td>${row.ntitle }</td>
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