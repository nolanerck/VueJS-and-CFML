/**
* Response Test
*/
component extends="testbox.system.BaseSpec"{
	
/*********************************** LIFE CYCLE Methods ***********************************/

	// executes before all suites+specs in the run() method
	function beforeAll(){
	}

	// executes after all suites+specs in the run() method
	function afterAll(){
	}

/*********************************** BDD SUITES ***********************************/

	function run( testResults, testBox ){
		// all your suites go here.
		describe( "Response Object", function(){
			beforeEach(function( currentSpec ){
				response = new root.models.Response();
			});

			it( "can be created", function(){
				expect(	response ).toBeComponent();
			});

			it( "can add messages", function(){
				response.addMessage( "Hello Luis" );
				expect(	response.getMessages() ).toHaveLength( 1 );
			});

			it( "can create data packets", function(){
				var data = { name="Luis", today = now() };
				response.setError( true ).setData( data ).addMessage( "Nothing Important" );
				var results = response.getDataPacket();

				expect( results ).toBeStruct();
				expect(	results.data ).toBe( data );
				expect(	results.error ).toBe( true );
				expect(	results.messages ).toBeArray().toHaveLength( 1 );

				debug( results );
			});

			it( "can add headers", function(){
				response.addHeader( name="test", value="luis" );
				expect(	response.getHeaders() ).toBeArray().toHaveLength( 1 );
			});
		});
	}
	
}