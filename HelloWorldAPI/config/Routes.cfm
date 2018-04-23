<cfscript>
	// Allow for full server rewrites (no index.cfm), by default there is a server.json in the root with this enabled
	this.setFullRewrites( true );
	// Allow unique URL or combination of URLs, we recommend both enabled
	setUniqueURLS( false );
	// Sets automatic route extension detection and places the extension in the rc.format variable
	// setExtensionDetection( true );
	// The valid extensions this interceptor will detect
	// setValidExtensions( 'xml,json,jsont,rss,html,htm,pdf' );
	// If enabled, the interceptor will throw a 406 exception that an invalid format was detected or just ignore it
	// setThrowOnInvalidExtension( true );
	

	// Your Application Routes
	addRoute(pattern=":handler/:action?");

	/** Developers can modify the CGI.PATH_INFO value in advance of the SES
		interceptor to do all sorts of manipulations in advance of route
		detection. If provided, this function will be called by the SES
		interceptor instead of referencing the value CGI.PATH_INFO.

		This is a great place to perform custom manipulations to fix systemic
		URL issues your Web site may have or simplify routes for i18n sites.

		@Event The ColdBox RequestContext Object
	**/
	function pathInfoProvider( event ){
		/* Example:
		var URI = CGI.PATH_INFO;
		if (URI eq "api/foo/bar")
		{
			event.setProxyRequest( true );
			return "some/other/value/for/your/routes";
		}
		*/
		return CGI.PATH_INFO;
	}
</cfscript>