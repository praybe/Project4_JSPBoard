<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 자바스크립트 -->
<%@ page import="java.io.PrintWriter" %> 


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
<title>게시글 작성</title>

<!-- 공백 방지 -->
<script type="text/javascript">
window.onload = () => {
    
    let sbmBtn = document.querySelector("#sbmBtn"); 

    sbmBtn.onclick = () =>{
        if(document.getElementById("btitle").value == ""){
            alert("제목을 입력하세요"); //유효성 검사
        }else if(document.getElementById("bname").value == ""){
            alert("글쓴이 이름 없음");
        }else if(document.getElementById("bcontent").value == ""){
            alert("내용을 입력하세요");
        } else{
            //모든 항목이 채워졌을 경우
            alert("등록 완료");
            document.getElementById("write").submit();
        }

    };

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

	<!-- 글 작성-->
		<div class="container my-3 text-center">
			<table width="90%" cellpadding="0" cellspacing="0" border="1">
				<form id="write" action="writeFinish.do" method="post">

					<tr>
						<div class="mb-3">
							<th style="background-color: #FAF0E6;">제목</th>
							<th><input id="btitle" type="text" name="btitle" size="50"
								maxlength="100" class="form-control"
								placeholder="제목 입력"></th>
						</div>
					</tr>

					<tr>
						<div class="mb-3">
							<td style="background-color: #FAF0E6;">글쓴이</td>
							<td><input id="bname" type="text" name="bname" size="10"
								class="form-control" ></td>
						</div>
					</tr>
					<tr>
						<div class="mb-3">
							<td style="background-color: #FAF0E6;">내용</td>
							<td><textarea id="bcontent" name="bcontent" rows="13" cols="50"
									class="form-control" placeholder="내용 입력"></textarea></td>
						</div>
					</tr>

					<tr>
						<td colspan="2"><input id="sbmBtn" value="등록" class="btn btn-sm btn-outline-secondary" size="1.6em" style="background-color: #FFC0CB;">
							&nbsp;&nbsp; <a href="list.do" class="btn btn-sm btn-outline-secondary" style="background-color: #FAF0E6;" >취소</a></td>
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