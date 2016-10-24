class AddSecretAdmirertoOneline < ActiveRecord::Migration
  def change
  	add_column :onelines, :secret_admirer_id, :integer
  end
end
