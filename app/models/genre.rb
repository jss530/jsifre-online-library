class Genre < ApplicationRecord
  has_many :books
  
  validates :name, uniqueness: true
  accepts_nested_attributes_for :books

  def books_attributes=(books_attributes)
    books_attributes.values.each do |book_attributes|
      unless book_attributes[:title, :author].blank?
      book = Book.find_or_create_by(book_attributes)
      self.books << book
      end
    end
  end
end
