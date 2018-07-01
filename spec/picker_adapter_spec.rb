require 'rspec'
require 'picker_adapter'
require 'csv'

describe PickerAdapter do

	describe '.input_prepare' do

		file = CSV.generate do |csv|
			csv << ["john"]
			csv << ["jane"]
			csv << ["jack"]
		end

		it 'converts a CSV of entries into an Array of entries' do
			converted_data = PickerAdapter.input_prepare(file)
			expect(converted_data).to be_an(Array) 
			expect(converted_data.length).to eql(3)
		end

	end

	describe '.output_prepare' do

		let (:groups) {[
			["john", "jack"],
			["jane"]
		]}
		let (:result) {[["john","jack"],["jane"]]}

		it 'converts an Array of groups to a CSV' do
			PickerAdapter.out_prepare(groups)
			CSV.foreach("results.csv") do |row|
				expect(result.include?(row)).to be(true) 
			end
		end

		it 'returns the name of output CSV' do
			expect(PickerAdapter.output_prepare(groups)).to eql("results.csv")		
		end
	end

end