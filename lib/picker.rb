class Picker
	attr_reader :input, :group_size

	def initialize(input, group_size)
		@input = input
		@group_size = group_size
	end
end