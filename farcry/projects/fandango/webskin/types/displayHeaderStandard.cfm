<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Header Standard --->
<!--- @@author: Justin Carter (justin@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<!--- params --->
<cfparam name="stParam.title" default="#stobj.label#">


<cfcontent reset="true">
<cfoutput><!doctype html>
<!--[if lt IE 7]><html class="ie6 oldie" lang="en"><![endif]-->
<!--[if IE 7]><html class="ie7 oldie" lang="en"><![endif]-->
<!--[if IE 8]><html class="ie8 oldie" lang="en"><![endif]-->
<!--[if gt IE 8]><!--><html lang="en"><!--<![endif]-->

<head>
	<meta charset="utf-8">

	<title>#stParam.title#</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<!--[if lt IE 9]><script src="/js/html5shiv.js"></script><![endif]-->

	<link rel="stylesheet" type="text/css" href="/css/960_12_col.css"></link>
	<link rel="stylesheet" type="text/css" href="/css/style.css"></link>

	<skin:loadJS id="jquery" />
	<skin:loadJS id="farcry-devicetype" />

</head>

<!--- temporary!!! --->

	<script src="//cdn.jquerytools.org/1.2.6/full/jquery.tools.min.js"></script>

	<script type="text/javascript">
	$j(function(){
		$j("##header-search input[name='q']").focus(function(){
			if (this.value == "Search") this.value = "";
		});
		$j("##header-search input[name='q']").blur(function(){
			if (this.value == "") this.value = "Search";
		});
	});
	</script>

<!--- temporary!!! --->

<body>

<div class="wrapper">

	<header>
		<div class="container_12">
			<div class="grid_3" id="header-logo">
				<a href="/"><img src="/css/images/logo.png" alt="Logo"></a>
			</div>
			<div class="grid_6" id="header-nav">
				<nav>
					<skin:genericNav navID="#application.navid.home#" id="nav" depth="1" bActive="true" bIncludeHome="true" />
				</nav>
			</div>
			<div class="grid_3" id="header-search">
				<form method="get" action="#application.fapi.getLink(type="dmSimpleSearch")#">
					<div class="search-box">
						<input type="hidden" name="type" value="dmSimpleSearch">
						<input type="text" name="q" class="input" value="Search"><button type="submit">Search</button>
					</div>
				</form>
			</div>
		</div>
	</header>

</cfoutput>

<cfsetting enablecfoutputonly="false">