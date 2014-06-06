class Rolodex #make this an empty array to start
	attr_accessor :id, :first_name, :last_name, :email, :note

	def initialize
		@contact_id = 1000 #so that you can associate each contact with a unique number like in databases 
		@contacts = []
		#your CRM should care about setting up a new rolodex right away
	end

	def add_contact(contact)
		@contacts << contact
		contact.id = @contact_id
		@contact_id += 1 #increment it so that the next contact has a different, unique idea
	end
#id method defined in contact.rb Contact class

end