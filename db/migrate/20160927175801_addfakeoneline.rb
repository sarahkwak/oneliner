class Addfakeoneline < ActiveRecord::Migration
	add_reference :onelines, :user
  def change
  	1000.times do 
  		Oneline.create(
  			user_id: rand(70),
  			contents: (Faker::Lorem.sentence)[0..222]
  		)
  	end
  end
end
