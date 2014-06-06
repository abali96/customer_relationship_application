class Rolodex #make this an empty array to start
	attr_accessor :id, :first_name, :last_name, :email, :note

	def initialize
		@contact_id = 1 #so that you can associate each contact with a unique number like in databases 
		@contacts = []
		#your CRM should care about setting up a new rolodex right away
	end

	def add_contact(contact)
		contact.id = @contact_id
		@contacts << contact
		@contact_id += 1 #increment it so that the next contact has a different, unique idea
	end

	def modify_attribute
		print "Enter a new value for #{@attribute}:"
		modified_attribute = gets.chomp
		 if @attribute == 1 
		 	modified_attribute = @first_name 
		 	print "#{first_name}"
		 elsif @attribute ==2
		 	modified_attribute = @last_name
		 # when 2 then @last_name
		 # when 3 then @email
		 # when 4 then @note
		 end
		end

	def display_contacts
		@contacts.each { |contact| puts contact }
	end

	def delete_existing_contact
		print "Enter the ID number of the contact you wish to delete:"
		contact_id_to_delete = gets.chomp.to_i
		@contacts.delete_at(contact_id_to_delete-1)
	end
#id method defined in contact.rb Contact class

end