class Book < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :genre, optional: true
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
     self.user.credits = self.user.credits - self.cost
     self.user.save
  end
  
  def return_book
     self.inventory = self.inventory + 1
     self.rented = false
     self.save
     self.user.credits = self.user.credits + self.cost
     self.user.save
  end
  
end
