require 'faker'
require 'csv'

def generate_file(dup = [*args])
	arbitrary_num = Random.new.rand(1..5)
	headers = "name"

	CSV.open("test.csv", "wb") do |csv|
		
		csv << [headers]
		20.times do |i| 
			sample_name = Faker::Name.name
			working_row = [sample_name]
			working_row << sample_name if dup
			csv << working_row
		end

	end
end

#optional case to test deduping entries
case ARGV[0]
when "dup"
	generate_file(dup=true)
else 
	generate_file(nil)
end
