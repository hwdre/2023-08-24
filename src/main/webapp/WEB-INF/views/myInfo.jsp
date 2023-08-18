<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>❤ 사용자 정보 보기</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="./js/jquery-3.7.0.min.js"></script>
<style
</head>
<body>
	<%@ include file="menu.jsp"%>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="myInfo">
				<h1> 사용자 정보 보기</h1>
				<div class="mno">이름: ${myInfo.m_name }</div>
				<div class="mno">생일: ${myInfo.m_birth }</div>
				<div class="mno">회원번호: ${myInfo.m_no }</div>
				<div class="mid">아이디: ${myInfo.m_id }</div>
				<div class="mjoindate">가입일: ${myInfo.m_joindate }</div>
				<div class="maddr">주소: ${myInfo.m_addr }</div>
				<div class="mgrade">회원등급: ${myInfo.m_grade }</div>
				<div class="mbti">mbti: ${myInfo.m_mbti }</div>
				<div class="mgender">성별: ${myInfo.m_gender }</div>
			</div>
		</div>
	</header>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>