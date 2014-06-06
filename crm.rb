require_relative "contact"
require_relative "rolodex"

class CRM #since all these have similar properties -- to start the program
	attr_accessor :name

	#define class method "run"
	def self.run(name)
		crm = self.new(name) #creates a new instance of CRM
		crm.main_menu
	end

	def initialize(name)
		@name = name #instance variable
		#you can also write self.name = name
		#instead of directly changing variable, you're using writer instead
		#no benefit here, but will be handy in rails
		@rolodex = Rolodex.new #you can now access this anywhere in your CRM class since it's an instance variable
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
		when 1 then add_new_contact #instance method from CRM class
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

	def add_new_contact
	print "Enter First Name: "
  first_name = gets.chomp
  print "Enter Last Name: "
  last_name = gets.chomp
  print "Enter Email Address: "
  email = gets.chomp
  print "Enter a Note: "
  note = gets.chomp
  @rolodex.add_contact(Contact.new(first_name, last_name, email, note)) #contact is a local variable so it doesn't matter what it's called, but we want to be able to put this into a container to hold onto it for later on
  main_menu #because we're in the instance of the class, we don't need to do a .something
	end

end 

CRM.run("Bitmaker Labs CRM")
#you want "run" to be a class method that does the two lines below
#crm = CRM.new("Bitmaker Labs CRM") #instance of the class
#crm.main_menu
