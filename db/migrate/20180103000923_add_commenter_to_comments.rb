class AddCommenterToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :commenter, :string
  end
end
