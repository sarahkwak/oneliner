class Addfakeusers < ActiveRecord::Migration
  def change
  	70.times do 
  		User.create(
  			email: Faker::Internet.email,
  			password: 'heff3030'
  		)
  	end
  end
end
