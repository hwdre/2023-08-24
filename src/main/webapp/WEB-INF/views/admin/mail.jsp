<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin/adminmain.css">
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<div class="main">
			<div class="article">
				<form action="./mail" method="post">
					<div><input type="text" name="title" placeholder="제목을 적어주세요."></div>
					<div><input type="text" name="to" placeholder="받는 사람의 email주소를 적어주세요."></div>
					<div><textarea name="content"></textarea></div>
					<div><button type="submit">send mail</button></div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>