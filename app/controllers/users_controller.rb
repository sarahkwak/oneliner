class UsersController < ApplicationController
  def admirer
		@user = User.new(
			first_name: params[:user][:first_name], 
			email: params[:user][:email]
		)
		@user.save(validate: false)
		redirect_to '/'
  end
end
