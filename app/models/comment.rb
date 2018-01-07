class Comment < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :user
  
  validates :body, length: { minimum: 3 }
end
