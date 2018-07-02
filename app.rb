require_relative 'lib/picker'
require 'csv'

def input_prepare(filename)
	to_input = []
	CSV.foreach(filename, { headers: true, skip_blanks: true}) do |row|
		if row.to_s.include? ","
			add_to_row = row.to_s.split(/,/)
			add_to_row.each { |entry| to_input << entry.chomp }
		else to_input << row.to_s.chomp	
		end
	end
	to_input
end

def output_prepare(output)
	puts "*********RESULTS"
	print output
	sample = output[0]
	headers = []
	sample.length.times do |i|
		headers << "entry_#{i + 1}"
	end
	CSV.open("results.csv", "wb") do |csv|
		csv << headers
		output.each do |group|
			csv << group
		end
	end
end

# receive filename and number of entries per group from user input
puts "filename containing names to group?"
filename = gets.chomp
puts "how many entries per group?"
number_per_group = gets.chomp.to_i

# prepare data for picker.rb 
input = input_prepare(filename)
# initialize Picker class and dump output to a new CSV file called results.csv
output_prepare(Picker.new(input, number_per_group).do_the_thing())
puts "done! created results.csv"
regenerate_output = "y"
while regenerate_output == "y"
	puts ""
	puts "would you like to regenerate the groups? y/n"
	regenerate_output = gets.chomp
	output_prepare(Picker.new(input, number_per_group).do_the_thing()) if regenerate_output == "y"
end


