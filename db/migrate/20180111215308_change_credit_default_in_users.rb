class ChangeCreditDefaultInUsers < ActiveRecord::Migration[4.2]
  def change
    change_column :users, :credits, :integer, default: 5
  end
end
