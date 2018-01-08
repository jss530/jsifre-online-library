class AddOwnerNumbertoBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :owner_number, :integer
  end
end
