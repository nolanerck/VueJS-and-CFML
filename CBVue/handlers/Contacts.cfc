/**
* My RESTFul Event Handler
*/
component extends="BaseHandler"{
	
	// DI
	property name="contactService" inject="ContactService";

	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}

	/**
	* List All contacts
	*/
	any function index( event, rc, prc ){
		prc.response.setData( contactService.getAll() );
	}

	/**
	* Show a contact
	*/
	any function show( event, rc, prc ){
		event.paramValue( "id", "" );
		var oContact = contactService.get( rc.id );

		if( structIsEmpty( oContact ) ){
			prc.response.setStatusCode( 404 )
				.setError( true )
				.addMessage( "The contact you requested does not exist" );
		}

		prc.response.setData( oContact );
	}
	
	/**
	* Create a new contact
	*/
	any function create( event, rc, prc ){
		var requestBody = event.getHTTPContent( json=true );

		var vRules = {
			firstName 	= { required = true },
			lastname 	= { required = true },
			email 		= { required = true, type = "email" }
		};
		var vResults = validateModel( target=requestBody, constraints=vRules );
		if( vResults.hasErrors() ){
			prc.response.setError( true )
				.setStatusCode( 400 )
				.setStatusText( "Invalid Parameters Sent" )
				.addMessage( vResults.getAllErrors() );
			return;
		}

		var sContacts 	= contactService.save( requestBody.id, requestBody );
		prc.response.setData( sContacts );
	}

	/**
	* Delete An Existing Contact
	*/
	any function delete( event, rc, prc ){
		event.paramValue( "id", "" );
		var sContacts = contactService.remove( rc.id );
		prc.response.setData( sContacts );
	}
	
}