class AddRentedToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :rented, :boolean, default: false
  end
end
