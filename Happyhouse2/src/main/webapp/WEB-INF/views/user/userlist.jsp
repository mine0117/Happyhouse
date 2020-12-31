<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/main.do"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>회원 목록</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function searchUser() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "${root}/main.do";
			document.getElementById("searchform").submit();
		}
		function mvmain(){
			location.href="${root}/main.do";
		}
		</script>
	</head>
	<body>	
	<div class="container" align="center">
		<div class="col-lg-8" align="right">
		<strong>${userinfo.username}</strong>님 환영합니다.
		<a href="./logout">로그아웃</a>
		</div>
	  <div class="col-lg-8" align="center">
	  <h2>회원 목록</h2>
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right"><button type="button" class="btn btn-link" onclick="javascript:mvmain();">메인으로</button></td>
	  	</tr>
	  </table>
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="mvuserlist">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="key">
			    <option value="username">회원이름</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchUser();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${products.size() != 0}">
	  	<c:forEach var="user" items="${users}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info">
	      	<td>아이디</td>
	        <td>${user.userid}</td>
	      </tr>
	      <tr>
	      	<td>이름</td>
	        <td>${user.username}</td>
	      </tr>
	      <tr>
	      	<td>주소</td>
	        <td>${user.address}</td>
	      </tr>
	      <tr>
	      	<td>전화번호</td>
	        <td>${user.phone}</td>
	      </tr>
	      <c:if test="${userinfo.userid == user.userid}">
	      <tr>
	        <td colspan="2">
			<a href="${root}/main.do?act=mvmodiuser&username=${user.username}">회원정보 수정</a>
			<a href="${root}/main.do?act=mvdelete&unum=${user.unum}">회원정보 삭제</a>
			</td>
	      </tr>
	      </c:if>
	    </tbody>
	  </table>
	  	</c:forEach>
	  </c:if>
	  <c:if test="${users.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>회원 목록이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	</div>
	</body>
</html>
</c:if>