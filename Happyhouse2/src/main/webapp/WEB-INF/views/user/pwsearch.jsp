<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
function search() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else {
		$("#pwsearchform").attr("action", "${root}/main.do?act=pwsearch").submit();
	}
}
</script>
</head>
<body>

<div class="container" align="center">
	<div class="col-lg-6" align="center">
	<h3> 비밀번호 찾기 </h3>
		<form id="pwsearchform" method="post" action="">
		<input type="hidden" name="act" id="act" value="pwsearch">
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="userid" name="userid">
			</div>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-warning" onclick="javascript:search();">비밀번호 찾기</button>
			</div>
		</form>
	</div>
</div>
