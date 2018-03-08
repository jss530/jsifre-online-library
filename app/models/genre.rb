class Genre < ApplicationRecord
  has_many :books

  validates :name, uniqueness: true
  #accepts_nested_attributes_for :books

end
