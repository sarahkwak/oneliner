class Oneline < ActiveRecord::Base
	belongs_to :user
	validates :user, presence: true
	validates :contents, presence: true, length: { maximum: 255 }

	scope :todays_quote, lambda { |time| where("created_at = ?", time)}

	# scope :todays_oneline, -> { where("created_at_to_date = ?", Date.today) }


	def self.my_oneline(user)
		@onelines ||= Oneline.select { |o| o.user == user && o.secret_admirer_id ==  nil }
	end

	def contains_question?
		contents.include? "?"
	end 

	def created_at_to_date
		created_at.to_date
	end

	def self.todays_oneline
		select { |o| o.created_at.to_date == Date.today } 
	end
end
