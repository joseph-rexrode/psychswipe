<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width"/>
    <title>Login</title>
	<link rel="stylesheet" href="/css/style.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="card login">
			<h2>Login</h2>
			<div class="form">
				<form:form action="/login" method="POST" modelAttribute="newLogin">
					<div class="form--section">
						<form:label path="email" class="form--section-label">Email: </form:label>
						<form:input path="email" class="form--section-input" type="email"/>
					</div>
					<div class="form--section form--section-error">
						<form:errors path="email" class="warning-text"/>
					</div>
					<div class="form--section">
						<form:label path="password" class="form--section-label">Password: </form:label>
						<form:input path="password" class="form--section-input" type="password"/>
					</div>
					<div class="form--section form--section-error">
						<form:errors path="password" class="warning-text"/>
					</div>
					<input type="submit" value="Log in" class="form--btn">
				</form:form>
			</div>
			<button class="switch" id="switch-login">
				<p>Sign up!</p>
				<svg width="32px" height="32px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M13 3H12C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21H13M17 8L21 12M21 12L17 16M21 12H9" stroke="#B18FCF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
			</button>
		</div>
		<div class="card register">
			<h2>Register</h2>
			<div class="form">
				<form:form action="/register" method="POST" modelAttribute="newUser">
					<div class="form--section">
						<form:label path="username" class="form--section-label">Username: </form:label>
						<form:input path="username" class="form--section-input"/>
					</div>
					<div class="form--section form--section-error">
						<form:errors path="username" class="warning-text"/>
					</div>
					<div class="form--section">
						<form:label path="email" class="form--section-label">Email: </form:label>
						<form:input path="email" class="form--section-input" type="email"/>
					</div>
					<div class="form--section form--section-error">
						<form:errors path="email" class="warning-text"/>
					</div>
					<div class="form--section">
						<form:label path="password" class="form--section-label">Password: </form:label>
						<form:input path="password" class="form--section-input" type="password"/>
					</div>
					<div class="form--section form--section-error">
						<form:errors path="password" class="warning-text"/>
					</div>
					<div class="form--section">
						<form:label path="confirm" class="form--section-label">Confirm<br>Password: </form:label>
						<form:input path="confirm" class="form--section-input" type="password"/>
					</div>
					<div class="form--section form--section-error">
						<form:errors path="confirm" class="warning-text"/>
					</div>
					<input type="submit" value="Register" class="form--btn btn--register">
				</form:form>
			</div>
			<button class="switch" id="switch-register">
				<p>Existing User?</p>
				<svg width="32px" height="32px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M13 3H12C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21H13M17 8L21 12M21 12L17 16M21 12H9" stroke="#B18FCF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
			</button>
		</div>
	</div>
	
	<script src="/js/script.js"></script>
</body>
</html>

