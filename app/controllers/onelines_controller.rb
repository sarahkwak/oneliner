class OnelinesController < ApplicationController
	before_action :authenticate_user!
	
	def index
	end

	def create
		oneline = Oneline.create(contents: params[:oneline][:contents], user: current_user)
		if params[:oneline][:admirer_id]
			oneline.update(admirer_id: params[:oneline][:admirer_id])
		end
		redirect_to :back
	end

	def new
		@oneline = Oneline.new
	end

	def show
	end

	def update
		this_oneline.update!(contents: params[:oneline][:contents])
		redirect_to '/'
	end

	def destroy
		this_oneline.destroy!
		respond_to do |format|
			format.html { redirect_to "/"}
			format.js
		end
	end

	helper_method def my_onelines
	@onelines ||= Oneline.select { |o| o.user == current_user }.reverse
	# why I can't call @onelines? This gives nil
	end 

	helper_method def this_oneline
	@oneline ||= Oneline.find(params[:id])|| Oneline.find(params[:oneline][:id])
	end

# why strong_params doesn't work? 
# why hidden field doesn't work?
end
