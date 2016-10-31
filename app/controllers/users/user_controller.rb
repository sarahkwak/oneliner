class UserController < ApplicationController
	
	def admirer
		@user = User.new(params[:user])
		@user.save(validate: false)
		redirect_to '/'
	end

end