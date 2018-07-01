class Picker
	attr_reader :input, :group_size
	attr_accessor :output

	def initialize(input, group_size)
		@input = input
		@group_size = group_size
	end

	def do_the_thing()
		deduped = dedupe(@input)
	end

	def dedupe(source_data)
		working_data = []
		source_data.each do |item|
			working_data << item if !working_data.include?(item)
		end
		return working_data
	end
end