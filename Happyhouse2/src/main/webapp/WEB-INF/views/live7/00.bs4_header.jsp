<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<nav id="index_nav_login">
			<div class="m-0 p-0">
			
				
				<c:if test="${login == null}">
				<li class="float-right"><a class="p-1" href="./regi">SignUp</a></li>
				<li class="float-right"><a class="p-1" href="${pageContext.request.contextPath}/login">Login</a></li>
					</c:if>
					
						<c:if test="${login != null}">
						<li class="float-right">
						<strong>${login.username}</strong>님 로그인<br></li>
								
						</c:if>
			</div>
		</nav>
		<header id="index_header" class="jumbotron text-center mb-1">
			<h2>HAPPY HOUSE</h2> 
			<h5>행복한 동현이 한별이 집</h5> 
			
		</header>
		