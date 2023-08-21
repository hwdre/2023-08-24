<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="menu">
	<div class="menu-item" onclick="url('multiBoard')">
		<i class="xi-bars xi-2x"></i>게시판 관리
	</div>
	<div class="menu-item" onclick="url('post')">
		<i class="xi-search xi-2x"></i>게시글 관리
	</div>
	<div class="menu-item" onclick="url('member')">
		<i class="xi-library-bookmark xi-2x"></i>회원 관리
	</div>
	<div class="menu-item" onclick="url('comment')">
		<i class="xi-note-o xi-2x"></i>댓글 관리
	</div>
	<div class="menu-item" onclick="url('message')">
		<i class="xi-mail xi-2x"></i>메시지 관리
	</div>
	<div class="menu-item" onclick="url('mail')">
		<i class="xi-send xi-2x"></i>메일보내기
	</div>
	<div class="menu-item" onclick="url('notice')">
		<i class="xi-eye xi-2x"></i>공지사항
	</div>
	<div class="menu-item" onclick="url('logout')">
		<i class="xi-log-out xi-2x"></i>로그아웃
	</div>
</div>
<script type="text/javascript">
	function url(url) {
		location.href = "./" + url;
	}
</script>