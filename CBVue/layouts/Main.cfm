<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>Welcome to ColdBox & VueJS!</title>
	<meta name="description" content="">
    <meta name="author" content="Ortus Solutions, Corp">
	<!---Base URL --->
	<base href="#event.getHTMLBaseURL()#" />
	<!---css --->
	<link href="includes/css/App.css" rel="stylesheet">
	<!--- vendor js --->
	<cfif getSetting( "environment" ) EQ "development">
		<script src="includes/js/vendor-dev.js"></script>
	<cfelse>
		<script src="includes/js/vendor.min.js"></script>
	</cfif>
</head>
<body>
	<!-- Static navbar -->
	<nav class="navbar navbar-default navbar-static-top">
	  <div class="container">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##navbar" aria-expanded="false" aria-controls="navbar">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="##">ColdBox+Vue.js</a>
	    </div>
	    <div id="navbar" class="navbar-collapse collapse">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="##">Contacts</a></li>
	      </ul>
	    </div><!--/.nav-collapse -->
	  </div>
	</nav>

	<!---Container And Views --->
	<div class="container">#renderView()#</div>

	<footer class="footer">
		<p class="pull-right">
			<a href="##"><i class="glyphicon glyphicon-arrow-up"></i> Back to top</a>
		</p>
		<p>
			<a href="http://www.coldbox.org">ColdBox Platform</a> is a copyright-trademark software by
			<a href="http://www.ortussolutions.com">Ortus Solutions, Corp</a>
		</p>
		<p>
			Design thanks to
			<a href="http://twitter.github.com/bootstrap">Twitter Boostrap</a>
		</p>
	</footer>
	<!--- App JS --->
	<script src="includes/js/App.js"></script>
</body>
</html>
</cfoutput>
