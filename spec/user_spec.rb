require 'rails_helper'
require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

describe 'users' do 
	before(:each) do 
		@secret_admirer = User.create(email: 'chock@chick.com', first_name: 'chiwawa', last_name: 'theDog', password: 'smalldog3030')
		@sarah = User.create(email: 'semail@one.com', first_name: 'ssarah', last_name: 'skwak', password: 'pass3030', secret_admirer: @secret_admirer) 
		@admirer1 = User.create(email: 'bri@thedogs.com', first_name: 'Bri',last_name: 'Kwak', password: 'brian3030', secret_admirer: @sarah)
		@admirer2 = User.create(email: 'ryan@hub.com', first_name: 'Ryan',last_name: 'Heff',password: 'heff3030', secret_admirer: @sarah)
		@oneline = Oneline.create(contents: 'First oneline', user: @sarah) 
		@twoline = Oneline.create(contents: 'I love you', user: @sarah, secret_admirer_id: @secret_admirer.id)
		@threeline = Oneline.create(contents: 'You must love me', user: @admirer1, admirer_id: @sarah.id)
		@fourline = Oneline.create(contents: 'I do not know if I love you any more', user: @admirer2, admirer_id: @sarah.id)
	end
	it 'returns true if there is any users oneline' do 
		p expect(Oneline.count).to eq 4
		# p Oneline.my_oneline(@sarah)
		# expect(Oneline.my_oneline(@sarah).count).to eq 1
		expect(@sarah.oneline_checker).to eq true
	end

	it 'returns true if there is oneline from admirer' do 
		expect(@sarah.secret_admirer).to eq @secret_admirer
		expect(@sarah.admirer.count).to eq 2
		expect(@sarah.oneline_to_admirer).to eq true
		expect(@sarah.received_form_admirer).to eq true
	end

	it 'returns users that has more than 1 admirer' do 
		expect(User.has_multiple_admirers).to include @sarah
	end 

	it 'returns who admires user' do 
		expect(@sarah.who_admires_this_person).to include @admirer1, @admirer2
	end 
end