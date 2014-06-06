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