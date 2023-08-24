<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="a" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="./js/jquery-3.7.0.min.js"></script>
	<style type="text/css">
		.title{
			text-align: left;
		}
		.detail-detail{
			width: 100%;
			height: auto;
		}
		.detail-name, .detail-date-read{
			width: 100%;
			height: 30px;
			border-bottom: 1px solid #c0c0c0;
		}
		.detail-date-read{
			background-color: silver;
		}
		.detail-date{
			padding-left:10px;
			float: left;
		}
		.detail-read{
			padding-right:10px;
			float: right;
		}
		.detail-content{
			width: 100%;
			min-height: 500px;
			height:calc(100vh - 230px);
			height: auto;
		}
	</style>
</head>
<body>
<%@ include file="menu.jsp" %>
 <!-- Masthead-->
        <header class="masthead">
            <div class="container">
               <h1>MULTIBOARD</h1>
            	<c:forEach items="${boardList }" var="l">
            		<button onclick="location.href='${l.b_url}'">${l.b_catename }</button>
		     	</c:forEach>
               <c:choose>
               	<c:when test="${a:length(list) gt 0 }">
               		<table class="table table-dark table-hover table-striped">
               		<thead>
               		<tr class="row">
               			<th class="col-1">번호</th>
               			<th class="col-6">제목</th>
               			<th class="col-2">글쓴이</th>
               			<th class="col-2">날짜</th>
               			<th class="col-1">읽음</th>
               		</tr>
               		</thead>
               		<tbody><c:forEach items="${list }" var="row">
               		<tr class="row detail" onclick="location.href='./mbdetail?board=${param.board}&mbno=${row.mb_no }'">
               			<td class="col-1">${row.rowNum}</td>
               			<td class="col-6 title">${row.mb_title}</td>
               			<td class="col-2">${row.m_name}</td>
               			<td class="col-2">${row.mb_date}</td>
               			<td class="col-1">${row.mb_read}</td>
               		</tr></c:forEach>
               		</tbody>
               		</table>
               	</c:when>
               	<c:otherwise>
               		<h1>게시판에 글이 없습니다.</h1>
               	</c:otherwise>
               	</c:choose>
               <c:if test="${sessionScope.mid ne null }">	
               <button type="button" class="btn btn-secondary" onclick="location.href='./mbwrite?board=${param.board}'">글쓰기</button>
               </c:if>
            </div>
        </header>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<div class="detail-detail">
      		 <div class="detail-name">이름</div>
      		 <div class="detail-date-read">
      		 	<div class="detail-date">날짜</div>
      		 	<div class="detail-read">읽음</div>
      		 </div>
      		 <div class="detail-content">본문내용</div>
      	</div>  
      </div>
    </div>
  </div>
</div>





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>