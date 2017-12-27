class RemoveBookIdFromGenres < ActiveRecord::Migration[5.1]
  def change
    remove_column :genres, :book_id, :integer
  end
end
