new Vue( {
		
		// Where the app will be instantiated on the page
		el : '#app',

		// Variables that you want it to have access to or start out with
		data : {
			contactItem : {
				id 			: 0,
				firstName 	: '',
				lastName 	: '',
				phone 		: '',
				email 		: ''
		  	},
		  	contacts : [],
		  	contactFilter : "",
		},

		// Computed Properties
		computed : {
			isContactsLoaded : function(){
				console.log( this.$get( "contacts" ).length );
				return this.contacts.length ? true : false;
			}
		},

		// When this module is ready run this
		ready : function(){
			this.loadContacts();
		},

		// All the methods you want the view to have access to, basically an object of functions
		methods: {
			deleteContact : function( contact ){
				if( confirm( "Really delete contact?" ) ){
					var _this = this;
					this.$http.delete( '/contacts/' + contact.id )
						.then( function( response ){
							_this.$set('contacts', response.body.data );
						} );
				}
			},

			loadContacts : function(){
				var _this = this;
				this.$http.get( "/contacts" )
					.then( function( response ){
						_this.$set( 'contacts', response.body.data );
					} );
			},

			saveContact : function(){
				var _this = this;
				this.$http.post( '/contacts', _this.contactItem )
					.then( function( response ){
						_this.resetContact();
						return _this.$set( 'contacts', response.body.data );
				});
			},

			loadContact : function( contact ){
				var _this = this;
				this.contactItem = contact;
			},

			resetContact : function(){
				this.contactItem = { id : 0,	firstName : '',	lastName : '',	phone : '',	email : '' };
			}
		}
	} );
//# sourceMappingURL=App.js.map
