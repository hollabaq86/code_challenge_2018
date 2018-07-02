class Picker
	attr_reader :input, :group_size
	attr_accessor :output

	def initialize(input, group_size)
		@input = input
		@group_size = group_size
	end

	def do_the_thing()
		@output = []
		working_data = randomize(@input.uniq)
		while working_data.length > @group_size
			puts
			@output << working_data.shift(@group_size)
		end
		if working_data.length <= @group_size
			@output << working_data
		end
		return @output
	end

	private

	def randomize(deduped_data)
		kinda_random = Random.new.rand(5..15)
		kinda_random.times do 
			deduped_data.shuffle!
		end
		return deduped_data
	end
end