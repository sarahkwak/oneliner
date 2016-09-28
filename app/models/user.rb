class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :oneline
	has_many :admirer, class_name: "User",
												foreign_key: "secret_admirer_id"
	belongs_to :secret_admirer, class_name: "User"


	def admirer_list
		admirer
	end
end
