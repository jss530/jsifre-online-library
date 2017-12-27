class Comment < ApplicationRecord
  belongs_to :book

  validates :body, length: { minimum: 3 }
end
