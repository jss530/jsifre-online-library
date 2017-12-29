class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments


  validates :title, presence: true
  validates :author, presence: true
  
  def available?
    if self.inventory != 0
      return true
    else
      return false
    end
  end
  
  def borrow
     self.inventory = self.inventory - 1
     self.rented = true
     self.save
  end
end
