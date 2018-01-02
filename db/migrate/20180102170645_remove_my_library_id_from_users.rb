class RemoveMyLibraryIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :my_library_id
  end
end
