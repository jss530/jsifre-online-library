class Book < ApplicationRecord
  belongs_to :users
  belongs_to :genre
  has_many :comments


  validates :title, presence: true
  validates :author, presence: true
end
