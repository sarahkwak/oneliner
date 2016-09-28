class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :onelines
	has_many :admirer, class_name: "User",
												foreign_key: "secret_admirer_id"
	belongs_to :secret_admirer, class_name: "User"

	def oneline_checker
		onelines.todays_oneline.any?	
	end

	def oneline_to_admirer
		onelines.todays_oneline.select{ |o| !o.admirer_id.nil? }.any?
	end

	def received_form_admirer
		Oneline.todays_oneline.select{ |o| !o.secret_admirer_id.nil? }.any?
	end
end
