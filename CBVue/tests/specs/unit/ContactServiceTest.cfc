/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseModelTest" model="root.models.ContactService"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		// setup the model
		super.setup();		
		
		// init the model object
		model.init();
	}

	function afterAll(){
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "Contact Service", function(){
			
			it( "should get all contacts", function(){
                var results = model.getAll();
                expect(	results.len() ).toBeGT( 5 );
			});

			it( "should get a single contact", function(){
				var results = model.get( 2 );
				expect(	results.lastname ).toBe( "Coldwell" );
			});

			it( "should save a new contact", function(){
				var total = model.getContacts().len();
                var results = model.save( 0, { firstName="test", lastName="test", phone="", email="" } );
                expect(	results.len() ).toBeGT( total );
			});

			it( "should remove a contact", function(){
                var contacts = model.getContacts();
                var results = model.remove( contacts[ 1 ].id );

                arrayEach( contacts, function( item ){
                	if( item.id == 1 ){
                		fail( "Failed to remove contact" );
                	}
                } );
			});


		});

	}

}
