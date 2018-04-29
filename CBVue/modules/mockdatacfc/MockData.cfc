/**
 * Our Mocking Data CFC
 * Please review the readme.md for instructions on usage.
 */
component {

	// So you can skip passing it, if hitting it directly.
	url.method="mock";

	// Defaults used for data, may move to a file later
	fNames = ["Andy","Alice","Amy","Barry","Bob","Charlie","Clarence","Clara","Danny","Delores","Erin","Frank","Gary","Gene","George","Heather","Jacob","Leah","Lisa","Lynn","Nick","Noah","Ray","Roger","Scott","Todd","Luis","Jose","Fernando","Juan","Ricardo","Pablo","Mateo","Lucas","Alexia","Maria","Veronica","Ana","Lucia","Romeo","Esteban","Jorge"];
	
	lNames = ["Anderson","Bearenstein","Boudreaux","Camden","Clapton","Degeneres","Hill","Moneymaker","Padgett","Rogers","Smith","Sharp","Stroz","Zelda","Maggiano","Reyes","Flores","Lopez","Sandoval","Castro","Rodrigues","Elias","Tobias","Lainez","Sanabria","Madeiro","Messi","Pilato","Segovia","Marquez"];
	
	emailDomains = ["gmail.com","aol.com","microsoft.com","apple.com","adobe.com","google.com","test.com","msn.com"];
	
	lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
	
	sentences = [
		"Bacon ipsum dolor amet bacon biltong brisket sirloin kielbasa",
		"hock beef landjaeger boudin alcatra",
		"sausage beef beef ribs pancetta pork chop doner short ribs",
		"brisket alcatra shankle pork chop, turducken picanha",
		"Venison doner leberkas turkey ball tip tongue"
	];
	
	words = listToArray( "Aeroplane,Air,Aircraft Carrier,Airforce,Airport,Album,Alphabet,Apple,Arm,Army,Baby,Baby,Backpack,Balloon,Banana,Bank,Barbecue,Bathroom,Bathtub,Bed,Bed,Bee,Bible,Bible,Bird,Bomb,Book,Boss,Bottle,Bowl,Box,Boy,Brain,Bridge,Butterfly,Button,Cappuccino,Car,Car-race,Carpet,Carrot,Cave,Chair,Chess Board,Chief,Child,Chisel,Chocolates,Church,Church,Circle,Circus,Circus,Clock,Clown,Coffee,Coffee-shop,Comet,Compact Disc,Compass,Computer,Crystal,Cup,Cycle,Data Base,Desk,Diamond,Dress,Drill,Drink,Drum,Dung,Ears,Earth,Egg,Electricity,Elephant,Eraser,Explosive,Eyes,Family,Fan,Feather,Festival,Film,Finger,Fire,Floodlight,Flower,Foot,Fork,Freeway,Fruit,Fungus,Game,Garden,Gas,Gate,Gemstone,Girl,Gloves,God,Grapes,Guitar,Hammer,Hat,Hieroglyph,Highway,Horoscope,Horse,Hose,Ice,Ice-cream,Insect,Jet fighter,Junk,Kaleidoscope,Kitchen,Knife,Leather jacket,Leg,Library,Liquid,Magnet,Man,Map,Maze,Meat,Meteor,Microscope,Milk,Milkshake,Mist,Money,Monster,Mosquito,Mouth,Nail,Navy,Necklace,Needle,Onion,PaintBrush,Pants,Parachute,Passport,Pebble,Pendulum,Pepper,Perfume,Pillow,Plane,Planet,Pocket,Post-office,Potato,Printer,Prison,Pyramid,Radar,Rainbow,Record,Restaurant,Rifle,Ring,Robot,Rock,Rocket,Roof,Room,Rope,Saddle,Salt,Sandpaper,Sandwich,Satellite,School,Ship,Shoes,Shop,Shower,Signature,Skeleton,Slave,Snail,Software,Solid,Space Shuttle,Spectrum,Sphere,Spice,Spiral,Spoon,Sports-car,Spot Light,Square,Staircase,Star,Stomach,Sun,Sunglasses,Surveyor,Swimming Pool,Sword,Table,Tapestry,Teeth,Telescope,Television,Tennis racquet,Thermometer,Tiger,Toilet,Tongue,Torch,Torpedo,Train,Treadmill,Triangle,Tunnel,Typewriter,Umbrella,Vacuum,Vampire,Videotape,Vulture,Water,Weapon,Web,Wheelchair,Window,Woman,Worm,X-ray" );
	
	baconlorem = arrayToList( sentences );
	
	defaults = [ 
		"name",
		"fname",
		"lname",
		"age",
		"all_age",
		"email",
		"ssn",
		"tel",
		"gps",
		"num",
		"date",
		"datetime",
		"uuid",
		"sentence",
		"baconlorem",
		"words" 
	];

	/**
	 * This function is the remote entry point for our service or data calls
	 * The incoming arguments are evaluated for mocking data services.
	 */
	remote function mock() returnformat="json" {

		//cfheader( name="Content-Type", value="text/html" );
		
		// Did they specify how many they want?
		if( !arguments.keyExists( "num" ) ){
			arguments.num = 10;
		}

		// If num is not numeric, then it must be our random number generator
		if( !isNumeric( arguments.num ) && arguments.num.find( ":" ) > 0 ){
			var parts = arguments.num.listToArray( ":" );
			if( !listFindNoCase( "rnd,rand", parts[ 1 ] ) ){
				throw( "Invalid num prefix sent. Must be 'rnd' or 'rand'" );
			}
			// format is rnd:10 which means, from 1 to 10
			if( parts.len() == 2 ){
				arguments.num = randRange( 1, parts[ 2 ] );
			} else {
				arguments.num = randRange( parts[ 2 ], parts[ 3 ] );
			}
		}

		// Determine incoming models from arguments
		var fieldModel = [];
		for( var key in arguments ){
			if( key != "num" ){
				fieldModel.append( { name : key, type : arguments[ key ] } );
			}
		}

		// Generate restuls from field models and incoming numbers
		var result = [];
		for( var i=1; i <= arguments.num; i++ ){
			result.append( generateNewItem( fieldModel, i ) );
		}
		
		// If in Service mode, then add headers
		if( findNoCase( "MockData.cfc", GetBaseTemplatePath() ) ){
			cfheader( name="Content-Type", value="application/json" );
			// CORS for web service calls
			cfheader( name="Access-Control-Allow-Origin", value="*" );
		}

		return result;
	}

	/***************************** PRIVATE ****************************************/
	
	/**
	 * Check if an incoming type exists in our default types
	 * @target The target to check
	 */
	boolean function isDefault( required target ) {
		return defaults.findNoCase( target ) > 0; 
	}

	/**
	 * Generate the fake data according to incoming type
	 * @type The valid incoming fake data type
	 * @index The index location of the fake iteration
	 */
	private function generateFakeData( required type, required index ){
		if( type == "autoincrement" ){
			return arguments.index;
		}
		if( type == "string"){ 
			return "string"
		};
		if( type == "uuid" ){
			return createUUID();
		}
		if( type == "name" ){
			return generateFirstName() & " " & generateLastName();
		}
		if( type == "fname" ){
			return generateFirstName();
		}
		if( type == "lname" ){
			return generateLastName();
		}
		if( type == "age" ){
			return randRange( 18, 75 );
		}
		if( type == "all_age" ){
			return randRange( 1,100 );
		}
		if( type == "email" ) {
			return generateEmail();
		}
		if( type == "ssn" ){
			return generateSSN();
		}
		if( type == "tel" ){
			return generateTelephone();	
		}
		if( type == "date" ){
			return generateDateRange();
		}
		if( type == "datetime" ){
			return generateDateRange( showTime = true );
		}
		if( type.find( "num" ) == 1 ){
			return generateNumber( type );
		}
		if( type.find( "oneof" ) == 1 ){
			return generateOneOf( type );
		}
		if( type.find( "lorem" ) == 1 ){
			return generateLorem( type );
		}
		if( type.find( "baconlorem" ) == 1) {
			return generateLorem( type );
		}
		if( type.find( "sentence" ) == 1 ){
			return generateSentences( type );
		}
		if( type.find( "words" ) == 1 ){
			return generateWords( type );
		}
		return "";
	}

	/**
	 * Generate a new mocked item
	 * @model A struct of name and type of the model to generate
	 * @index The numerical index of the item being generated
	 */
	private struct function generateNewItem( required array model, required index ) {
		var result = {};
		arguments.model.each( function( field ){
			
			// Verify the field struct has a name, else generaate it
			if( !field.keyExists( "name" ) ){
				field.name = "field" & i;
			}
	
			
			// if we are a default, that is our type, otherwise string
			if( ( !field.keyExists( "type" ) || !field.type.len() )
				&& 
				isDefault( field.name ) 
			){
				field.type = field.name;
			}

			// Generate the fake data now.
			result[ field.name ] = generateFakeData( field.type, index );
		} );

		return result;
	}

	/********************************* GENERATORS ********************************/

	private function generateWords( required type ){
		if( type == "words" ){
			return words[ randRange(1, arrayLen( words ) ) ];
		}
		if( type.find(":") > 1 ){
			var parts 	= type.listToArray( ":" );
			var result 	= "";
			var count 	= "";
			if( parts.len() == 2 ){
				count = parts[ 2 ];
			} else {
				count = randRange( parts[ 2 ], parts[ 3 ] );
			}
			for( var i=0; i < count; i++ ){
				result &= words[ randRange( 1, arrayLen( words ) ) ] & " ";
			}
			return result;
		}
	}

	/**
	 * Generate sentences
	 */
	private function generateSentences( required type ){
		if( arguments.type == "sentence" ){
			return sentences[ randRange( 1, arrayLen( sentences ) ) ];
		}
		if( arguments.type.find( ":" ) > 1 ){
			var parts 	= arguments.type.listToArray( ":" );
			var result 	= "";
			var count 	= "";
			if( parts.len() == 2 ) {
				count = parts[2];
			} else {
				count = randRange( parts[ 2 ], parts[ 3 ] );
			}
			for( var i=0; i < count; i++ ){
				result &= sentences[ randRange( 1, arrayLen( sentences ) ) ] & "\n\n";
			}
			return result;
		}
	}

	/**
	 * Generate Lorem
	 * @type The target type
	 */
	private function generateLorem( required type ){
		if( arguments.type == "lorem" ){
			return lorem;
		}
		if( arguments.type == "baconlorem" ){
			return baconlorem;
		}

		// Restricting by convention
		if( type.find( ":" ) > 1 ){
			var parts 		= type.listToArray( ":" );
			var result 		= "";
			var count 		= "";
			var targetLorem = ( arguments.type == "lorem" ? variables.lorem : variables.baconlorem );
			
			if( parts.len() == 2 ){
				count = parts[ 2 ];
			} else{
				count = randRange( parts[ 2 ], parts[ 3 ] );
			}
			for( var i=0; i < count; i++ ){
				result &= targetLorem & "\n\n";
			}
			return result;
		}
	}

	/**
	 * generate one of functions
	 */
	private function generateOneOf( required type ){
		// Support oneof:male:female, ie, pick a random one
		var items = arguments.type.listToArray( ":" );
		items.deleteAt( 1 );
		return items[ randRange( 1, items.len() ) ];
	}

	/**
	 * Generate a random number
	 */
	private function generateNumber( required type ){
		// Support num, num:10, num:1:10
		if( arguments.type == "num" ){
			return randRange( 1, 10 );
		}
		if( arguments.type.find( ":" ) > 1 ){
			var parts = arguments.type.listToArray( ":" );
			if( parts.len() == 2 ){
				return randRange( 1, parts[ 2 ] );
			}
			return randRange( parts[ 2 ], parts[ 3 ] );
		}
	}

	/**
	 * Generate telephone
	 */
	private function generateTelephone(){
		return "(" & randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & ") " &
			    randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & "-" & 
			    randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 );
	}

	/**
	 * Generate SSN
	 */
	private function generateSSN(){
		return 	randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & "-" &
		    	randRange( 1, 9 ) & randRange( 1, 9 ) & "-" & 
		    	randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 ) & randRange( 1, 9 );
	}

	/**
	 * Generate an email
	 */
	private function generateEmail(){
		var fname 		= generateFirstName().toLowerCase();
		var lname 		= generateLastName().toLowerCase();
		var emailPrefix = fname.charAt( 1 ) & lname;
		return emailPrefix & "@" & emailDomains[ randRange( 1, emailDomains.len() ) ];
	}

	/**
	 * Generate a first name
	 */
	private function generateFirstName() {
		return fNames[ randRange( 1, fNames.len() ) ];
	}

	/**
	 * Generate a last name
	 * @return {[type]} [description]
	 */
	private function generateLastName() {
		return lNames[ randRange( 1, lNames.len() ) ];
	}

	/**
	 * Genereate a random data range
	 * @from 		The date time start
	 * @to 			The end date else defaults to today
	 * @showTime 	Show time in the data
	 * @dateFormat  The date formatting to use
	 * @timeFormat 	The time formmating to use
	 */
	private function generateDateRange( 
		date from="#createDateTime( '2010', '01', '01', '0', '0', '0' )#",
		date to="#now()#",
		showTime = false,
		dateFormat = "medium",
		timeFormat = "medium"
	){
		var timeDifference 	= dateDiff( "s", arguments.from, arguments.to );
		var timeIncrement 	= createTimeSpan( 0, 0, 0, randRange( 0, timeDifference ) ); 
		var result 			= arguments.from + timeIncrement;
		
		if( arguments.showTime ){
			return dateFormat( result, arguments.dateFormat ) & " " & timeFormat( result, arguments.timeFormat );
		} else {
			return dateFormat( result, arguments.dateFormat );
		}
	}

}