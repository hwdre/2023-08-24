<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin/adminmain.css">
</head>
<body>
	<div class="container">
	<%@ include file="menu.jsp" %>
		<div class="main">
			<div class="article">
				<h1>메인 영역</h1>
				<div class="box" style="background-color:red;" onclick="url('multiBoard')">
					게시판
					<div id="comment">
						게시판을 관리합니다.
					</div>
				</div>
				<div class="box" style="background-color:red;" onclick="url('post')">
					게시글 관리
					<div id="comment">
						게시글을 관리합니다.
					</div>
				</div>
				<div class="box" style="background-color:red;" onclick="url('members')">
					회원
					<div id="comment">
						회원들의 등록정보를 관리합니다.
					</div>
				</div>
				<div class="box" style="background-color:red;" onclick="url('comment')">
					댓글
					<div id="comment">
						댓글을 관리합니다.
					</div>
				</div>
				<div class="box" style="background-color:red;" onclick="url('message')">
					메시지
					<div id="comment">
						메시지를 관리합니다.
					</div>
				</div>
				<div class="box" style="background-color:red;" onclick="url('mail')">
					메일보내기
					<div id="comment">
						메일을 보냅니다.
					</div>
				</div>
				<div class="box" style="background-color:red;" onclick="url('notice')">
					공지사항
					<div id="comment">
						공지사항을 씁니다.
					</div>
				</div>
				<div class="box" style="background-color:red" onclick="url('logout')">
					로그아웃
					<div id="comment">
						로그아웃합니다.
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>