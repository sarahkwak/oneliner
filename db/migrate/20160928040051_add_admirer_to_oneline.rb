class AddAdmirerToOneline < ActiveRecord::Migration
  def change
  	add_column :onelines, :admirer_id, :integer
  end
end
