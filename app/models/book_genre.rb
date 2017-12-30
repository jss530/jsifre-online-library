class Book_Genre < ApplicationRecord
   belongs_to :book
   belongs_to :genre
end