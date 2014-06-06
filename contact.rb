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
		"ID NUMBER = #{id}" "\n" <<
		"#{first_name} #{last_name} has contact ID #{@id} is reachable at #{email}." <<
		"Here are our notes on him: #{note}."
		"\n"
	end
end
