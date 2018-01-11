class AddPaperclipToBook < ActiveRecord::Migration[5.1]
  def change
    add_attachment :books, :image
  end
end
