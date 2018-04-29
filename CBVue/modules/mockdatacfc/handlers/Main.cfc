/**
* RESTFul service controller for MockData CFC
*/
component extends="coldbox.system.EventHandler"{
	
	// DI
	property name="mockData" inject="MockData@MockDataCFC";

	/**
	* Index service
	*/
	any function index( event, rc, prc ){
		var inData 		= duplicate( rc );
		// reserved incoming vars
		var reserved 	= listToArray( "event,namespaceRouting,namespace" );
		// Remove from incoming data
		for( var key in reserved ){
			structDelete( inData, key );
		}
		var results = mockData.mock( argumentCollection=inData );

		// CORS
		cfheader( name="Access-Control-Allow-Origin", value="*" );
		// Rendering
		event.renderData(
			type = "json",
			data = results
		);
	}
	
}