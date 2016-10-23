require 'rails_helper'

describe 'oneline' do 
	before(:each) do
		@user1 = User.create(email: 'email@one.com', first_name: 'sarah', last_name: 'kwak') 
		@oneline = Oneline.create(contents: 'one is good', user: @user1) 
		@twoline = Oneline.create(contents: 'one is good?', user: @user1) 
	end 
	# it 'cannot be oneline without user' do 
	# 	expect(Oneline.create(contents: "hello")).to_change (Oneline.count).by 0
	# end 
	it 'fines oneline that belongs to a user' do 
		expect(Oneline.count).to eq 2
		expect(Oneline.last.contents).to eq 'one is good?'
		p Oneline.last
		expect(Oneline.my_oneline(@user1).count).to eq 0
	end 
	# it 'fines online that is a question' do 
	# 	expect(@oneline.contains_question?).to eq false
	# 	expect(@twoline.contains_question?).to eq true
	# end 
	# it 'returns only todays_oneline' do 
	# 	expect(@user1.onelines.todays_oneline.count).to eq 2
	# end
end