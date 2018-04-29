/**
*********************************************************************************
* Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
* www.ortussolutions.com
********************************************************************************
*/
component {

	// Module Properties
	this.title 				= "MockDataCFC";
	this.author 			= "Luis Majano";
	this.webURL 			= "https://www.ortussolutions.com";
	this.description 		= "MockData is a simple service to generate fake JSON data";
	this.version			= "2.3.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "MockDataCFC";
	// Model Namespace
	this.modelNamespace		= "MockDataCFC";
	// Auto Map Models Directory
	this.autoMapModels		= false;
	// CF Mapping
	this.cfmapping			= "MockDataCFC";

	/**
	* Configure Module
	*/
	function configure(){

		// SES Routes
		routes = [
			// Module Entry Point
			{ pattern="/", handler="Main", action="index" },
			// Convention Route
			{ pattern="/:handler/:action?" }
		];
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		binder.map( "MockData@MockDataCFC" ).to( "#moduleMapping#.MockData" );
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
	}
	
}