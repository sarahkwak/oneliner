class AddContentsToOneliner < ActiveRecord::Migration
  def change
  	add_column :onelines, :contents, :string
  end
end
