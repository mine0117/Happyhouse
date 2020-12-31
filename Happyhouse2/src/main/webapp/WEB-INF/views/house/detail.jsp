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
		<title>아파트 거래 상세 정보</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
 	   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8940d7dfdaa8e8db4c0f4d73dd782a21"></script>
		
		<script type="text/javascript">
		function searchUser() {
			if(document.getElementById("word").value == "") {
				alert("모든 목록 조회!!");
			}
			document.getElementById("searchform").action = "#";
			document.getElementById("searchform").submit();
		}
		function mvmain(){
			location.href="./loginAf";
		}
		function mvlist(){
			location.href="./houselistAt"
		}
		</script>
	</head>
	<body>	
	<div class="container" align="center">
		<div class="col-lg-8" align="right">
		<strong>${login.username}</strong>님 환영합니다.
		<a href="./logout">로그아웃</a>
		</div>
	  <div class="col-lg-8" align="center">
	  <h2>주택 거래 상세 정보</h2>
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right"><button type="button" class="btn btn-link" onclick="javascript:mvmain();">메인으로</button></td>
	  	</tr>
	  	<tr>
	  		<td align="right"><button type="button" class="btn btn-link" onclick="javascript:mvlist();">거래 목록으로</button></td>
	  	</tr>
	  </table>
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="mvuserlist">
	  </form>
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info">
	      	<td>주택명</td>
	      	
	        <td>${houseinfo.aptName}</td>
	      </tr>
	      <tr>
	      	<td>거래금액</td>
	        <td>${houseinfo.dealAmount}</td>
	      </tr>
	      <tr>
	      	<td>월세금액</td>
	        <td>${houseinfo.rentMoney}</td>
	      </tr>
	      <tr>
	      	<td>건축연도</td>
	        <td>${houseinfo.buildYear}</td>
	      </tr>
	      <tr>
	      	<td>전용면적</td>
	        <td>${houseinfo.area}</td>
	      </tr>
	      <tr>
	      	<td>거래일</td>
	        <td>${houseinfo.dealYear}년 ${houseinfo.dealMonth}월 ${houseinfo.dealDay}일</td>
	      </tr>
	      <tr>
	      	<td>법정동</td>
	        <td>${houseinfo.dong}</td>
	      </tr>
	      <tr>
	      	<td>지번</td>
	        <td>${houseinfo.jibun}</td>
	      </tr>
	    </tbody>
	  </table>
	  </div>
	  <div style="text-align: right;">
	  	<img src="./WEB-INF/views/img/${houseinfo.aptName}.jpg" onerror="this.src='./WEB-INF/views/img/다세대주택.jpg'" height ="350" width = "500"></img>
	  	
	 	 <div id="staticMap" style="width:500px;height:350px; float : left"></div> 	   
	  </div>
	  
	  <script type="text/javascript">




var list = '<c:out value="${houseinfo.lat}"/>';
var list2 = '<c:out value="${houseinfo.lng}"/>';


var markerPosition  = new kakao.maps.LatLng(list, list2); 


var marker = {
    position: markerPosition
};

var staticMapContainer  = document.getElementById('staticMap'),  
    staticMapOption = { 
        center: new kakao.maps.LatLng(list,list2), 
        level: 3, 
        marker: marker  
    };    


var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
	</div>
	</body>
</html>
</c:if>