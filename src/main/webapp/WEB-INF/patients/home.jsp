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
    <title>Home</title>
	<link rel="stylesheet" href="/css/style.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="header">
			<svg width="44px" height="44px" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0)matrix(-1, 0, 0, 1, 0, 0)"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <rect width="48" height="48" fill="white" fill-opacity="0.01"></rect> <path d="M19.036 44.0001C18.0561 40.8045 16.5778 38.4222 14.6011 36.8532C11.636 34.4997 6.92483 35.9624 5.18458 33.5349C3.44433 31.1073 6.40382 26.6431 7.44234 24.009C8.48086 21.375 3.46179 20.4436 4.04776 19.6958C4.43842 19.1973 6.97471 17.7587 11.6567 15.3801C12.987 7.79346 17.9008 4.00014 26.3982 4.00014C39.1441 4.00014 44 14.8061 44 21.679C44 28.552 38.1201 35.9563 29.7441 37.5528C28.9951 38.6436 30.0754 40.7927 32.9848 44.0001" stroke="#FFFFFF" stroke-width="4.66685" stroke-linecap="round" stroke-linejoin="round"></path> <path fill-rule="evenodd" clip-rule="evenodd" d="M19.4997 14.5C18.8464 17.0342 19.0408 18.8138 20.0829 19.8385C21.125 20.8633 22.9011 21.5334 25.4112 21.8489C24.8417 25.1176 25.5361 26.6511 27.4942 26.4493C29.4524 26.2475 30.6289 25.4338 31.0239 24.0083C34.0842 24.8684 35.7428 24.1486 35.9997 21.8489C36.3852 18.3993 34.525 15.6475 33.7624 15.6475C32.9997 15.6475 31.0239 15.5547 31.0239 14.5C31.0239 13.4452 28.7159 12.8493 26.6329 12.8493C24.5499 12.8493 25.8035 11.4452 22.9432 12C21.0363 12.3698 19.8885 13.2031 19.4997 14.5Z" fill="#B18FCF" stroke="#FFFFFF" stroke-width="4" stroke-linejoin="round"></path> <path d="M30.5002 25.5001C29.4833 26.1311 28.0878 27.1804 27.5002 28.0001C26.0313 30.0496 24.8398 31.2975 24.5791 32.6082" stroke="#FFFFFF" stroke-width="4" stroke-linecap="round"></path> </g></svg>
			<h1>Patient Home</h1>
			<div class="profile--button"></div>
		</div>
		
		<div class="sidebar" data-position="closed">
			<div class="sidebar--option">			
				<p>Patient Profile</p>
				<a href="javascript:delayForButtonTransition('/switch')">
					<c:choose>
						<c:when test="${profile.toString().compareTo('patient') == 0}">						
							<button class="btn--toggler">
								<div class="toggle--circle"></div>
							</button>
						</c:when>
						<c:otherwise>
							<button class="btn--toggler active">
								<div class="toggle--circle"></div>
							</button>
						</c:otherwise>
					</c:choose>
				</a>
				<p>Provider Profile</p>
			</div>
		</div>
		
		<div class="main">	
			<div class="card--container">
				<c:forEach items="${notMatches}" var="provider">
					<div class="card card--home">
						<div class="swipeCard--profile">
							<div class="swipeCard--pfp">
								<h2>${provider.getUser().getFirstName()} ${provider.getUser().getLastName()}</h2>
							</div>
						</div>
						<div class="swipeCard--actions">
							<button class="btn--pass">
								<svg width="64px" height="64px" viewBox="0 -12.02 94.56 94.56" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g id="lonely" transform="translate(-348.025 -315.87)"> <path id="Path_165" data-name="Path 165" d="M349.447,350.637c.283-26.645,16.425-33.358,45.852-33.349,29.454.009,45.579,6.732,45.863,33.349.293,27.431-16.712,34.454-46.56,34.329C365.119,384.84,349.163,377.4,349.447,350.637Z" fill="#D8D8F6" fill-rule="evenodd"></path> <path id="Path_166" data-name="Path 166" d="M349.447,350.637c.016-1.427.079-2.794.184-4.109,1.853,22.4,17.568,28.836,44.971,28.953,27.8.116,44.455-5.97,46.375-28.966.106,1.319.17,2.69.185,4.122.293,27.43-16.712,34.454-46.56,34.329C365.119,384.84,349.163,377.4,349.447,350.637Z" fill="#1a1818" fill-rule="evenodd" opacity="0.15"></path> <path id="Path_167" data-name="Path 167" d="M348.029,350.626c.147-13.861,4.477-22.574,12.647-27.855,8.007-5.174,19.644-6.9,34.623-6.9s26.626,1.745,34.638,6.924c8.17,5.282,12.5,13.99,12.644,27.832.151,14.259-4.252,23.253-12.623,28.7-8.209,5.34-20.173,7.123-35.361,7.059-15.019-.064-26.635-2.02-34.536-7.421-8.049-5.5-12.179-14.429-12.032-28.337Zm14.183-25.463c-7.327,4.735-11.211,12.7-11.346,25.485-.137,12.853,3.57,21.028,10.8,25.968,7.377,5.042,18.481,6.87,32.945,6.932,14.658.061,26.121-1.606,33.8-6.6,7.519-4.891,11.473-13.125,11.332-26.3-.136-12.774-4.016-20.737-11.342-25.473-7.484-4.838-18.636-6.464-33.1-6.468C380.851,318.7,369.7,320.322,362.212,325.163Z" fill="#1a1818" fill-rule="evenodd"></path> <path id="Path_168" data-name="Path 168" d="M374.591,351.742l-6.057,0a1.679,1.679,0,0,1-1.171-2.883,5.687,5.687,0,0,1,8.494.108,1.678,1.678,0,0,1-1.266,2.773Z" fill="#eb505e" fill-rule="evenodd"></path> <path id="Path_169" data-name="Path 169" d="M422.074,351.744h-6.057a1.68,1.68,0,0,1-1.163-2.892,5.587,5.587,0,0,1,.462-.45,5.768,5.768,0,0,1,7.457,0,5.587,5.587,0,0,1,.568.56,1.68,1.68,0,0,1-1.267,2.782Z" fill="#eb505e" fill-rule="evenodd"></path> <path id="Path_170" data-name="Path 170" d="M363.387,341.376a1.417,1.417,0,1,1,2.159-1.836,7.7,7.7,0,0,0,.853.85,8.072,8.072,0,0,0,10.323,0,7.659,7.659,0,0,0,.852-.856,1.421,1.421,0,1,1,2.159,1.848,10.525,10.525,0,0,1-1.174,1.167,10.911,10.911,0,0,1-14.007,0A10.413,10.413,0,0,1,363.387,341.376Z" fill="#1a1818" fill-rule="evenodd"></path> <path id="Path_171" data-name="Path 171" d="M365.36,334.415a1.418,1.418,0,1,1,1.246-2.547,7.734,7.734,0,0,0,8.874-2.377,1.42,1.42,0,1,1,2.359,1.58,10.512,10.512,0,0,1-12.479,3.344Z" fill="#1a1818" fill-rule="evenodd"></path> <path id="Path_172" data-name="Path 172" d="M412.768,331.072a1.42,1.42,0,0,1,2.359-1.58A7.731,7.731,0,0,0,424,331.869a1.418,1.418,0,1,1,1.246,2.548,10.511,10.511,0,0,1-12.479-3.345Z" fill="#1a1818" fill-rule="evenodd"></path> <path id="Path_173" data-name="Path 173" d="M410.872,341.376a1.417,1.417,0,1,1,2.159-1.836,7.514,7.514,0,0,0,.852.849,8.071,8.071,0,0,0,10.325,0,7.559,7.559,0,0,0,.851-.855,1.421,1.421,0,1,1,2.159,1.848,10.428,10.428,0,0,1-1.174,1.166,10.91,10.91,0,0,1-14.008,0A10.4,10.4,0,0,1,410.872,341.376Z" fill="#1a1818" fill-rule="evenodd"></path> <path id="Path_174" data-name="Path 174" d="M387.363,355.544c-.476,0-.862-.633-.862-1.413s.386-1.413.862-1.413h15.882c.476,0,.862.633.862,1.413s-.386,1.413-.862,1.413Z" fill="#1a1818" fill-rule="evenodd"></path> </g> </g></svg>
							</button>
 							<form action="/patient/${loggedUser}/match" method="POST">
 								<input type="hidden" name="_method" value="put"/>
 								<select name="provider" hidden="hidden">
 									<option value="${provider.getId()}" selected></option>
 								</select>
								<button class="btn--match">
									<svg width="64px" height="64px" viewBox="0 -12.02 94.572 94.572" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g id="happy" transform="translate(-62.8 -53.014)"> <path id="Path_1" data-name="Path 1" d="M64.223,87.785c.283-26.649,16.426-33.362,45.857-33.353,29.458.009,45.585,6.732,45.869,33.353.293,27.433-16.715,34.458-46.566,34.333C79.9,121.992,63.938,114.549,64.223,87.785Z" fill="#a4d4b2" fill-rule="evenodd"></path> <path id="Path_2" data-name="Path 2" d="M64.223,87.785c.015-1.428.078-2.8.184-4.11,1.853,22.4,17.569,28.84,44.977,28.957,27.8.116,44.46-5.971,46.379-28.97.107,1.319.171,2.69.186,4.123.292,27.433-16.714,34.458-46.565,34.333C79.9,121.992,63.939,114.55,64.223,87.785Z" fill="#1a1818" fill-rule="evenodd" opacity="0.15"></path> <path id="Path_3" data-name="Path 3" d="M62.8,87.774c.147-13.863,4.477-22.577,12.649-27.858,8.008-5.175,19.647-6.907,34.627-6.9s26.629,1.745,34.642,6.925c8.172,5.282,12.5,13.991,12.646,27.835.152,14.26-4.252,23.255-12.625,28.7-8.21,5.341-20.175,7.124-35.365,7.06-15.021-.064-26.638-2.02-34.54-7.422-8.051-5.5-12.182-14.431-12.034-28.34ZM76.988,62.308C69.661,67.043,65.776,75.01,65.641,87.8c-.137,12.855,3.57,21.031,10.8,25.971,7.377,5.043,18.483,6.871,32.949,6.932,14.66.062,26.125-1.606,33.808-6.6,7.52-4.893,11.474-13.128,11.334-26.3-.137-12.776-4.017-20.74-11.344-25.477-7.485-4.838-18.638-6.464-33.107-6.469C95.63,55.846,84.48,57.467,76.988,62.308Z" fill="#1a1818" fill-rule="evenodd"></path> <path id="Path_4" data-name="Path 4" d="M95.871,86.318a1.419,1.419,0,1,1,2.146-1.857,15.345,15.345,0,0,0,1.58,1.584,16.308,16.308,0,0,0,20.969,0,15.318,15.318,0,0,0,1.588-1.584,1.419,1.419,0,1,1,2.146,1.857,17.937,17.937,0,0,1-1.877,1.873,19.151,19.151,0,0,1-24.683,0A17.964,17.964,0,0,1,95.871,86.318Z" fill="#1a1818" fill-rule="evenodd"></path> <path id="Path_5" data-name="Path 5" d="M89.369,88.893l-6.057,0a1.68,1.68,0,0,1-1.172-2.884,5.753,5.753,0,0,1,7.928-.46,5.537,5.537,0,0,1,.568.568,1.678,1.678,0,0,1-1.267,2.773Z" fill="#eb505e" fill-rule="evenodd"></path> <path id="Path_6" data-name="Path 6" d="M136.858,88.895H130.8A1.68,1.68,0,0,1,129.638,86a5.438,5.438,0,0,1,.462-.45,5.77,5.77,0,0,1,7.458,0,5.575,5.575,0,0,1,.567.56,1.68,1.68,0,0,1-1.267,2.782Z" fill="#eb505e" fill-rule="evenodd"></path> <g id="Group_1" data-name="Group 1"> <path id="Path_7" data-name="Path 7" d="M86.342,82.325A6.226,6.226,0,1,0,80.116,76.1,6.237,6.237,0,0,0,86.342,82.325Z" fill="#1a1818" fill-rule="evenodd"></path> <path id="Path_8" data-name="Path 8" d="M85.747,75.709a2,2,0,1,0-2-2A2,2,0,0,0,85.747,75.709Z" fill="#ffffff" fill-rule="evenodd"></path> <path id="Path_9" data-name="Path 9" d="M83.649,79.028a1.241,1.241,0,1,0-1.241-1.24A1.242,1.242,0,0,0,83.649,79.028Z" fill="#ffffff" fill-rule="evenodd"></path> </g> <g id="Group_2" data-name="Group 2"> <path id="Path_10" data-name="Path 10" d="M133.83,82.325A6.226,6.226,0,1,0,127.6,76.1,6.238,6.238,0,0,0,133.83,82.325Z" fill="#1a1818" fill-rule="evenodd"></path> <path id="Path_11" data-name="Path 11" d="M133.236,75.709a2,2,0,1,0-2-2A2,2,0,0,0,133.236,75.709Z" fill="#ffffff" fill-rule="evenodd"></path> <path id="Path_12" data-name="Path 12" d="M131.137,79.028a1.241,1.241,0,1,0-1.241-1.24A1.243,1.243,0,0,0,131.137,79.028Z" fill="#ffffff" fill-rule="evenodd"></path> </g> </g> </g></svg>
								</button>
 							</form>
						</div>
					</div>
				</c:forEach>		
			</div>
		</div>
				
		<div class="footer--nav">
			<a href="/home" class="active">
				<svg width="36px" height="36px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier_home"><path d="M22 22L2 22" stroke="#FFFFFF" stroke-width="1.5" stroke-linecap="round"></path><path d="M2 11L10.1259 4.49931C11.2216 3.62279 12.7784 3.62279 13.8741 4.49931L22 11" stroke="#FFFFFF" stroke-width="1.5" stroke-linecap="round"></path><path d="M15.5 5.5V3.5C15.5 3.22386 15.7239 3 16 3H18.5C18.7761 3 19 3.22386 19 3.5V8.5" stroke="#FFFFFF" stroke-width="1.5" stroke-linecap="round"></path><path d="M4 22V9.5" stroke="#FFFFFF" stroke-width="1.5" stroke-linecap="round"></path><path d="M20 22V9.5" stroke="#FFFFFF" stroke-width="1.5" stroke-linecap="round"></path><path d="M15 22V17C15 15.5858 15 14.8787 14.5607 14.4393C14.1213 14 13.4142 14 12 14C10.5858 14 9.87868 14 9.43934 14.4393C9 14.8787 9 15.5858 9 17V22" stroke="#FFFFFF" stroke-width="1.5"></path><path d="M14 9.5C14 10.6046 13.1046 11.5 12 11.5C10.8954 11.5 10 10.6046 10 9.5C10 8.39543 10.8954 7.5 12 7.5C13.1046 7.5 14 8.39543 14 9.5Z" stroke="#FFFFFF" stroke-width="1.5"></path></g></svg>
			</a>
			<a href="/profile">
				<svg width="30px" height="30px" viewBox="0 0 20 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>profile [#1341]</title> <desc>Created with Sketch.</desc> <defs> </defs> <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="Dribbble-Light-Preview" transform="translate(-180.000000, -2159.000000)" fill="#FFFFFF"> <g id="icons" transform="translate(56.000000, 160.000000)"> <path d="M134,2008.99998 C131.783496,2008.99998 129.980955,2007.20598 129.980955,2004.99998 C129.980955,2002.79398 131.783496,2000.99998 134,2000.99998 C136.216504,2000.99998 138.019045,2002.79398 138.019045,2004.99998 C138.019045,2007.20598 136.216504,2008.99998 134,2008.99998 M137.775893,2009.67298 C139.370449,2008.39598 140.299854,2006.33098 139.958235,2004.06998 C139.561354,2001.44698 137.368965,1999.34798 134.722423,1999.04198 C131.070116,1998.61898 127.971432,2001.44898 127.971432,2004.99998 C127.971432,2006.88998 128.851603,2008.57398 130.224107,2009.67298 C126.852128,2010.93398 124.390463,2013.89498 124.004634,2017.89098 C123.948368,2018.48198 124.411563,2018.99998 125.008391,2018.99998 C125.519814,2018.99998 125.955881,2018.61598 126.001095,2018.10898 C126.404004,2013.64598 129.837274,2010.99998 134,2010.99998 C138.162726,2010.99998 141.595996,2013.64598 141.998905,2018.10898 C142.044119,2018.61598 142.480186,2018.99998 142.991609,2018.99998 C143.588437,2018.99998 144.051632,2018.48198 143.995366,2017.89098 C143.609537,2013.89498 141.147872,2010.93398 137.775893,2009.67298" id="profile-[#1341]"> </path> </g> </g> </g> </g></svg>
			</a>
			<a href="/patient/matches">
				<svg width="36px" height="36px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M14 10C14 9.44771 13.5523 9 13 9H12.5C9.46243 9 7 11.4624 7 14.5C7 17.5376 9.46243 20 12.5 20H17.5C20.5376 20 23 17.5376 23 14.5C23 12.0091 21.3441 9.90488 19.073 9.22823C18.5098 9.06042 18 9.52887 18 10.1166V10.1683C18 10.6659 18.3745 11.0735 18.8345 11.2634C20.1055 11.788 21 13.0395 21 14.5C21 16.433 19.433 18 17.5 18H12.5C10.567 18 9 16.433 9 14.5C9 12.567 10.567 11 12.5 11H13C13.5523 11 14 10.5523 14 10Z" fill="#FFFFFF"></path> <path d="M11.5 4C14.5376 4 17 6.46243 17 9.5C17 12.5376 14.5376 15 11.5 15H11C10.4477 15 10 14.5523 10 14C10 13.4477 10.4477 13 11 13H11.5C13.433 13 15 11.433 15 9.5C15 7.567 13.433 6 11.5 6H6.5C4.567 6 3 7.567 3 9.5C3 10.9605 3.89451 12.212 5.16553 12.7366C5.62548 12.9264 6 13.3341 6 13.8317V13.8834C6 14.4711 5.49024 14.9396 4.92699 14.7718C2.65592 14.0951 1 11.9909 1 9.5C1 6.46243 3.46243 4 6.5 4H11.5Z" fill="#FFFFFF"></path> </g></svg>
			</a>
			<a href="/logout">
				<svg width="36px" height="36px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>Session-Leave</title> <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="Session-Leave"> <rect id="Rectangle" fill-rule="nonzero" x="0" y="0" width="24" height="24"> </rect> <line x1="9" y1="12" x2="19" y2="12" id="Path" stroke="#FFFFFF" stroke-width="2" stroke-linecap="round"> </line> <path d="M16,8 L18.5858,10.5858 C19.3668,11.3668 19.3668,12.6332 18.5858,13.4142 L16,16" id="Path" stroke="#FFFFFF" stroke-width="2" stroke-linecap="round"> </path> <path d="M16,4 L6,4 C4.89543,4 4,4.89543 4,6 L4,18 C4,19.1046 4.89543,20 6,20 L16,20" id="Path" stroke="#FFFFFF" stroke-width="2" stroke-linecap="round"> </path> </g> </g> </g></svg>
			</a>
		</div>
	</div>
	
	<script src="/js/global.js"></script>
	<script src="/js/home.js"></script>
</body>
</html>
