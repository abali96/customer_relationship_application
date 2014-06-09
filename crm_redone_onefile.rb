class CRM

	attr_accessor :name

	def self.run(name)
		crm = CRM.new(name)
		crm.main_menu
	end

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
		end

	def print_menu
		puts "Welcome to #{name} CRM"
		puts "[1] Add contact"
		puts "[2] Modify contact"
		puts "[3] Display all contacts"
		puts "[4] Delete contact"
		puts "[5] Exit program"
		print "Enter a number: "
	end

	def main_menu
		print_menu
		selection = gets.chomp.to_i
		call_option(selection)
	end

	def call_option(selection)
		case selection
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_all_contacts
		when 4 then delete_contact
		when 5 
			puts "Goodbye!"
			return
		else
			puts "Invalid option: "
			main_menu
		end
	end

	def add_contact
		print "First name: "
		first_name = gets.chomp
		print "Last name: "
		last_name = gets.chomp
		print "Email: "
		email = gets.chomp
		print "Note: "
		note = gets.chomp
		contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(contact)
		main_menu
	end

	def display_all_contacts
		@rolodex.display_all_contacts
		main_menu
	end

	def delete_contact
		@rolodex.delete_all_contact
		main_menu
	end

	def modify_contact
		print_modify_option
		@attribute_to_modify = gets.chomp.to_i
		confirmation
		main_menu
	end

	def confirmation
		puts "Are you sure you want to modify that attribute? (Y/N)"
		confirmation = gets.chomp.upcase
		case confirmation
		when "Y" then @rolodex.modify_attribute(@attribute_to_modify)
		when "N" then main_menu
		end
	end

	def print_modify_option
		puts "Enter which attribute you'd like to change: "
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Note"
	end

end

#START OF NEW CLASS ------------------------------
class Contact
	
	attr_accessor :id, :first_name, :last_name, :email, :note

	def initialize(first_name, last_name, email, note)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
		@id = id
	end

	def to_s
		"ID = #{@id}: #{first_name} #{last_name} is reachable at #{email}. Notes: #{note}"
	end

end

#START OF NEW CLASS -----------------------------
class Rolodex
	
	attr_accessor :contact_id, :contact_book

	def initialize
		@contact_id = 1
		@contact_book = []
	end

	def add_contact(contact)
		contact.id = contact_id
		@contact_book << contact
		@contact_id += 1
	end

	def display_all_contacts
		@contact_book.each { |contact| puts contact }
	end

	def delete_contact
		display_all_contacts
		puts "Enter the contact ID of the person you want to delete: "
		id_to_delete = gets.chomp.to_i
		@contact_book.delete_at(id_to_delete-1)
	end

	def modify_attribute(x)
		display_all_contacts
		puts "Which contact would you like to modify?"
		contact_id_to_modify = gets.chomp.to_i
		puts "Enter a new value: "
		new_val = gets.chomp
		case x
		when 1
			find_contact(contact_id_to_modify).first_name = new_val
		when 2
			find_contact(contact_id_to_modify).last_name = new_val
		when 3
			find_contact(contact_id_to_modify).email = new_val
		when 4
			find_contact(contact_id_to_modify).note = new_val
		end
	end

	def find_contact(x)
		@contact_book.find {|contact| contact.id == x}
	end

end

CRM.run("AB")