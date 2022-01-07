<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>게시판</title>
<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="css/list.css" type="text/css" rel="stylesheet" />

<!-- 부트스트랩 기반 완성 -->

</head>
<body>


	<!-- 상단바 -->
	<nav class="navbar navbar-light " style="background-color: #FFC0CB;">
		<div class="container-fluid justify-content-center">
			<a class="navbar-brand" style="font-family: Bernard MT"> <svg
					xmlns="http://www.w3.org/2000/svg" width="30" height="24"
					fill="currentColor" class="bi bi-brightness-alt-high-fill"
					viewBox="0 0 16 16" class="d-inline-block align-text-top">
  <path
						d="M8 3a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 3zm8 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zm-13.5.5a.5.5 0 0 0 0-1h-2a.5.5 0 0 0 0 1h2zm11.157-6.157a.5.5 0 0 1 0 .707l-1.414 1.414a.5.5 0 1 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm-9.9 2.121a.5.5 0 0 0 .707-.707L3.05 5.343a.5.5 0 1 0-.707.707l1.414 1.414zM8 7a4 4 0 0 0-4 4 .5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5 4 4 0 0 0-4-4z" />
</svg> M A T I N É E
			</a>
		</div>
	</nav>


	<!-- 게시판 head -->
	<div class="container my-3 text-center">
		<table width="90%" cellpadding="0" cellspacing="0" border="1"
			style="border-color: #FFC0CB;">
			<tr style="background-color: #FAF0E6;">
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>

			<!-- 게시판 body -->
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.bid }</td>

					<!-- 제목 및 답글 -->
					<td class="text-left" width="45%"><c:forEach begin="1" end="${dto.bindent }">&nbsp;</c:forEach>
						<c:if test="${dto.bindent >= 1}">└RE:</c:if> <a
						href="content.do?bid=${dto.bid }" style="padding-left:10px; color: #FF738B;" >${dto.btitle }</a></td>
					<td>${dto.bname }</td>
					<td>${dto.bdate }</td>
					<td>${dto.bhit }</td>
				</tr>

			</c:forEach>
			<!--하단 버튼 두 개-->

			<tr>
				<td class="text-right" colspan="5"><a href="list.do"
					class="btn btn-sm btn-outline-secondary"
					style="background-color: #FAF0E6;">새로고침</a> <a
					href="writeAction.do" class="btn btn-sm btn-outline-secondary"
					style="background-color: #FFC0CB;">글쓰기</a></td>
			</tr>


			<!--페이징 -->
			<tr >
				<td colspan="5">
					<nav aria-label="...">
						<ul class="pagination" style="padding-left:30%">
							<!--이전 -->
							<li class="page-item disabled"><c:if test="${page.pre }">
									<a
										href="list.do?pageNum=${page.startPage - 1 }&amount=${page.amount}"
										style="color: #FF738B;">«이전&nbsp; </a>
								</c:if></li>

							<!--현재 페이지들 -->
							<c:forEach var="num" begin="${page.startPage }"
								end="${page.endPage }">
								<li class="${page.pageNum eq num ? 'active' : '' }"><a
									href="list.do?pageNum=${num }&amount=${page.amount}"
									style="color: #000000;">&nbsp;${num }</a></li>
							</c:forEach>


							<!--다음 -->
							<li class="page-item">
								<c:if test="${page.next && page.endPage > 0 }">
								<a href="list.do?pageNum=${page.endPage + 1 }&amount=${page.amount }"
										style="color: #FF738B;"> &nbsp;&nbsp;다음»</a>
								</c:if></li>
						</ul>
					</nav>
				</td>
			</tr>
		</table>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

	<!-- Option 2: jQuery, Popper.js, and Bootstrap JS <script
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> <script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script> <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
        integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
        crossorigin="anonymous"></script> -->
</body>
</html>