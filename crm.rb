class CRM #since all these have similar properties -- to start the program
	attr_accessor :name
	def initialize(name)
		@name = name #instance variable
		#you can also write self.name = name
		#instead of directly changing variable, you're using writer instead
		#no benefit here, but will be handy in rails
	end

	def print_main_menu
		puts "[1] Add a new contract"
		puts "[2] Modify and existing contact"
		puts "[3] Delete a contact"
		puts "[4] Display all the contacts"
	  puts "[5] Display an attribute"
	  puts "[6] Exit"
	  puts "Enter a number: "
	end

	def main_menu
		puts "Welcome to #{name}" #you can use @name, but you have attr_accessor meaning you have a setter method already there
		print_main_menu
	  selection = gets.chomp.to_i
	  call_option(selection)
	end

	def call_option(selection)
		case selection
		when 1 then add_new_contact
		when 2 then modify_existing_contact
		when 3 then delete_existing_contact
		when 4 then display_contacts
		when 5 then display_attribute
		when 6 then 
			puts "Goodbye!"
			return
		else
			puts "Invalid option. Please try again."
			main_menu
		end 
	end
end 

crm = CRM.new("Bitmaker Labs CRM") #create an instance of CRM
crm.main_menu