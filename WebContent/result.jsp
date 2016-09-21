<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.iWen.survey.dto.Config"%>
<%@page import="com.iWen.survey.dao.DAOFactory"%>
<%@page import="com.iWen.survey.dao.ConfigDAO"%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Maintenance</title>
		<style type="text/css">* {
	margin: 0;
	padding: 0;
}

html, body {
	min-height: 100%;
}

body {
	position:relative;
	font-size: 11px;
	font-family: Verdana, sans-serif;
	background: #0a2b4f; /* Old browsers */
	background: -moz-linear-gradient(top, #0a2b4f 0%, #539ab8 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0a2b4f), color-stop(100%,#539ab8)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top, #0a2b4f 0%,#539ab8 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top, #0a2b4f 0%,#539ab8 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top, #0a2b4f 0%,#539ab8 100%); /* IE10+ */
	background: linear-gradient(to bottom, #0a2b4f 0%,#539ab8 100%); /* W3C */
}

a {
	color:#333;
}

.errorBody {
	min-height:780px;
	padding-top: 120px;
}

.errorBox {
	color: #333;
	position: relative;

	margin-left:auto;
	margin-right:auto;

	width: 880px;
	height: 300px;
	padding: 40px;

	background-color: rgba(255, 255, 255, 0.9);

	border-radius: 15px;
	box-shadow: 3px 3px 10px #333;
}

.statusCode,
.statusText {
	width: 320px;
	text-align: center;
	color: #555;
}

.statusCode {
	margin-top: 40px;
	font-size: 148px;
	font-weight: bold;
}

.statusText {
	font-size: 24px;
}

.errorDescription {
	position: absolute;
	top: 40px;
	right: 40px;
	width: 490px;
	height: 300px;
	padding-left:30px;
	border-left: 1px solid #e0e0e0;
}

.todo {
	position:absolute;
	bottom:0;
	width:490px;
}

@media (max-width: 980px) {
	.errorBody {
		padding-top:0;
	}

	.errorBox {
		width:auto;
		height:auto;
		margin:10px;
	}

	.statusCode {
		margin-top: 0;
	}

	.statusCode,
	.statusText {
		width:auto;
		text-align:center;
	}

	.errorDescription {
		position:relative;
		top:inherit;
		right:inherit;
		width:auto;
		height:auto;
		padding-left:0;
		border-left:0;
	}

	.todo {
		position:relative;
		width:auto;
		bottom:inherit;
	}

	.description {
		margin-top:16px;
		height:auto !important;
	}

	h2 {
		margin-top:16px;
	}
}

@media (max-width: 430px) {
	.statusCode {
		font-size:72px;
	}
}


.description {
	line-height:16px;
	height:100px;
}

h1.title {
	display:none;
}

h2 {
	font-size:11px;
	margin-bottom:20px;
}

.links ul li {
	float:left;
	line-height:27px;
	margin-right:20px;
	margin-bottom:-1px;
	height:27px;
	width:220px;
	border-top:1px solid #b3c6cc;;
	border-bottom:1px solid #b3c6cc;;
	list-style-type:none;
}

.links ul li:before{
	content: "\00BB\00A0";
}

.links ul li a {
	text-decoration:none;
	color:#333;
}

.links ul li a:hover {
	text-decoration:underline;
}

.tips ul li {
	line-height:27px;
	margin-right:20px;
	margin-bottom:-1px;
	border-top:1px solid #b3c6cc;;
	border-bottom:1px solid #b3c6cc;;
	list-style-type:none;
}

.tips ul li:before{
	content: "\00BB\00A0";
}

.de, .hu, .ru {
	display:none;
}

#locale-flags {
	display:none;
	position:absolute;
	top:10px;
	right:10px;
}

.locale-en .en {
	display:inline;
}
.locale-en .de,
.locale-en .hu,
.locale-en .ru {
	display:none;
}

.locale-de .de {
	display:inline;
}
.locale-de .en,
.locale-de .hu,
.locale-de .ru {
	display:none;
}

.locale-hu .hu {
	display:inline;
}
.locale-hu .en,
.locale-hu .de,
.locale-hu .ru{
	display:none;
}

.locale-ru .ru {
	display:inline;
}
.locale-ru .de,
.locale-ru .hu,
.locale-ru .en {
	display:none;
}
</style>
<% 
ConfigDAO cdao=DAOFactory.getConfigDAO();
Config cfg=cdao.findConfig();
%>


	</head>
	<body>
		<h1 class="title">
			<span class="en" id="title-en">Maintenance</span>
			<span class="de" id="title-de">Wartungsarbeiten</span>
			<span class="hu" id="title-hu">Karbantartás</span>
			<span class="ru" id="title-ru">Техническое обслуживание</span>
		</h1>
		<div class="errorBody">
			<div class="errorBox">
				<div id="locale-flags">
					<button id="set-locale-en">English</button> | <button id="set-locale-de">Deutsch</button> | <button id="set-locale-ru">Русский</button> | <button id="set-locale-hu">Magyar</button>
				</div>
				<div class="errorData">
					<div class="statusCode">503</div>
					<div class="statusText">
						<span class="en"><%=cfg.getCCloseWord()%></span>
						<span class="de">Wartungsarbeiten</span>
						<span class="hu">Karbantartás</span>
						<span class="ru">Техническое обслуживание</span>
					</div>
				</div>
				<div class="errorDescription">
					<div class="description">
						<span class="en">Our servers need love too, so we are performing scheduled maintenance at the moment. Please come back in a little while.
						</span>
						<span class="de">Unsere Server brauchen auch liebe, deshalb unternehmen wir grade Wartungsarbeiten. Bitte schauen sie in ein paar Minuten wieder zurück.</span>
						<span class="hu">A szervereknek is kell a szeretet, ezért jelenleg karbantartást végzünk. Nézzen vissza pár perc múlva.</span>
						<span class="ru">Наши серверы тоже нуждаются во внимании, поэтому в настоящий момент осуществляется их техническое обслуживание. Пожалуйста, обновите страницу позже.</span>
					</div>
					<div class="tips todo">
						<h2>
							<span class="en">Please follow these steps to get back on track:</span>
							<span class="de">Bitte versuchen sie folgendes:</span>
							<span class="hu">Próbálja meg az alábbiakat:</span>
							<span class="ru">Пожалуйста, следуйте данным указаниям для возвращения в обычный режим:</span>
						</h2>
						<ul>
							<li>
								<span class="en">Grab a cup of coffee.</span>
								<span class="de">Holen sie sich einen Kaffee.</span>
								<span class="hu">Igyon egy kávét.</span>
								<span class="ru">Попейте кофейку.</span>
							</li>
							<li>
								<span class="en">Read a (paper) newspaper.</span>
								<span class="de">Lesen sie eine Zeitung</span>
								<span class="hu">Olvasson egy újságot.</span>
								<span class="ru">Почитайте газетку.</span>
							</li>
							<li>
								<span class="en"><a href="" onclick="window.location.reload();return false;">Refresh this page</a>, maybe we're done already.</span>
								<span class="de"><a href="" onclick="window.location.reload();return false;">Laden sie die Seite neu</a>, vieleicht sind wir schon fertig.</span>
								<span class="hu"><a href="" onclick="window.location.reload();return false;">Frissítse az oldalt</a>, hátha már készen vagyunk.</span>
								<span class="ru"><a href="" onclick="window.location.reload();return false;">Обновите страницу</a>, возможно, мы уже закончили.</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">var languages = ['en', 'de', 'hu', 'ru'];

function switchLanguage(language) {
	if (languages.indexOf(language) !== false) {
		document.documentElement.className = 'locale-' + language;
		document.title = document.getElementById('title-' + language).innerHTML;
	}
}

function getLanguageEventHandler(language) {
	return function (e) {
		var event;
		if (!e) {
			event = window.event;
		} else {
			event = e;
		}

		event.stopPropagation();
		event.preventDefault();

		switchLanguage(language);
	}
}

function showFlags() {
	if (document.getElementById('locale-flags')) {
		document.getElementById('locale-flags').style.display='block';
		for (var i=0; i<languages.length;i++) {
			var handler = getLanguageEventHandler(languages[i]);
			var element = document.getElementById('set-locale-' + languages[i]);

			if (element.addEventListener) {
				element.addEventListener('click', handler, false);
			} else if (element.attachEvent) {
				element.attachEvent('onclick', handler);
			}
		}
	}
}

if (navigator.language) {
	var locale = navigator.language.split('-')[0];
	switchLanguage(locale);
	showFlags();
}
</script>
	</body>
</html>