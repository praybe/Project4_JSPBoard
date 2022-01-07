<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<title>게시글 확인</title>

<!-- 삭제 확인 -->
<script type="text/javascript">

function ConfirmDelete(){
    if(confirm("정말 삭제하시겠습니까?") == true){	//확인
        document.form.submit(); //유효성 검사
    } else{	//취소
        return false;

    }

};

function ConfirmModify(){
    if(confirm("수정을 진행합니다.") == true){	//확인
        document.form.submit(); //유효성 검사
    } else{	//취소
        return false;

    }

};
        
   </script>
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

	<!-- 글 확인 -->
	<div class="container my-3 text-center">
		<table width="90%" height="80%" cellpadding="0" cellspacing="0" border="1">
			<form action="modify.do" method="post">
				<input type="hidden" name="bid" value="${contentView.bid}">
				<tr>
					<td style="background-color: #FAF0E6;">번호</td>
					<td class="bg-secondary text-white">${contentView.bid}</td>
				</tr>
				<tr>
					<td style="background-color: #FAF0E6;">조회수</td>
					<td class="text-left">&nbsp;&nbsp;&nbsp;${contentView.bhit}</td>
				</tr>

				<tr>
					<td style="background-color: #FAF0E6;">제목</td>
					<td><input id="btitle" type="text" name="btitle" size="50"
					value="${contentView.btitle}" class="form-control" placeholder="수정제목 입력" ></td>
				</tr>
				
				<tr >
				<div class="mb-3">
					<td style="background-color: #FAF0E6;" >글쓴이</td>
					<td> <input id="bname" type="text" name="bname" size="10"
					value="${contentView.bname}" class="form-control"></td>
				</div>
				</tr>
				
				<tr>
				<div class="mb-3">
					<td style="background-color: #FAF0E6;">내용</td>
					<td><textarea id="bcontent" name="bcontent" rows="13" cols="50"
					class="form-control" placeholder="수정내용 입력" >${contentView.bcontent}</textarea></td>
				</div>
				</tr>

				<!--하단 버튼 4 개-->
				<tr>
					<td colspan="2">
					<a href="list.do"
						class="btn btn-sm btn-outline-secondary"
						style="background-color: #FAF0E6;">목록보기</a>
						<a
						href="reply.do?bid=${contentView.bid}"
						class="btn btn-sm btn-outline-secondary"
						style="background-color: #FFC0CB;" class="text-right">답변</a>
						<input type="submit" value="수정"
						class="btn btn-sm btn-outline-secondary"
						style="background-color: #FAF0E6;"
						Onclick="return ConfirmModify();">
						
						<a
						href="delete.do?bid=${contentView.bid}"
						class="btn btn-sm btn-outline-secondary"
						style="background-color: #FAF0E6;"
						Onclick="return ConfirmDelete();">삭제</a></td>
				</tr>
			</form>
		</table>
	</div>
	<hr />



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