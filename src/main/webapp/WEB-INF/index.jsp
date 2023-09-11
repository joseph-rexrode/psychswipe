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
		<div class="header">
			<svg width="44px" height="44px" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0)matrix(-1, 0, 0, 1, 0, 0)"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <rect width="48" height="48" fill="white" fill-opacity="0.01"></rect> <path d="M19.036 44.0001C18.0561 40.8045 16.5778 38.4222 14.6011 36.8532C11.636 34.4997 6.92483 35.9624 5.18458 33.5349C3.44433 31.1073 6.40382 26.6431 7.44234 24.009C8.48086 21.375 3.46179 20.4436 4.04776 19.6958C4.43842 19.1973 6.97471 17.7587 11.6567 15.3801C12.987 7.79346 17.9008 4.00014 26.3982 4.00014C39.1441 4.00014 44 14.8061 44 21.679C44 28.552 38.1201 35.9563 29.7441 37.5528C28.9951 38.6436 30.0754 40.7927 32.9848 44.0001" stroke="#FFFFFF" stroke-width="4.66685" stroke-linecap="round" stroke-linejoin="round"></path> <path fill-rule="evenodd" clip-rule="evenodd" d="M19.4997 14.5C18.8464 17.0342 19.0408 18.8138 20.0829 19.8385C21.125 20.8633 22.9011 21.5334 25.4112 21.8489C24.8417 25.1176 25.5361 26.6511 27.4942 26.4493C29.4524 26.2475 30.6289 25.4338 31.0239 24.0083C34.0842 24.8684 35.7428 24.1486 35.9997 21.8489C36.3852 18.3993 34.525 15.6475 33.7624 15.6475C32.9997 15.6475 31.0239 15.5547 31.0239 14.5C31.0239 13.4452 28.7159 12.8493 26.6329 12.8493C24.5499 12.8493 25.8035 11.4452 22.9432 12C21.0363 12.3698 19.8885 13.2031 19.4997 14.5Z" fill="#B18FCF" stroke="#FFFFFF" stroke-width="4" stroke-linejoin="round"></path> <path d="M30.5002 25.5001C29.4833 26.1311 28.0878 27.1804 27.5002 28.0001C26.0313 30.0496 24.8398 31.2975 24.5791 32.6082" stroke="#FFFFFF" stroke-width="4" stroke-linecap="round"></path> </g></svg>
			<h1><span class="psych">Psych</span><span class="swipe">Swipe</span></h1>
		</div>
		
		<div class="main">
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
						<input type="submit" value="Log in" class="btn--accent btn--login">
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
						<input type="submit" value="Register" class="btn--accent btn--register">
					</form:form>
				</div>
				<button class="switch" id="switch-register">
					<p>Existing User?</p>
					<svg width="32px" height="32px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M13 3H12C7.02944 3 3 7.02944 3 12C3 16.9706 7.02944 21 12 21H13M17 8L21 12M21 12L17 16M21 12H9" stroke="#B18FCF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
				</button>
			</div>
		</div>
	</div>
	<script src="/js/index.js"></script>
</body>
</html>

