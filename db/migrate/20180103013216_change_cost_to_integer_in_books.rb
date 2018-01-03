class ChangeCostToIntegerInBooks < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :cost, :integer
  end
end
