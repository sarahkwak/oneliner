class AddAdmirertoUser < ActiveRecord::Migration
  def change
  	add_reference :users, :secret_admirer
  	add_reference :users, :admirer
  end
end
