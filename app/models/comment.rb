class Comment < ApplicationRecord
  belongs_to :book, optional: true

  validates :body, length: { minimum: 3 }
end
