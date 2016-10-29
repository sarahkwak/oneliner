class User < ActiveRecord::Base

  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :onelines
	has_many :admirer, class_name: "User",
												foreign_key: "secret_admirer_id"
	belongs_to :secret_admirer, class_name: "User"

	def oneline_checker
		Oneline.todays_oneline.select { |o| o.user_id == id }.any?
	end

	def oneline_to_admirer
		Oneline.todays_oneline.select{ |o| o.user_id == id && o.secret_admirer_id == secret_admirer.id }
	end

	def received_from_admirer
		Oneline.todays_oneline.select{ |o| o.admirer_id == id }
	end

	def self.has_multiple_admirers
		User.select { |u| u.admirer.count > 1 }
	end

	def who_admires_this_person
		User.select { |u| u.secret_admirer_id == id }
	end

end
