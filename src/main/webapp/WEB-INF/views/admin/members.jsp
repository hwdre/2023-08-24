<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 보기</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin/adminmain.css">
<link rel="stylesheet" href="../css/admin/member.css">
<script>
function gradeCh(mno, name, value){
	//alert(mno + name + "님을 변경하시겠습니까?");
	//let select = document.getElemetById("grade")[0];
	//let selectName = select.options[select.selectedIndex].text;
	//let selectValue = select.options[select.selectedIndex].value;
	alert(value);
	if(confirm(name + "님의 등급을 변경하시겠습니까?")){
		location.href="./gradeChange?mno="+mno+"&grade="+value;
	}
}
</script>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<div class="main">
			<div class="article">
				<div class="div-table">
					<div class="div-row">
						<div class="div-cell table-head">번호</div>
						<div class="div-cell table-head">아이디</div>
						<div class="div-cell table-head">비밀번호</div>
						<div class="div-cell table-head">이름</div>
						<div class="div-cell table-head">가입일</div>
						<div class="div-cell table-head">주소</div>
						<div class="div-cell table-head">mbti</div>
						<div class="div-cell table-head">생일</div>
						<div class="div-cell table-head">성별</div>
						<div class="div-cell table-head">회원등급</div>
					</div>
					<c:forEach items="${memberList }" var="row">
						<div class="div-row"<c:if test="${row.m_grade lt 5 }"> gray</c:if><c:if test="${row.m_grade gt 5 }"> yellow</c:if>">
							<div class="div-cell">${row.m_no }</div>
							<div class="div-cell">${row.m_id }</div>
							<div class="div-cell">${row.m_pw }</div>
							<div class="div-cell">${row.m_name }</div>
							<div class="div-cell">${row.m_joindate }</div>
							<div class="div-cell">${row.m_addr }</div>
							<div class="div-cell">${row.m_mbti }</div>
							<div class="div-cell">${row.m_birth }</div>
							<div class="div-cell"><c:if test="${row.m_gender eq 1 }">♂</c:if><c:if test="${row.m_gender eq 0 }">♀</c:if></div>
							<div class="div-cell">
								<select id="grade" class="grade" onchange="gradeCh(${row.m_no }, '${row.m_name }', this.value)">
									<optGroup label="로그인 불가">
										<option value="0"<c:if test="${row.m_grade eq 0}">selected="selected"</c:if>>강퇴</option>
										<option value="1"<c:if test="${row.m_grade eq 1}">selected="selected"</c:if>>강퇴</option>
										<option value="2"<c:if test="${row.m_grade eq 2}">selected="selected"</c:if>>강퇴</option>
										<option value="3"<c:if test="${row.m_grade eq 3}">selected="selected"</c:if>>강퇴</option>
										<option value="4"<c:if test="${row.m_grade eq 4}">selected="selected"</c:if>>강퇴</option>
									</optGroup>
									<optgroup label="로그인 가능">
										<option value="5"<c:if test="${row.m_grade eq 5}">selected="selected"</c:if>>평민</option>
									</optgroup>
									<optgroup label="관리자들">
										<option value="6"<c:if test="${row.m_grade eq 6}">selected="selected"</c:if>>일반관리자</option>
										<option value="7"<c:if test="${row.m_grade eq 7}">selected="selected"</c:if>>게시글관리자</option>
										<option value="8"<c:if test="${row.m_grade eq 8}">selected="selected"</c:if>>가입자관리자</option>
										<option value="9"<c:if test="${row.m_grade eq 9}">selected="selected"</c:if>>최고관리자</option>
									</optgroup>
								</select>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>