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
		oneline.select{ |o| o.created_at.to_date == Date.today }.any?	
	end

	
end
