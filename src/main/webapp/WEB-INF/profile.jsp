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
    <title>Profile</title>
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
				
		<div class="footer--nav">
			<a href="/home">
				<svg width="36px" height="36px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M22 22L2 22" stroke="#978897" stroke-width="1.5" stroke-linecap="round"></path> <path d="M2 11L10.1259 4.49931C11.2216 3.62279 12.7784 3.62279 13.8741 4.49931L22 11" stroke="#978897" stroke-width="1.5" stroke-linecap="round"></path> <path d="M15.5 5.5V3.5C15.5 3.22386 15.7239 3 16 3H18.5C18.7761 3 19 3.22386 19 3.5V8.5" stroke="#978897" stroke-width="1.5" stroke-linecap="round"></path> <path d="M4 22V9.5" stroke="#978897" stroke-width="1.5" stroke-linecap="round"></path> <path d="M20 22V9.5" stroke="#978897" stroke-width="1.5" stroke-linecap="round"></path> <path d="M15 22V17C15 15.5858 15 14.8787 14.5607 14.4393C14.1213 14 13.4142 14 12 14C10.5858 14 9.87868 14 9.43934 14.4393C9 14.8787 9 15.5858 9 17V22" stroke="#978897" stroke-width="1.5"></path> <path d="M14 9.5C14 10.6046 13.1046 11.5 12 11.5C10.8954 11.5 10 10.6046 10 9.5C10 8.39543 10.8954 7.5 12 7.5C13.1046 7.5 14 8.39543 14 9.5Z" stroke="#978897" stroke-width="1.5"></path> </g></svg>
			</a>
			<a href="/profile" class="active">
				<svg width="30px" height="30px" viewBox="0 0 20 20" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><title>profile [#1341]</title><desc>Created with Sketch.</desc><defs> </defs><g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><g id="Dribbble-Light-Preview" transform="translate(-180.000000, -2159.000000)" fill="#978897"><g id="icons" transform="translate(56.000000, 160.000000)"><path d="M134,2008.99998 C131.783496,2008.99998 129.980955,2007.20598 129.980955,2004.99998 C129.980955,2002.79398 131.783496,2000.99998 134,2000.99998 C136.216504,2000.99998 138.019045,2002.79398 138.019045,2004.99998 C138.019045,2007.20598 136.216504,2008.99998 134,2008.99998 M137.775893,2009.67298 C139.370449,2008.39598 140.299854,2006.33098 139.958235,2004.06998 C139.561354,2001.44698 137.368965,1999.34798 134.722423,1999.04198 C131.070116,1998.61898 127.971432,2001.44898 127.971432,2004.99998 C127.971432,2006.88998 128.851603,2008.57398 130.224107,2009.67298 C126.852128,2010.93398 124.390463,2013.89498 124.004634,2017.89098 C123.948368,2018.48198 124.411563,2018.99998 125.008391,2018.99998 C125.519814,2018.99998 125.955881,2018.61598 126.001095,2018.10898 C126.404004,2013.64598 129.837274,2010.99998 134,2010.99998 C138.162726,2010.99998 141.595996,2013.64598 141.998905,2018.10898 C142.044119,2018.61598 142.480186,2018.99998 142.991609,2018.99998 C143.588437,2018.99998 144.051632,2018.48198 143.995366,2017.89098 C143.609537,2013.89498 141.147872,2010.93398 137.775893,2009.67298" id="profile-[#1341]"></path></g></g></g></g></svg>
			</a>
			<a href="/matches">
				<svg width="36px" height="36px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M14 10C14 9.44771 13.5523 9 13 9H12.5C9.46243 9 7 11.4624 7 14.5C7 17.5376 9.46243 20 12.5 20H17.5C20.5376 20 23 17.5376 23 14.5C23 12.0091 21.3441 9.90488 19.073 9.22823C18.5098 9.06042 18 9.52887 18 10.1166V10.1683C18 10.6659 18.3745 11.0735 18.8345 11.2634C20.1055 11.788 21 13.0395 21 14.5C21 16.433 19.433 18 17.5 18H12.5C10.567 18 9 16.433 9 14.5C9 12.567 10.567 11 12.5 11H13C13.5523 11 14 10.5523 14 10Z" fill="#978897"></path> <path d="M11.5 4C14.5376 4 17 6.46243 17 9.5C17 12.5376 14.5376 15 11.5 15H11C10.4477 15 10 14.5523 10 14C10 13.4477 10.4477 13 11 13H11.5C13.433 13 15 11.433 15 9.5C15 7.567 13.433 6 11.5 6H6.5C4.567 6 3 7.567 3 9.5C3 10.9605 3.89451 12.212 5.16553 12.7366C5.62548 12.9264 6 13.3341 6 13.8317V13.8834C6 14.4711 5.49024 14.9396 4.92699 14.7718C2.65592 14.0951 1 11.9909 1 9.5C1 6.46243 3.46243 4 6.5 4H11.5Z" fill="#978897"></path> </g></svg>
			</a>
			<a href="/logout">
				<svg width="36px" height="36px" viewBox="0 0 24 24" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <title>Session-Leave</title> <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="Session-Leave"> <rect id="Rectangle" fill-rule="nonzero" x="0" y="0" width="24" height="24"> </rect> <line x1="9" y1="12" x2="19" y2="12" id="Path" stroke="#978897" stroke-width="2" stroke-linecap="round"> </line> <path d="M16,8 L18.5858,10.5858 C19.3668,11.3668 19.3668,12.6332 18.5858,13.4142 L16,16" id="Path" stroke="#978897" stroke-width="2" stroke-linecap="round"> </path> <path d="M16,4 L6,4 C4.89543,4 4,4.89543 4,6 L4,18 C4,19.1046 4.89543,20 6,20 L16,20" id="Path" stroke="#978897" stroke-width="2" stroke-linecap="round"> </path> </g> </g> </g></svg>
			</a>
		</div>
	</div>
	<script src="/js/script.js"></script>
</body>
</html>