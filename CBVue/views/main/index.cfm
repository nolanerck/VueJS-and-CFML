<div id="app" class="container">
	<div class="row">
		
		<div class="col-sm-4">
			<div class="panel panel-default">

			  	<div class="panel-heading">
			   		<strong>Add/Edit Contact</strong>
			  	</div>
			  	
			  	<div class="panel-body">
			  		<form id="contactForm" v-on:submit.prevent="saveContact">
						<div class="form-group">
							<input v-model="contactItem.firstName" class="form-control" value="" placeholder="First Name" required>
						</div>

						<div class="form-group">
							<input v-model="contactItem.lastName" class="form-control" value="" placeholder="Last Name" required>
						</div>

						<div class="form-group">
							<input v-model="contactItem.phone" 	class="form-control" value="" placeholder="Phone">
						</div>

						<div class="form-group">
							<input type="email" v-model="contactItem.email" class="form-control" value="" placeholder="Email" required="required">
						</div>
						
						<div class="form-group">
							<button class="btn btn-default"
									type="reset" 
									@click="resetContact()"
							>Reset</button>
							<button class="btn btn-primary"  
								type="submit"
							>Submit</button>
						</div>
					</form>
			    </div>

			</div>
		</div>

		<div class="col-sm-8">
			<input 	type="text"
					class="form-control"
					placeholder="filter..."
					value=""
					v-model="contactFilter"
			>
			<table class="table table-hover table-striped" v-cloak>
			  <thead>
			    <tr>
			      <th>First Name</th>
			      <th>Last Name</th>
			      <th>Phone</th>
			      <th>Email</th>
			      <th></th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr v-for="contact in contacts | filterBy contactFilter in 'firstName' 'lastName' 'email' | orderBy 'lastName'">
			      <td>{{ contact.firstName }}</td>
			      <td>{{ contact.lastName }}</td>
			      <td>{{ contact.phone }}</td>
			      <td>{{ contact.email }}</td>
			      <td>
			      	<div class="btn-group" role="group" aria-label="...">
			      		<button @click="loadContact( contact )"  
			      				type="button" 
			      				class="btn btn-primary"
			      		><i class="fa fa-edit"></i></button>
			      		<button @click="deleteContact( contact )"  
			      				type="button" 
			      				class="btn btn-danger"
			      		><i class="fa fa-trash"></i></button>
			      	</div>
			      </td>
			    </tr>
			  </tbody>
			</table>

			<div class="text-center" v-show="contacts.length == 0">
				<i class="fa fa-spinner fa-spin fa-4x"></i>
			</div>
		</div>

	</div>

</div>
