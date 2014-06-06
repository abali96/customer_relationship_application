class Rolodex #make this an empty array to start
	attr_accessor :id, :first_name, :last_name, :email, :note, :contacts

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

	def display_contacts
		@contacts.each { |contact| puts contact }
	end

	def delete_existing_contact
		print "Enter the ID number of the contact you wish to delete:"
		contact_id_to_delete = gets.chomp.to_i
		@contacts.delete_at(contact_id_to_delete-1)
	end
#id method defined in contact.rb Contact class

	def modify_contacts
		# props = ["first_name", "last_name", "email", "note"]
		print "Enter the ID number of the contact you wish to modify:"
		contact_id_to_modify = gets.chomp.to_i
		puts "Pick which attriute you want to modify: "
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Note"
		attribute_to_change = gets.chomp.to_i
		print "Enter a new value: "
		new_value = gets.chomp
		case attribute_to_change
		when 1
			find_contact(contact_id_to_modify).first_name = new_value
		when 2
			find_contact(contact_id_to_modify).last_name = new_value
		when 3
			find_contact(contact_id_to_modify).email = new_value
		when 4
			find_contact(contact_id_to_modify).note = new_value
		end
		#find_contact(contact_id_to_modify).send("#{attribute_to_change}=".to_sym, new_value)
	end


	def find_contact(x)
		@contacts.find { |contact| contact.id == x }
	end


	# def case_attribute
	# 	if @attribute_to_change == 1
	# 		modified_value = @contact.first_name
	# 	elsif @attribute_to_change == 2
	# 		modified_value = @contact.last_name
	# 	elsif attribute_to_change == 3
	# 		modified_value = @contact.email
	# 	elsif @attribute_to_change == 4
	# 		modified_value = @contact.note
	# 	end
	# end
end