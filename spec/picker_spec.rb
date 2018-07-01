require 'rspec'
require 'picker'

describe Picker do

	context 'initializes' do
		let(:picker) { Picker.new(['john', 'jane'], 2) }

		it ' with @input and @group_size' do
			expect(picker.input).to be_an(Array)
			expect(picker.group_size). to be_an(Integer)
		end
	end

	describe '.do_the_thing' do

		before(:all) do
			@picker = Picker.new(['john', 'jane', 'jack', 'jack'], 2)
			@picker.do_the_thing()
		end
		
		it 'dedupes the list of entries' do
			expect(@picker.output.flatten.length).to eql(3)
			expect(@picker.output.select{ |name| name == 'jack' }.length).to eql(1)
		end
		
		it 'creates and array of arrays' do
			expect(@picker.output).to be_an(Array)
			@picker.output.each { |group| expect(group).to be_an(Array)}
		end

		it 'creates groups according to a specified number of entries' do
			expect(@picker.output[0].length).to eql(2)
		end

		it 'returns one group with less than the requested number of entries if the total number of entries does not divide evenly by the requested number' do
			expect(@picker.output.last).to eql(1)
		end

		it 'creates groups that are random' do
			#generate output results several different times, 
			#for each time you run it increase a number if the first entry is a certain name, 
			#expect the final number to be less than the total number of attempts
			jack_count = 0
			100.times do
				@picker.do_the_thing()
				jack_count += 1 if @picker.output.first.first == 'jack'
			end
			
			expect(jack_count).to be < 100
		end


		it 'returns all groups' do
			expect(@picker.output.length).to be(2)
		end

	end

end