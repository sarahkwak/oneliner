require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe 'oneline' do 
	before(:each) do
		@user1 = User.create(email: 'email@one.com', first_name: 'sarah', last_name: 'kwak', password: 'pass3030') 
		@oneline = Oneline.create(contents: 'my first oneline', user: @user1) 
		@twoline = Oneline.create(contents: 'my second oneline?', user: @user1) 
	end 
	it 'fines oneline that belongs to a user' do 
		expect(Oneline.count).to eq 2
		expect(Oneline.last.contents).to eq 'my second oneline?'
		expect(User.count).to eq 1
		p	Oneline.first.user.first_name
		expect(Oneline.my_oneline(@user1).count).to eq 2
	end 
	it 'fines online that is a question' do 
		expect(@oneline.contains_question?).to eq false
		expect(@twoline.contains_question?).to eq true
	end 
	it 'returns only todays_oneline' do 
		expect(Oneline.todays_oneline.count).to eq 2
	end
end