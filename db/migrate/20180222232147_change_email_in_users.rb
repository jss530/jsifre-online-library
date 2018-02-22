class ChangeEmailInUsers < ActiveRecord::Migration[4.2]
  change_column :users, :email, :string, :null => true
end
