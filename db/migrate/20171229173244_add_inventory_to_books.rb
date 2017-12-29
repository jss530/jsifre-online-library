class AddInventoryToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :inventory, :integer
  end
end
