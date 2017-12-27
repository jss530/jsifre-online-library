class Genre < ApplicationRecord
  has_many :books

  validates :name, uniqueness: true
end
