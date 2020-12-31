<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<script type="text/javascript">
function deleteuser(){
	document.getElementById("deleteuserform").action = "${root}/main.do";
	document.getElementById("deleteuserform").submit();
}

function no(){
	document.location.href = "${root}/main.do";
}
</script>
</head>
<body>

<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="deleteuserform" method="post" action="">
		<input type="hidden" name="unum" id="unum" value="${userinfo.unum}">
		<input type="hidden" name="act" id="act" value="delete">
		<h5>${userinfo.username}님 정말 회원 탈퇴를 진행하시겠습니까?</h5>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-warning" onclick="javascript:deleteuser();">예</button>
				<button type="button" class="btn btn-primary" onclick="javascript:no();">아니오</button>
			</div>
		</form>
	</div>
</div>
