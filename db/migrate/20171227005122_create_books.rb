class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.text :description
      t.boolean :availability, default: true
      t.string :cost, default: 1
      t.integer :user_id

      t.timestamps
    end
  end
end
