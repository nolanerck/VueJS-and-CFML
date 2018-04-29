/**
* My RESTFul Event Handler
*/
component extends="BaseHandler"{
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";		

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};
	
	/**
	* Index
	*/
	any function index( event, rc, prc ){

		var aryCustomers = [ "Martin Gore", "David Gahan", "Alan Wilder", "Andy Fletcher" ];

		prc.response.setData( aryCustomers );
	}
	
}