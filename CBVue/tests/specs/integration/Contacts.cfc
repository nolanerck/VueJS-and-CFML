/**
* My BDD Test
*/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/root"{
	
/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
		super.beforeAll();
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
		super.afterAll();
	}

/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){
		feature( "Contacts REST API", function(){

			beforeEach(function( currentSpec ){
				super.setup();
			});

			story( "I want to get a single contact", function(){
				given( "a valid contact ID", function(){
					then( "then I should get a contact representation", function(){
						getRequestContext().setValue( "id", 2 );
						var e 			= execute( event="contacts.show", renderResults = true );
						var response 	= getRequestContext().getPrivateValue( "response" );
						expect( e.getRenderedContent() ).toBeJSON();
						//debug( e.getRenderedContent() );
						expect(	response.getError() ).toBeFalse();
					});
				});
				given( "an invalid contact ID", function(){
					then( "I should get a 404 error message", function(){
						getRequestContext().setValue( "id", createUUID() );
						var e 			= execute( event="contacts.show", renderResults = true );
						var response 	= getRequestContext().getPrivateValue( "response" );
						expect( e.getRenderedContent() ).toBeJSON();
						expect(	response.getError() ).toBeTrue();
						expect(	response.getStatusCode() ).toBe( 404 );
					});
				});
			});

			scenario( "User requests all contacts", function(){
				given( "A call to the /contacts route", function(){
					then( "I should get all contacts in the system", function(){
						var e 			= execute( event="contacts.index", renderResults = true );
						var response 	= getRequestContext().getPrivateValue( "response" );
						debug( e.getRenderedContent() );
						expect( e.getRenderedContent() ).toBeJSON();
						expect(	response.getError() ).toBeFalse( "Error in call" );
						expect(	response.getStatusCode() ).toBe( 200 );
						expect(	response.getData() ).toHaveDeepKey( "firstname" );
					});
				});
			});

			story( "User can save a new contact", function(){
				given( "valid contact credentials", function(){
					then( "I should create a new contact in the system", function(){
						var body = serializeJSON( {
							id = 12,
							firstName = "integration",
							lastName = "test",
							phone = "",
							email = ""
						} );

						prepareMock( getRequestContext() )
							.$( "getHTTPMethod", "POST" )
							.$( "getHTTPContent", body );

						var e = execute( event="contacts.create", renderResults = true );
						expect( e.getRenderedContent() ).toBeJSON()
							.toInclude( "integration" );
					});
				});
				given( "invalid contact data", function(){
					then( "I should get an error message", function(){
						var body = {
							id = 12,
							firstName = "",
							lastName = "",
							phone = "",
							email = ""
						};
						
						prepareMock( getRequestContext() )
							.$( "getHTTPMethod", "POST" )
							.$( "getHTTPContent", body );

						var e 			= execute( event="contacts.create", renderResults = true );
						var response 	= getRequestContext().getPrivateValue( "response" );
						
						expect( e.getRenderedContent() ).toBeJSON();
						debug( response );
						expect(	response.getError() ).toBeTrue();
						expect(	response.getStatusCode() ).toBe( 400 );
					});
				});
			});

			story( "User can remove a contact", function(){
				given( "a valid contact id", function(){
					then( "the contact will be removed", function(){
						getRequestContext().setValue( "id", 1 );
						
						prepareMock( getRequestContext() )
							.$( "getHTTPMethod", "DELETE" )

						var e = execute( event="contacts.delete", renderResults = true );
						var contacts = e.getPrivateValue( "response" ).getData();
						expect(	contacts ).notToHaveKey( "1" );
					});
				});
			});
		});
	}
	
}