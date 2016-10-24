class RemoveAdmirerFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :admirer_id, :integer 
  end
end
