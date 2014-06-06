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
	print_main_menu
  selection = get.chomp.to_i
  call_option(selection)
end

def call_option(selection)
	add_new_contact if selection == 1
	modify_existing_contact if selection == 2
	delete_existing_contact if selection == 3
	display_contacts if selection == 4
	display_attribute if selection == 5
	exit_crm if selection == 6
end 