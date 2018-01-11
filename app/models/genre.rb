class Genre < ApplicationRecord
  has_many :books
  
  validates :name, uniqueness: true

  def books_attributes=(books_attributes)
    books_attributes.values.each do |book_attributes|
      unless book_attributes.blank?
      book = Book.find_or_create_by(book_attributes)
      self.books << book
      end
    end
  end
end
