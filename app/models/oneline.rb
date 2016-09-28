class Oneline < ActiveRecord::Base
	belongs_to :user
	validates :user, presence: true
	validates :contents, presence: true, length: { maximum: 255 }

	scope :todays_quote, lambda { |time| where("created_at = ?", time)}

	def self.my_oneline(user)
		@onelines ||= Oneline.select { |o| o.user == user }
	end

	def contains_questions
		contents.include? "?"
	end 
end
