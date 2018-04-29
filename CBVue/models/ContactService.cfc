/**
* I manage contacts
*/
component accessors="true" singleton threadsafe{
	
	/**
	* Contacts DB
	*/
    property name="contacts";
    /**
    * The last ID tracker
    */
    property name="lastID";

    // DI
    property name="mockdata" inject="MockData@MockDataCFC";
   
    /**
     * Constructor
     */
	ContactService function init(){

		variables.contacts = {
			"1" : { 
				"id"        : 1, 
				"firstName" : "Scott", 
				"lastName"  : "Steinbeck", 
				"phone"     : "661-555-5555",
				"email"     : "scottsteinbeck@gmail.com" 
			},
			"2" : { 
				"id"        :2, 
				"firstName" : "Scott", 
				"lastName"  : "Coldwell", 
				"phone"     :"661-555-5555",
				"email"     :"scott@gmail.com" 
			},
			"3" : { 
				"id"        :3, 
				"firstName" : "Jon", 
				"lastName"  : "Clausen", 
				"phone"     :"661-555-5555",
				"email"     :"jon@gmail.com" 
			},
			"4" : { 
				"id"        :4, 
				"firstName" : "Eric", 
				"lastName"  : "Peterson", 
				"phone"     :"661-555-5555",
				"email"     :"eric@gmail.com" 
			},
			"5" : { 
				"id"        :5, 
				"firstName" : "Andrew", 
				"lastName"  : "Dixon", 
				"phone"     :"661-555-5555",
				"email"     :"andrew@gmail.com" 
			},
			"6" : { 
				"id"        :6, 
				"firstName" : "Gavin", 
				"lastName"  : "Pickin", 
				"phone"     :"661-555-5555",
				"email"     :"scottsteinbeck@gmail.com" 
			},
			"7" : { 
				"id"        :7, 
				"firstName" : "Brad", 
				"lastName"  : "Wood", 
				"phone"     :"661-555-5555",
				"email"     :"brad@gmail.com" 
			},
			"8" : { 
				"id"        : 8, 
				"firstName" :  "Luis", 
				"lastName"  :  "Majano", 
				"phone"     : "661-555-5555",
				"email"     : "luis@gmail.com" 
			},
			"9" : { 
				"id"        : 9, 
				"firstName" :  "Jorge", 
				"lastName"  :  "Reyes", 
				"phone"     : "661-555-5555",
				"email"     : "jorge@gmail.com"
			 }
		};

		variables.lastID = 10;
		
		return this;
	}

	function onDIComplete(){
		// Prepare mock data
		var aContacts = mockdata.mock(
			num 		= 10,
			id 			= "uuid",
			createdDate = "datetime",
			firstName 	= "fname",
			lastName 	= "lname",
			email 		= "email",
			phone 		= "tel",
			age 		= "age",
			notes 		= "baconlorem"
		);

		// Turn into struct for ease of use.
		for( var x=1; x lte arrayLen( aContacts ); x++ ){
			variables.contacts[ x ] = aContacts[ x ];
			variables.contacts[ x ].id = x;
		}
	}
	
	/**
	* Get all contacts
	*/
	struct function getAll(){
		return variables.contacts;
	}

	/**
	 * Get a single contact
	 */
	 struct function get( required id ){
	 	if( !structKeyExists( variables.contacts, arguments.id ) ){
	 		return {};
	 	}
	 	return variables.contacts[ arguments.id ];
	 }


	/**
	* save and return all contacts
	* @contactID The id to save/update
	* @data The data record
	*/
	struct function save( required contactID, required data ){
		// insert, move lastID
		if( arguments.contactID == 0 ){
			arguments.contactID = variables.lastID;
			arguments.data.id 	= variables.lastID;
			variables.lastID++;
		} 

		// Store data
		variables.contacts[ arguments.contactID ] = arguments.data;
		
		return variables.contacts;
	}

	/**
	* Remove a contact
	* @contactID The incoming ID
	*/
	struct function remove( required contactID ){
		structDelete( variables.contacts, arguments.contactID );
		return variables.contacts;
	}

}