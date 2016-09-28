class CreateOnelines < ActiveRecord::Migration
  def change
    create_table :onelines do |t|

      t.timestamps null: false
    end
  end
end
