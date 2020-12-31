<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${login == null}">
	<c:redirect url="/index"/>
</c:if>
<c:if test="${login != null}">
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>주택 거래 목록</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function searchHouse() {
			if(document.getElementById("sword").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "#";
			document.getElementById("searchform").submit();
		}
		function searchDetail(houseNo){
			location.href="./detailAt?&no="+houseNo;
		}
		function pageMove(pg) { 
			document.getElementById("pg").value=pg;
			document.getElementById("pageform").action = "#";
			document.getElementById("pageform").submit();
		}
		
		
		</script>
	</head>
	<body>	
	
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="list">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	
	<div class="container" align="center">
		<div class="col-lg-8" align="right">
		<strong>${login.username}</strong>님 환영합니다.
		<a href="./logout">로그아웃</a>
		</div>
	  <div class="col-lg-8" align="center">
	  <h2>주택 거래 목록</h2>
	  <form id="searchform" method="get" class="form-inline" action="">
	   <input type="hidden" name="no" id="no" value="${house.no}">
	  <input type="hidden" name="act" id="act" value="list">
	   <input type="hidden" name="pg" id="pg" value="1">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
		  	  <select class="form-control" name="key" id="skey">
			    <option value="dong">동</option>
			    <option value="aptName">아파트 이름</option>
			  </select>
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="sword">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchHouse();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${houses.size() != 0}">
	  <table class="table table-active">
	    <tbody>
		<tr>
		<td>번호</td><td>동</td><td>아파트이름</td><td>거래금액</td><td>거래종류</td><td></td>
		</tr>	  
	  	<c:forEach var="house" items="${houses}" begin="0" end="100">
	      <tr class="table-info">
	        <td>${house.no}</td>
	        <td>${house.dong}</td>
	        <td>${house.aptName}</td>
	        <td>${house.dealAmount}</td>
	        <td>${house.type}</td>
	        <td><button type="button" class="btn btn-primary" onclick="javascript:searchDetail(${house.no});">상세조회</button></td>
	      </tr>
	  	</c:forEach>
	    </tbody>
	  </table>
	  <table>
	  <tr>
	  <td>
	  ${navigation.navigator}
	  </td>
	  </tr>
	  </table>
	  </c:if>
	  <c:if test="${houses.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>등록된 주택 거래 내역이 없습니다.</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
	  </div>
	</div>
	</body>
</html>
</c:if>