class AddMyLibraryIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :my_library_id, :integer
  end
end
