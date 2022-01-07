<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.sql.*"%>
<!-- SQL문을 이용하기 위한 import -->

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>답글 작성</title>
</head>
<body>
	<!-- 상단바 -->
	<nav class="navbar navbar-light " style="background-color: #FFC0CB;">
		<div class="container-fluid justify-content-center">
			<a class="navbar-brand" style="font-family: Bernard MT"> <svg xmlns="http://www.w3.org/2000/svg"
					width="30" height="24" fill="currentColor"
					class="bi bi-brightness-alt-high-fill" viewBox="0 0 16 16"
					class="d-inline-block align-text-top">
  <path
						d="M8 3a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 3zm8 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zm-13.5.5a.5.5 0 0 0 0-1h-2a.5.5 0 0 0 0 1h2zm11.157-6.157a.5.5 0 0 1 0 .707l-1.414 1.414a.5.5 0 1 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm-9.9 2.121a.5.5 0 0 0 .707-.707L3.05 5.343a.5.5 0 1 0-.707.707l1.414 1.414zM8 7a4 4 0 0 0-4 4 .5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5 4 4 0 0 0-4-4z" />
</svg> M A T I N É E
			</a>
		</div>
	</nav>

	<!-- 답글 작성-->
	<div class="container my-3 text-center">
		<table width="90%" cellpadding="0" cellspacing="0" border="1">
			<form action="replyAction.do" method="post">
				<input type="hidden" name="bid" value="${reply.bid}"> <input
					type="hidden" name="bgroup" value="${reply.bgroup}"> <input
					type="hidden" name="bstep" value="${reply.bstep}"> <input
					type="hidden" name="bindent" value="${reply.bindent}">

				<tr style="background-color: #FAF0E6;">
					<td>번호</td>
					<td class="bg-secondary text-white">${reply.bid}</td>
					
				</tr>
			<tr style="background-color: #FAF0E6;">
				<div class="mb-3">
					<td>답글제목</td>
					<td><input type="text" name="btitle" value="${reply.btitle}"
						class="form-control" id="replyTitle" placeholder="답글제목 입력"></td>
				</div>
			</tr>
			<tr style="background-color: #FAF0E6;">
				<div class="mb-3">
				<td>글쓴이</td>
				<td><input type="text" name="bname" value="${reply.bname}"
					class="form-control" id="replyName"></td>
				</div>
			</tr>



			<tr style="background-color: #FAF0E6;">
				<div class="mb-3">
				<td>답글내용</td>
				<td><textarea rows="13" cols="50" name="bcontent"
						class="form-control" id="replyContext" placeholder="답글내용 입력">${reply.bcontent}</textarea></td>
				</div>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="답글등록"
					class="btn btn-sm btn-outline-secondary"
					style="background-color: #FFC0CB;"> &nbsp;&nbsp; <a
					href="list.do" class="btn btn-sm btn-outline-secondary"
					style="background-color: #FAF0E6;">취소</a></td>
			</tr>


			</form>
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